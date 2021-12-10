<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
<style type="text/css">
/* .mytext { */
/* 	width: 500px; */
/* 	font-size: 12pt; */
/* 	padding: 5px; */
/* } */

/* table { */
/* 	border-collapse: collapse; */
/* 	width: 1000px; */
/* 	height: 700px; */
/* 	align: center; */
/* 	background-color:  */
/* } */

/* span.error { */
/* 	color: red; */
/* 	display: inline-block; */
/* 	font-size: 12pt; */
/* } */
/* p { */
/* 	font-size: 12pt; */
/* 	color: black; */
/* 	margin-left: 100px; */
/* 	margin-top: 10px; */

.main {
  width: 80%;
  margin: 20px auto;
}
table {
  border-spacing: 0;
  width: 100%;
}
tr {
  text-align: center;
  background-color: #eee;
  height: 90px;
  
}
th {
  background-color: #00BFFF;
  color: white;
  padding: 10px;
  height: 50px;

}

th:first-child {
  border-radius: 10px 0 0 0;
}
th:last-child {
  border-radius: 0 10px 0 0;
}
tr:last-child td:first-child {
  border-radius: 0 0 0 10px;
}

tr:last-child td:last-child {
  border-radius: 0 0 10px 0;
}
tbody{

}
#idnumber{
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 100px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
}
#membername{
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 160px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
}
#email{
	outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 200px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
}
#adress{
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 100px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
}
#gender{
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 100px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
}
#age{
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 100px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
}
#membernamea{
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 200px;
    font-size: 18px;
    font-weight: 120;
    font-family: "Microsoft soft";
}
#emaila{
	outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 250px;
    font-size: 18px;
    font-weight: 120;
    font-family: "Microsoft soft";
}
#memberpwda{
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 200px;
    font-size: 18px;
    font-weight: 120;
    font-family: "Microsoft soft";
}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Dashboard</title>

<!-- Custom fonts for this template-->
<link href="/ServerSide/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/ServerSide/css/sb-admin-2.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

var indexPage=1;
$(document).ready(function(){
	   load(indexPage);
	   loadadd();
// 	   $.when(load(indexPage))
// 	   .then(pageIn());
// pageIn();
});

function change(page){
	   indexPage = page;
	   load(indexPage);
}

function load(indexPage){
	   $.ajax({
		   type:'Post',
		   url:'/membersqueryByPage/' + indexPage,
		   dataType:'JSON',
		   contentType:'application/json',
		   success: function(data){
			   
			   console.log('success:' + data);
			   var json = JSON.stringify(data,null,4);
			   console.log('json:' + json);
			   
			   $('#myTable').empty("");
			   
			   if(data==null){
				   $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
			   }else{
				   var table = $('#myTable');
				   table.append("<tr id='mtitle'><th>image</th><th>idnumber</th><th>membername</th><th>email</th><th>adress</th><th>gender</th><th>age</th><th>update</th><th>delete</th></tr>");
// 				   $(data.reverse()).each(function(i,n){
					   $.each(data, function(i,n){
					   var tr = "<tr align='center'>" + 
					   			"<td><image height='70px' width='70px' Style='border-radius:50% ; border : 2px solid #6495ED;' "+
					   			"src='/getMemberImage?id="+n.id+"'/></td>" +
							    "<td><input id='idnumber' style='text-align:center' type='text' value='" + n.id + "' readonly/></td>" +
				    	        "<td><input id='membername' style='text-align:center' type='text' value='" + n.membername + "' /></td>" +
				    	        "<td style='display:none'><input id='memberpwd' type='password' value='"+ n.memberpwd +"' readonly/></td>" +
				    	        "<td><input id='email' style='text-align:center' type='text' value='"+ n.email +"' /></td>" +
				    	        "<td ><input id='adress' type='text' value='"+ n.adress +"' readonly/></td>" +
				    	        "<td ><input id='gender' type='text' value='"+ n.gender +"' readonly/></td>" +
					   	        "<td ><input id='age' type='text' value='"+ n.age +"' readonly/></td>" +
					            
					            "<td><button class='btn btn-success btn-circle' id='update' value='update' onclick='updateMembers(" + n.id + ")'><i class='fas fa-check'/></button></td>" + //修改
					            "<td><button class='btn btn-danger btn-circle' id='delete' value='delete' onclick='deleteMembers(" + n.id + ")'><i class='fas fa-trash'/></button></td>" + //刪除
					            "</tr>";
					   table.append(tr);
				   });	
// 					   var div = document.getElementById('tempinput');
// 					   div.innerHTML = "";
// 					   div.innerHTML += "<input id='totalPages' type='hidden' value='"+data.tolpages+"'>"+
// 							   "<input id='totalElements' type='hidden' value='"+data.pageEles+"'>";
			   }
		   }
	   })
// 	   .then(pageIn());
	}
	   
// 	function pageIn() {
// 		   var totalPages = $('#totalPages').val();
// 		   var totalElements = $('#totalElements').val();
// 		   console.log(totalPages);
// 		   console.log(totalElements);
// 		   $('#showpage').empty("");
// 		   var divpagetol = document.getElementById('dataTable_info');
// 		   var divpage = document.getElementById('showpage');
// 		   tr1 ="Total Pages:"+ totalPages +" "+ "Total Records:"+totalElements;
// 		   divpagetol.innerHTML =tr1;
// 		   tr2="<button id='myPage' class='btn btn-light' color='blue' value='pre' onclick='changepre()'>Previous</button>";
// 		   for(var i=1; i<=totalPages; i++){
// 			   tr2 += "<button id='myPage"+i+"' class='btn btn-light pages' color='blue' value='"+i+"' onclick='change("+i+")'>"+i+"</button>";
// 		   }
// 		   tr2+="<button id='myPage' class='btn btn-light' color='blue' value='next' onclick='changeNext()'>Next</button>";
		   
// 		   divpage.innerHTML =tr2;
// 		   var p ="myPage"+indexPage;
// 		   $(".pages").removeClass('btn-primary');
// 		   $(".pages").removeClass('btn-light');
// 		   $(".pages").addClass('btn-light');
// 		   $("#"+p).removeClass('btn-light');
// 		   $("#"+p).addClass('btn-primary');
// 	   }
	
	
	function loadadd(){
		   var table = $('#addmembers');
		   table.append("<tr id='mtitlea'><th>email</th><th>membername</th><th>password</th><th>add</th></tr>");
			   var tr = "<tr align='center'>" + 
			   			"<td><input id='emaila' style='text-align:center' type='text' value='' /></td>" +
		    	        "<td><input id='membernamea' style='text-align:center' type='text' value=''/></td>" +
		    	        "<td ><input id='memberpwda' type='text' value='' ></td>" +
			            
			            "<td><button class='btn btn-success btn-circle' id='add' value='add' onclick='sendMembers()'><i class='fas fa-check'/></button></td>" + //修改
	
			            "</tr>";
			   table.append(tr);
	}
	function deleteMembers(id){  //刪除function
		var id = id;
	// 	var params = {
	// 		"id":id
	// 	}
		$.ajax({
			 type:'Get',
			 url:'delete/' +id,
			 dataType:'JSON',
			 contentType:'application/json',
	// 		 data:JSON.stringify(params),
			 success: function(data){
					   console.log(data);
					   $('#feedbackupdate').html("刪除成功");
			 }
		});
	}

	function updateMembers(id){  //修改function

		var id = $('#idnumber').val();
		var membername = $('#membername').val();
		var memberpwd = $('#memberpwd').val();
		var age = $('#age').val();
		var gender = $('#gender').val();
		var adress = $('#adress').val();
		var email = $('#email').val();
	
		var params = {
				"id":id,
			"membername":membername,
			"memberpwd":memberpwd,
			"age":age,
			"gender":gender,
			"adress":adress,
			"email":email
		}

		$.ajax({
			 type:'post',
			 url:'update',
			 dataType:'JSON',
			 contentType:'application/json',
			 data:JSON.stringify(params),
			 success: function(data){
					   console.log(data);
					   $('#feedbackupdate').html("修改成功");
			 }
		});
	}

	function sendMembers(){
		var membername = $('#membernamea').val();
		var memberpwd = $('#memberpwda').val();
		var email = $('#emaila').val();
	
		var params = {
			"membername":membername,
			"memberpwd":memberpwd,
			"email":email
		}
	
		$.ajax({
			 type:'post',
			 url:'insert',
			 dataType:'JSON',
			 contentType:'application/json',
			 data:JSON.stringify(params),
			 success: function(data){
					   console.log(data);
					   $('#feedbackadd').html("新增成功");
			 }
		});
	}
//小幫手
let index = 0;
var idnum= ["A274967322", 'A289262174', 'A120475611', 'A173478968', 'A118785817', 'A161615166',  'A280326855']; 
var names= ["張君雅", '成佳英', '姜哲', '曹尚佑', '吳一男', '張德秀',  '韓美女'];
var gender= ["女", '女', '男', '男', '男', '男',  '女'];

function quickInput(){
	document.getElementById('idnumberI').value = idnum[index];
	document.getElementById('membernameI').value = names[index];
	document.getElementById('memberpwdI').value = 'test123';
	document.getElementById('phoneI').value = '0999-777-777';
	document.getElementById('birthdayI').value = '2011-11-11';
	document.getElementById('genderI').value = gender[index];
	document.getElementById('adressI').value = '台北市大安區';
	document.getElementById('emailI').value = 'abc123@gmail.com';
	
	index++;
    if (index >= names.length) {
    	index = 0 ;
	}
	
}

function searchMembers(){
	var email = $("#inputsearchemail").val();
	console.log(email);
	$.ajax({
		 type:'get',
		 url:'/search/'+email,
		 dataType:'JSON',
		 contentType:'application/json',
// 		 data:JSON.stringify(params)
		 success: function(data){
// 			var str = JSON.stringify(data);
// 			var data = Json.parse(str)
			   console.log(data);
			   $('#searchTable').empty("");
				   
			   if(data==null){
				   $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");;
			   }else{
				   var table = $('#searchTable');
				   		var tr = "<tr align='center'>" + 
					   			"<td><image height='70px' width='70px' Style='border-radius:50% ; border : 2px solid #6495ED;' "+
					   			"src='/getMemberImage?id="+data.id+"'/></td>" +
							    "<td><input id='idnumber' style='text-align:center' type='text' value='" + data.id + "' readonly/></td>" +
				    	        "<td><input id='membername' style='text-align:center' type='text' value='" + data.membername + "' /></td>" +
				    	        "<td style='display:none'><input id='memberpwd' type='password' value='"+ data.memberpwd +"' readonly/></td>" +
				    	        "<td><input id='email' style='text-align:center' type='text' value='"+ data.email +"' /></td>" +
				    	        "<td ><input id='adress' type='text' value='"+ data.adress +"' readonly/></td>" +
				    	        "<td ><input id='gender' type='text' value='"+ data.gender +"' readonly/></td>" +
					   	        "<td ><input id='age' type='text' value='"+ data.age +"' readonly/></td>" +
					            
					            "<td><button class='btn btn-success btn-circle' id='update' value='update' onclick='updateMembers(" + data.id + ")'><i class='fas fa-check'/></button></td>" + //修改
					            "<td><button class='btn btn-danger btn-circle' id='delete' value='delete' onclick='deleteMembers(" + data.id + ")'><i class='fas fa-trash'/></button></td>" + //刪除
					            "</tr>";
					   table.append(tr);
			   }
		 }
	   });			   
}

// $("#searchemail").on("cilck",function(){
// 	var email = $("#inputsearchemail").html();
// 	console.log(email);
// 	$.ajax({
// 		 type:'get',
// 		 url:'/update/'+email,
// 		 dataType:'JSON',
// 		 contentType:'application/json',
// // 		 data:JSON.stringify(params)
// 		 success: function(data){
// 			var str = JSON.stringify(data);
// 			var data = Json.parse(str)
// 				   console.log(data);
				   
// 		 }
// 	});
	
// });

</script>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-bus-alt"></i>
                </div>
                <div class="sidebar-brand-text mx-3">無事坐Bus</div>
            </a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="index.html">
					<i class="fas fa-solid fa-address-card"></i> <span>個人資料</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">工作項目</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-bus"></i> <span>班次路線管理</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">車次路線管理:</h6>
                        <a class="collapse-item" href="buttons.html">車次路線</a>
                        <a class="collapse-item" href="cards.html">申請案</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-solid fa-clipboard-list"></i> <span>訂單管理</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">訂單管理:</h6>
						<a class="collapse-item" href="utilities-color.html">Colors</a> <a
							class="collapse-item" href="utilities-border.html">Borders</a> <a
							class="collapse-item" href="utilities-animation.html">Animations</a>
						<a class="collapse-item" href="utilities-other.html">Other</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities2"
				aria-expanded="true" aria-controls="collapseUtilities2"> <i
					class="fas fa-bullhorn"></i> <span>公告管理</span>
			</a>
				<div id="collapseUtilities2" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Custom Utilities:</h6>
						<a class="collapse-item" href="/saveAnnouncement">新增公告</a> <a
							class="collapse-item" href="/showAnnouncement1">編輯公告</a>

					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">其他項目</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>請假申請</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>訂單統計</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item active"><a class="nav-link"
				> <i class="fas fa-light fa-address-book"></i> <span>會員管理</span></a>
			</li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
								<span class="badge badge-danger badge-counter">3+</span>
						</a> <!-- Dropdown - Alerts -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="alertsDropdown">
								<h6 class="dropdown-header">Alerts Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-primary">
											<i class="fas fa-file-alt text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 12, 2019</div>
										<span class="font-weight-bold">A new monthly report is
											ready to download!</span>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-success">
											<i class="fas fa-donate text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 7, 2019</div>
										$290.29 has been deposited into your account!
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="mr-3">
										<div class="icon-circle bg-warning">
											<i class="fas fa-exclamation-triangle text-white"></i>
										</div>
									</div>
									<div>
										<div class="small text-gray-500">December 2, 2019</div>
										Spending Alert: We've noticed unusually high spending for your
										account.
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Show All Alerts</a>
							</div></li>

						<!-- Nav Item - Messages -->
						<li class="nav-item dropdown no-arrow mx-1"><a
							class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
								<!-- Counter - Messages --> <span
								class="badge badge-danger badge-counter">7</span>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="messagesDropdown">
								<h6 class="dropdown-header">Message Center</h6>
								<a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="img/undraw_profile_1.svg"
											alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">Hi there! I am wondering if
											you can help me with a problem I've been having.</div>
										<div class="small text-gray-500">Emily Fowler · 58m</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="img/undraw_profile_2.svg"
											alt="...">
										<div class="status-indicator"></div>
									</div>
									<div>
										<div class="text-truncate">I have the photos that you
											ordered last month, how would you like them sent to you?</div>
										<div class="small text-gray-500">Jae Chun · 1d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="img/undraw_profile_3.svg"
											alt="...">
										<div class="status-indicator bg-warning"></div>
									</div>
									<div>
										<div class="text-truncate">Last month's report looks
											great, I am very happy with the progress so far, keep up the
											good work!</div>
										<div class="small text-gray-500">Morgan Alvarez · 2d</div>
									</div>
								</a> <a class="dropdown-item d-flex align-items-center" href="#">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle"
											src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div>
										<div class="text-truncate">Am I a good boy? The reason I
											ask is because someone told me that people say this to all
											dogs, even if they aren't good...</div>
										<div class="small text-gray-500">Chicken the Dog · 2w</div>
									</div>
								</a> <a class="dropdown-item text-center small text-gray-500"
									href="#">Read More Messages</a>
							</div></li>

						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas
									McGee</span> <img class="img-profile rounded-circle"
								>
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
									Settings
								</a> <a class="dropdown-item" href="#"> <i
									class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
									Activity Log
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									Logout
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->

				
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">會員資料表</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<div class="input-group" style="backgroud-color:white">
							<input id="inputsearchemail" type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." >
							<div class="input-group-append">
								<button id="searchemail" class="btn btn-primary" type="button" onclick="searchMembers()" >
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
						<table id="searchTable"></table>
						</div>
						<div class="card-body" align="center">
							<div class="table-responsive">
<!-- 								<P>XXXXXX</P> -->
								<table id="myTable">
									
								</table>
								<table id="showpage">
								
									<tr>
								      <td>Total Pages:${totalPages} Total Records:${totalElements}</td>
								      <td colspan="3" align="center">Previous
								          <c:forEach var="i" begin="1" end="${totalPages}" step="1">
								              <button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
								          </c:forEach>Next
								      </td>
								   </tr>
								</table>
<!-- 								<div align='right'> -->
<!--                                 	<div class="btn-group" id="showpage"></div> -->
<!--                                 	</div> -->
                                		
<!-- 								<div id = "tempinput"></div> -->
								<hr>
<!-- 								<div id="membersListTitle">InserMembers</div><br> -->
								<div align="center">
									<table id="addmembers" ></table>
									<div id="feedbackadd" align="center"></div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/ServerSide/vendor/jquery/jquery.min.js"></script>
	<script src="/ServerSide/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/ServerSide/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/ServerSide/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/ServerSide/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/ServerSide/js/demo/chart-area-demo.js"></script>
	<script src="/ServerSide/js/demo/chart-pie-demo.js"></script>

</body>

</html>
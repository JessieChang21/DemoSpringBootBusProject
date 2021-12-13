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
.lalaland{
	align-content:center;
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 50px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
}
#idnumber{
	align-content:center;
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 60px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
}
#membername{
	align-content:center;
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 130px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
}
#email{
	align-content:center;
	outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 230px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
}
#adress{
	align-content:center;
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 160px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
}
#gender{
	align-content:center;
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 65px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
}
#age{
	align-content:center;
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 130px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
}
#membernamea{
	align-content:center;
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
	align-content:center;
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
	align-content:center;
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

<title>會員管理</title>

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
	loadadd()
    $.when(load(indexPage))
    .then(pageIn());
});

function change(page){
	   indexPage = page;
	   load(indexPage);
	   var p ="myPage"+indexPage;
	   $(".pages").removeClass('btn-primary');
	   $(".pages").removeClass('btn-light');
	   $(".pages").addClass('btn-light');
	   $("#"+p).removeClass('btn-light');
	   $("#"+p).addClass('btn-primary');
}
function changepre(){
	   if(indexPage>1){
	   indexPage = indexPage-1;
	   load(indexPage);
	   var p ="myPage"+indexPage;
	   $(".pages").removeClass('btn-primary');
	   $(".pages").removeClass('btn-light');
	   $(".pages").addClass('btn-light');
	   $("#"+p).removeClass('btn-light');
	   $("#"+p).addClass('btn-primary');}
}
function changeNext(){
	   if(indexPage<$('#totalPages').val()){
	   indexPage = indexPage+1;
	   load(indexPage);
	   var p ="myPage"+indexPage;
	   $(".pages").removeClass('btn-primary');
	   $(".pages").removeClass('btn-light');
	   $(".pages").addClass('btn-light');
	   $("#"+p).removeClass('btn-light');
	   $("#"+p).addClass('btn-primary');}
}

function pageIn() {
	   var totalPages = $('#totalPages').val();
	   var totalElements = $('#totalElements').val();
	   $('#showpage').empty("");
	   var divpagetol = document.getElementById('dataTable_info');
	   var divpage = document.getElementById('showpage');
//	   tr1 ="Total Pages:"+ totalPages +" "+ "Total Records:"+totalElements;
//	   divpagetol.innerHTML =tr1;
	   tr2="<button id='myPage' class='btn btn-light' color='blue' value='pre' onclick='changepre()'>前一頁</button>";
	   for(var i=1; i<=totalPages; i++){
		   tr2 += "<button id='myPage"+i+"' class='btn btn-light pages' color='blue' value='"+i+"' onclick='change("+i+")'>"+i+"</button>";
	   }
	   tr2+="<button id='myPage' class='btn btn-light' color='blue' value='next' onclick='changeNext()'>下一頁</button>";
	   
	   divpage.innerHTML =tr2;
	   var p ="myPage"+indexPage;
	   $(".pages").removeClass('btn-primary');
	   $(".pages").removeClass('btn-light');
	   $(".pages").addClass('btn-light');
	   $("#"+p).removeClass('btn-light');
	   $("#"+p).addClass('btn-primary');
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
					   $.each(data.list, function(i,n){
					   var tr = "<tr align='center'>" + 
					   			"<td><image height='70px' width='70px' Style='border-radius:50% ; border : 2px solid #6495ED;' "+
					   			"src='/getMemberImage?id="+n.id+"'/></td>" +
							    "<td><input class='lalaland' id='idnumber' style='text-align:center' type='text' value='" + n.id + "' readonly/></td>" +
				    	        "<td><input class='lalaland' id='membername' style='text-align:center' type='text' value='" + n.membername + "' /></td>" +
				    	        "<td style='display:none'><input class='lalaland' id='memberpwd' type='password' value='"+ n.memberpwd +"' readonly/></td>" +
				    	        "<td><input class='lalaland' id='email' style='text-align:center' type='text' value='"+ n.email +"' /></td>" +
				    	        "<td ><input class='lalaland' id='adress' type='text' value='"+ n.adress +"' readonly/></td>" +
				    	        "<td ><input class='lalaland' id='gender' type='text' value='"+ n.gender +"' readonly/></td>" +
					   	        "<td ><input class='lalaland' id='age' type='text' value='"+ n.age +"' readonly/></td>" +
					            
					            "<td><button class='btn btn-success btn-circle' id='update' value='update' onclick='updateMembers(" + n.id + ")'><i class='fas fa-check'/></button></td>" + //修改
					            "<td><button class='btn btn-danger btn-circle' id='delete' value='delete' onclick='deleteMembers(" + n.id + ")'><i class='fas fa-trash'/></button></td>" + //刪除
					            "</tr>";
					   table.append(tr);
				   });	
					   var div = document.getElementById('tempinput');
					   div.innerHTML = "";
					   div.innerHTML += "<input id='totalPages' type='hidden' value='"+data.tolpages+"'>"+
							   "<input id='totalElements' type='hidden' value='"+data.pageEles+"'>";
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
			   			"<td><input class='lalaland' id='emaila' style='text-align:center' type='text' value='' /></td>" +
		    	        "<td><input class='lalaland' id='membernamea' style='text-align:center' type='text' value=''/></td>" +
		    	        "<td ><input class='lalaland' id='memberpwda' type='text' value='' ></td>" +
			            
			            "<td><button class='btn btn-success btn-circle' id='add' value='add' onclick='sendMembers()'><i class='fas fa-check'/></button></td>" + //修改
	
			            "</tr>";
			   table.append(tr);
	}
	function deleteMembers(id){  //刪除function
		
		var yes = confirm('確定要刪除資料嗎？');

		if (yes) {
		    
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
			 }
		});
		alert('刪除成功');
	window.location.href="membersmain.controller";
		} else {
		    alert('已取消刪除');
		}
	}

	function updateMembers(id){  //修改function
		
		var yes = confirm('確定要修改資料嗎？');

		if (yes) {

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
			 }
		});
		alert('修改成功');
		window.location.href="membersmain.controller";
	} else {
	    alert('已取消修改');
	}
	}

	function sendMembers(){
		
		var yes = confirm('確定要新增資料嗎？');

		if (yes) {	
	
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
			 }
		});
		alert('新增成功');
		window.location.href="membersmain.controller";
	} else {
	    alert('已取消新增');
	}
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
							    "<td><input class='lalaland' id='idnumber' style='text-align:center' type='text' value='" + data.id + "' readonly/></td>" +
				    	        "<td><input class='lalaland' id='membername' style='text-align:center' type='text' value='" + data.membername + "' /></td>" +
				    	        "<td style='display:none'><input class='lalaland' id='memberpwd' type='password' value='"+ data.memberpwd +"' readonly/></td>" +
				    	        "<td><input class='lalaland' id='email' style='text-align:center' type='text' value='"+ data.email +"' /></td>" +
				    	        "<td ><input class='lalaland' id='adress' type='text' value='"+ data.adress +"' readonly/></td>" +
				    	        "<td ><input class='lalaland' id='gender' type='text' value='"+ data.gender +"' readonly/></td>" +
					   	        "<td ><input class='lalaland' id='age' type='text' value='"+ data.age +"' readonly/></td>" +
					            
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
		 <c:import url="/WEB-INF/jsp/commons/backsidebar.jsp"></c:import>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<c:import url="/WEB-INF/jsp/commons/backTopbar.jsp"></c:import>
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
								<div>
		<div>
			<div class="dataTables_info" id="dataTable_info" role="status"
				aria-live="polite"></div>
		</div>
		<div align='center'>
			<div class="btn-group" id="showpage"></div>
		</div>

		<div id="tempinput"></div>
		

	</div>
<!-- 								<table id="showpage"> -->
								
<!-- 									<tr> -->
<%-- 								      <td>Total Pages:${totalPages} Total Records:${totalElements}</td> --%>
<!-- 								      <td colspan="3" align="center">Previous -->
<%-- 								          <c:forEach var="i" begin="1" end="${totalPages}" step="1"> --%>
<%-- 								              <button id="myPage" value="${i}" onclick="change(${i})">${i}</button> --%>
<%-- 								          </c:forEach>Next --%>
<!-- 								      </td> -->
<!-- 								   </tr> -->
<!-- 								</table> -->
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
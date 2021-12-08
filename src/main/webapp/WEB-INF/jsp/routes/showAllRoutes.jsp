<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
  
<!DOCTYPE html>
<html>
<head>
<c:if test="${empty employee}">
 <c:redirect url="/backLoginsystemMain.controller" />
</c:if>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<title>Route List</title>

    <!-- Custom fonts for this template -->
    <link href="/ServerSide/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/ServerSide/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/ServerSide/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <style>

        tr.even {
            background-color: rgba(214, 214, 214, 0.884) !important;
        }
        
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
   var indexPage=1;
   $(document).ready(function(){
	   
	   $.when(load(indexPage))
	   .then(pageIn());
	   
	   $.ajax({
		   //送出要求
		   type:'post',
		   url:'/routes/routeAreaAll',
		   dataType:'JSON',  //網頁預期從Server接收的資料型態
		   contentType:'application.json',  //網頁要送到Server的資料型態
		   async:false,
		   //以下為資料data送回來後要做的事
		   success: function(data){
			   console.log('success:' + data);
			   var json = JSON.stringify(data,null,4);
			   console.log('json:' + json);
			   
			   $('#selectArea').empty("");
			   
			   if(data==null){
				   $('#selectArea').prepend("<option>沒搜到</option>");
			   }else{
				   var sele = $('#selectArea');
				   sele.append("<option>選擇地區</option>");
				   
				   $.each(data, function(i,n){
					   var op = "<option value='"+ n.trim() +"'>"+n.trim()+"</option>";
					   sele.append(op);
				   });	
			   }
		   }
	   }).then(selectArea());
	   
	   $.when(findAllTripName()).then(selectTripName());

	   
   });
   
   function findAllTripName(){
	   $.ajax({
		   //送出要求
		   type:'post',
		   url:'/routes/routeTripNameAll',
		   dataType:'JSON',  //網頁預期從Server接收的資料型態
		   contentType:'application.json',  //網頁要送到Server的資料型態
		   async:false,
		   //以下為資料data送回來後要做的事
		   success: function(data){
			   console.log('success:' + data);
			   var json = JSON.stringify(data,null,4);
			   console.log('json:' + json);
			   
			   $('#selectTripName').empty("");
			   
			   if(data==null){
				   $('#selectTripName').prepend("<option>沒搜到</option>");
			   }else{
				   var sele = $('#selectTripName');
				   sele.append("<option>選擇路線名稱</option>");
				   
				   $.each(data, function(i,n){
					   var op = "<option value='"+ n.trim() +"'>"+n.trim()+"</option>";
					   sele.append(op);
				   });	
			   }
		   }
	   });
   }
   
   function pageIn() {
	   var totalPages = $('#totalPages').val();
	   var totalElements = $('#totalElements').val();
	   console.log(totalPages);
	   console.log(totalElements);
	   $('#showpage').empty("");
	   var divpagetol = document.getElementById('dataTable_info');
	   var divpage = document.getElementById('showpage');
	   tr1 ="Total Pages:"+ totalPages +" "+ "Total Records:"+totalElements;
	   divpagetol.innerHTML =tr1;
	   tr2="<button id='myPage' class='btn btn-light' color='blue' value='pre' onclick='changepre()'>Previous</button>";
	   for(var i=1; i<=totalPages; i++){
		   tr2 += "<button id='myPage"+i+"' class='btn btn-light pages' color='blue' value='"+i+"' onclick='change("+i+")'>"+i+"</button>";
	   }
	   tr2+="<button id='myPage' class='btn btn-light' color='blue' value='next' onclick='changeNext()'>Next</button>";
	   
	   divpage.innerHTML =tr2;
	   var p ="myPage"+indexPage;
	   $(".pages").removeClass('btn-primary');
	   $(".pages").removeClass('btn-light');
	   $(".pages").addClass('btn-light');
	   $("#"+p).removeClass('btn-light');
	   $("#"+p).addClass('btn-primary');
   }
   
   function selectArea() {
	   $("#selectArea").change(function () {
		   $("#selectArea option:selected").each(function () {
		             console.log($(this).text());
		             
		             $.ajax({
		       		   //送出要求
		       		   type:'post',
		       		   url:'/routes/routeByArea/' + $(this).text() +'/1',
		       		   dataType:'JSON',  //網頁預期從Server接收的資料型態
		       		   contentType:'application.json',  //網頁要送到Server的資料型態
		       		   async:false,
		       		   //以下為資料data送回來後要做的事
		       		   success: function(data){
		       			   console.log('success:' + data);
		       			   var json = JSON.stringify(data,null,4);
		       			   console.log('json:' + json);
		      			   
		       			   $('#showroutes').empty("");
		      			   
		       			   if(data.pageEles==0){
		       					load(1);
		       			   }else{
		       				   var table = $('#showroutes');
		       				   table.append("<tr align='center' id='ptitle'><th>路線編號</th><th>旅程名稱</th><th>地區</th><th>方向</th><th></th><th></th></tr>");
		      				   
		       				   $.each(data.list, function(i,n){
		       					   var dir;
		       					   if(n.direction==0){
		       						   dir = "去程";
		       						}else{
		       							   dir = "返程";
		       							   }
		       					   if(i%2==0){
		       					   var tr = "<tr align='center' class='even'>" + "<td>" + n.routeId + "</td>" +
		       					            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>"+ "<td>" + dir + "</td>"+
		       					            "<td>" + "<a href='findrouteinfoShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "詳細路線" +"</a></td>"+
		       					            		"<td>" + "<a href='http://localhost:8081/busTimes/findbustimeShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "查詢班表" +"</a></td>"+ "</tr>";
		       					   table.append(tr);
		       					   } else {
		       						   var tr = "<tr align='center' class='odd'>" + "<td>" + n.routeId + "</td>" +
		       				            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>"+ "<td>" + dir + "</td>"+
		       				            "<td>" + "<a href='findrouteinfoShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "詳細路線" +"</a></td>"+
		       				            		"<td>" + "<a href='http://localhost:8081/busTimes/findbustimeShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "查詢班表" +"</a></td>"+ "</tr>";
		       				   table.append(tr);
		       					   }
		       				   });	
		       				   var div = document.getElementById('tempinput');
		       				   div.innerHTML = "";
		       				   div.innerHTML += "<input id='totalPages' type='hidden' value='"+data.tolpages+"'>"+
		       						   "<input id='totalElements' type='hidden' value='"+data.pageEles+"'>";
		      					
		       			   }
		       		   }
 		       	   }).then(pageIn())
						.then(
								DisTripNameByArea($(this).text())
		       	   );
		             
		   });
	   });
   }
   
   function selectTripName() {
	   $("#selectTripName").change(function () {
		   $("#selectTripName option:selected").each(function () {
		             console.log($(this).text());
		             
		             $.ajax({
		       		   //送出要求
		       		   type:'post',
		       		   url:'/routes/routeByTripname/' + $(this).text() +'/1',
		       		   dataType:'JSON',  //網頁預期從Server接收的資料型態
		       		   contentType:'application.json',  //網頁要送到Server的資料型態
		       		   async:false,
		       		   //以下為資料data送回來後要做的事
		       		   success: function(data){
		       			   console.log('success:' + data);
		       			   var json = JSON.stringify(data,null,4);
		       			   console.log('json:' + json);
		      			   
		       			   $('#showroutes').empty("");
		      			   
		       			   if(data.pageEles==0){
		       					load(1);
		       			   }else{
		       				   var table = $('#showroutes');
		       				   table.append("<tr align='center' id='ptitle'><th>路線編號</th><th>旅程名稱</th><th>地區</th><th>方向</th><th></th><th></th></tr>");
		      				   
		       				   $.each(data.list, function(i,n){
		       					   var dir;
		       					   if(n.direction==0){
		       						   dir = "去程";
		       						}else{
		       							   dir = "返程";
		       							   }
		       					   if(i%2==0){
		       					   var tr = "<tr align='center' class='even'>" + "<td>" + n.routeId + "</td>" +
		       					            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>"+ "<td>" + dir + "</td>"+
		       					            "<td>" + "<a href='findrouteinfoShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "詳細路線" +"</a></td>"+
		       					            		"<td>" + "<a href='http://localhost:8081/busTimes/findbustimeShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "查詢班表" +"</a></td>"+ "</tr>";
		       					   table.append(tr);
		       					   } else {
		       						   var tr = "<tr align='center' class='odd'>" + "<td>" + n.routeId + "</td>" +
		       				            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>"+ "<td>" + dir + "</td>"+
		       				            "<td>" + "<a href='findrouteinfoShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "詳細路線" +"</a></td>"+
		       				            		"<td>" + "<a href='http://localhost:8081/busTimes/findbustimeShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "查詢班表" +"</a></td>"+ "</tr>";
		       				   table.append(tr);
		       					   }
		       				   });	
		       				   var div = document.getElementById('tempinput');
		       				   div.innerHTML = "";
		       				   div.innerHTML += "<input id='totalPages' type='hidden' value='"+data.tolpages+"'>"+
		       						   "<input id='totalElements' type='hidden' value='"+data.pageEles+"'>";
		      					
		       			   }
		       		   }
		       	   }).then(pageIn());
		   });
	   });
   }
   
   function DisTripNameByArea(area){
   $.ajax({
		   //送出要求
		   type:'post',
		   url:'/routes/findDisTripNameByArea/'+ area,
		   dataType:'JSON',  //網頁預期從Server接收的資料型態
		   contentType:'application.json',  //網頁要送到Server的資料型態
		   async:false,
		   //以下為資料data送回來後要做的事
		   success: function(data){
			   console.log('success:' + data);
			   var json = JSON.stringify(data,null,4);
			   console.log('json:' + json);
			   
			   $('#selectTripName').empty("");
			   console.log(data.length);
			   if(data.length==0){
  					findAllTripName();
			   }else{
				   var sele = $('#selectTripName');
				   sele.append("<option>選擇路線名稱</option>");
				   
				   $.each(data, function(i,n){
					   var op = "<option value='"+ n.trim() +"'>"+n.trim()+"</option>";
					   sele.append(op);
				   });	
			   }
		   }
	   }).then(selectTripName());
   }
   
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
   
   function load(indexPage){
	   $.ajax({
		   //送出要求
		   type:'post',
		   url:'/routes/routeByPage/' + indexPage,
		   dataType:'JSON',  //網頁預期從Server接收的資料型態
		   contentType:'application.json',  //網頁要送到Server的資料型態
		   async:false,
		   //以下為資料data送回來後要做的事
		   success: function(data){
			   console.log('success:' + data);
			   var json = JSON.stringify(data,null,4);
			   console.log('json:' + json);
			   
			   $('#showroutes').empty("");
			   
			   if(data.list==null){
				   $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");;
			   }else{
				   var table = $('#showroutes');
				   table.append("<tr align='center' id='ptitle'><th>路線編號</th><th>旅程名稱</th><th>地區</th><th>方向</th><th></th><th></th></tr>");
				   
				   $.each(data.list, function(i,n){
					   var dir;
					   if(n.direction==0){
						   dir = "去程";
						}else{
							   dir = "返程";
							   }
					   if(i%2==0){
					   var tr = "<tr align='center' class='even'>" + "<td>" + n.routeId + "</td>" +
					            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>"+ "<td>" + dir + "</td>"+
					            "<td>" + "<a href='findrouteinfoShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "詳細路線" +"</a></td>"+
					            		"<td>" + "<a href='http://localhost:8081/busTimes/findbustimeShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "查詢班表" +"</a></td>"+ "</tr>";
					   table.append(tr);
					   } else {
						   var tr = "<tr align='center' class='odd'>" + "<td>" + n.routeId + "</td>" +
				            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>"+ "<td>" + dir + "</td>"+
				            "<td>" + "<a href='findrouteinfoShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "詳細路線" +"</a></td>"+
				            		"<td>" + "<a href='http://localhost:8081/busTimes/findbustimeShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "查詢班表" +"</a></td>"+ "</tr>";
				   table.append(tr);
					   }
				   });	
				   var div = document.getElementById('tempinput');
				   div.innerHTML = "";
				   div.innerHTML += "<input id='totalPages' type='hidden' value='"+data.tolpages+"'>"+
						   "<input id='totalElements' type='hidden' value='"+data.pageEles+"'>";
					
				   
			   }
		   }
	   });
   }
   
  
   
</script>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-bus"></i>
                </div>
                <div class="sidebar-brand-text mx-3">無事坐Bus</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-solid fa-address-card"></i>
                    <span>個人資料</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                工作項目
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item active">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-bus"></i>
                    <span>車次路線管理</span>
                </a>
                <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">車次路線管理:</h6>
                        <a class="collapse-item active" href="http://localhost:8081/routes/routemain.controller">車次路線</a>
                        <a class="collapse-item" href="cards.html">申請案</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-solid fa-clipboard-list"></i>
                    <span>訂單管理</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">訂單管理:</h6>
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseanou"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-bullhorn"></i>
                    <span>公告管理</span>
                </a>
                <div id="collapseanou" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                其他項目
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>請假申請</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>訂單統計</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-light fa-address-book"></i>
                    <span>會員管理</span></a>
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
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
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
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
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
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/ServerSide/img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/ServerSide/img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/ServerSide/img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                    src="/ServerSide/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">路線總覽</h1>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">搜尋:
									<select id="selectArea"></select>
									<select id="selectTripName"></select>
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="showroutes" width="100%" cellspacing="0">
                                    
                                </table>
                                <div>
                                	<div>
                                		<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
                                		</div>
                                	</div>
                                	<div align='right'>
                                	<div class="btn-group" id="showpage"></div>
                                	</div>
                                		
								<div id = "tempinput"></div>
								
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
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
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
    <script src="/ServerSide/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/ServerSide/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/ServerSide/js/demo/datatables-demo.js"></script>

</body>
</html>
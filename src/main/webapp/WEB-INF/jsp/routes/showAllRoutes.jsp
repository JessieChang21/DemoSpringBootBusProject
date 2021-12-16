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
<link rel="icon" href="/images/bus.svg" type="/image/x-icon" />

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
            background-color: #ECECFF !important;
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
		       					            "<td>" + "<a href='/routes/findrouteinfoShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "詳細路線" +"</a></td>"+
		       					            		"<td>" + "<a href='http://localhost:8081/busTimes/findbustimeShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "查詢班表" +"</a></td>"+ "</tr>";
		       					   table.append(tr);
		       					   } else {
		       						   var tr = "<tr align='center' class='odd'>" + "<td>" + n.routeId + "</td>" +
		       				            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>"+ "<td>" + dir + "</td>"+
		       				            "<td>" + "<a href='/routes/findrouteinfoShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "詳細路線" +"</a></td>"+
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
		       					            "<td>" + "<a href='/routes/findrouteinfoShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "詳細路線" +"</a></td>"+
		       					            		"<td>" + "<a href='http://localhost:8081/busTimes/findbustimeShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "查詢班表" +"</a></td>"+ "</tr>";
		       					   table.append(tr);
		       					   } else {
		       						   var tr = "<tr align='center' class='odd'>" + "<td>" + n.routeId + "</td>" +
		       				            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>"+ "<td>" + dir + "</td>"+
		       				            "<td>" + "<a href='/routes/findrouteinfoShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "詳細路線" +"</a></td>"+
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
					            "<td>" + "<a href='/routes/findrouteinfoShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "詳細路線" +"</a></td>"+
					            		"<td>" + "<a href='http://localhost:8081/busTimes/findbustimeShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "查詢班表" +"</a></td>"+ "</tr>";
					   table.append(tr);
					   } else {
						   var tr = "<tr align='center' class='odd'>" + "<td>" + n.routeId + "</td>" +
				            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>"+ "<td>" + dir + "</td>"+
				            "<td>" + "<a href='/routes/findrouteinfoShow.controller?rid=" + n.routeId + "' class='btn btn-primary'>"+ "詳細路線" +"</a></td>"+
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

        <c:import url="/WEB-INF/jsp/commons/backsidebar.jsp"></c:import>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <c:import url="/WEB-INF/jsp/commons/backTopbar.jsp"></c:import>
                

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">路線總覽</h1>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">路線搜尋:
									<select id="selectArea"></select>
									<select id="selectTripName"></select>
									<form name="busNoSearchForm" action="<c:url value='/busTimes/findbustimeShow.controller' />" method="GET">
										<input id='busNoSearch' style="text-align: left" name="rid" placeholder="請輸入路線編號" type="text">	
										<input type="submit" value="搜尋" class="btn btn-primary btn-sm">		
									</form>
									<hr>
									<form name="busNoSearchForm" action="<c:url value='/busTimes/findbustimeDetailShow.controller' />" method="GET">
										車次搜尋:<input id='busNoSearch' style="text-align: left" name="busNumber" placeholder="請輸入車次編號" type="text">	
										<input type="submit" value="搜尋" class="btn btn-primary btn-sm">		
									</form>
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
                    <a class="btn btn-primary" href="/backlogout.controller">Logout</a>
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
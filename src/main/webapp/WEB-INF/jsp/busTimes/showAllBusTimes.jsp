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

<title>Bus List</title>
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
	 var rid = $('#rid').val();
	 console.log(rid);
	   $.when(load(rid, indexPage))
	   .then(pageIn());
});
 

 function change(page){
	 var rid = $('#rid').val();
	 indexPage = page;
	 load(rid, indexPage);
	   var p ="myPage"+indexPage;
	   $(".pages").removeClass('btn-primary');
	   $(".pages").removeClass('btn-light');
	   $(".pages").addClass('btn-light');
	   $("#"+p).removeClass('btn-light');
	   $("#"+p).addClass('btn-primary');
 }
 function changepre(){
	 var rid = $('#rid').val();
	   if(indexPage>1){
	   indexPage = indexPage-1;
	   load(rid, indexPage);
	   var p ="myPage"+indexPage;
	   $(".pages").removeClass('btn-primary');
	   $(".pages").removeClass('btn-light');
	   $(".pages").addClass('btn-light');
	   $("#"+p).removeClass('btn-light');
	   $("#"+p).addClass('btn-primary');}
 }
 function changeNext(){
	 var rid = $('#rid').val();
	   if(indexPage<$('#totalPages').val()){
	   indexPage = indexPage+1;
	   load(rid, indexPage);
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
 
 
 


function load(rid, indexPage){
 ajaxExc = $.ajax({
	   //送出要求
	   type:'post',
	   url:'/busTimes/bustimeByPageAndRouteId/' + rid + '/' + indexPage,
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
			   table.append("<tr align='center' id='ptitle'><th>班次編號</th><th>RouteID</th><th>TripName</th><th>Area</th><th>起始站</th><th>終點站</th><th>發車時間</th>"+
					   "<th>總座位數</th><th>剩餘座位</th><th>註記</th><th></th><th>申請項目</th></tr>");
			   
			   
			   $.each(data.list, function(i,n){
				   if(i%2==0){
				   var tr = "<tr align='center' class='even'>"+ "<td>"+ n.busNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
				            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
				            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
				            "<td>" + n.remainSeats + "</td>"+"<td>" + n.note + "</td>" + 
				            "<td><a href='<c:url value='/busTimes/findbustimeDetailShow.controller?busNumber="+ n.busNumber +"' />' class='btn btn-primary'>查詢</a></td>"+
				            "<td><a href='<c:url value='/busTimes/Bustodeletetemp.controller/"+ n.busNumber +"/${employee.employeeName}' />' class='btn btn-primary'>變更</a></td></tr>";
				   table.append(tr);
			   } else {
				   var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.busNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
		            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
		            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
		            "<td>" + n.remainSeats + "</td>"+"<td>" + n.note + "</td>" + 
		            "<td><a href='<c:url value='/busTimes/findbustimeDetailShow.controller?busNumber="+ n.busNumber +"' />' class='btn btn-primary'>查詢</a></td>"+
		            "<td><a href='<c:url value='/busTimes/Bustodeletetemp.controller/"+ n.busNumber +"/${employee.employeeName}' />' class='btn btn-primary'>變更</a></td></tr>";
		   			table.append(tr);
			   }
			   }
				   );
			   
			   var div = document.getElementById('tempinput');
			   div.innerHTML += "<input id='totalPages' type='hidden' value='"+data.tolpages+"'>"+
					   "<input id='totalElements' type='hidden' value='"+data.pageEles+"'>";
				
		   }
	   }
 });
 
// 	   $.when(ajaxExc).done(function(){
// 		   var div = document.getElementById('tempinput');
// 		   div.innerHTML += "<input id='totalBusPages' type='hidden' value='${totalBusPages}'>"+
// 				   "<input id='totalBusElements' type='hidden' value='${totalBusElements}'>";
		
	   
// 		   var totalBusPages = $('#totalBusPages').val();
// 		   var totalBusElements = $('#totalBusElements').val();
// 		   console.log(totalBusPages);
	   
// 		   loadunder(totalBusPages, totalBusElements);
// 		   alert("2");
// 	   });
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
                    <h1 class="h3 mb-2 text-gray-800">路線${rid}車次列表</h1>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">
									<form name="busNoSearchForm" action="<c:url value='/busTimes/findbustimeDetailShow.controller' />" method="GET">
										車次搜尋:<input id='busNoSearch' style="text-align: left" name="busNumber" placeholder="請輸入車次編號" type="text">	
										<input type="submit" value="搜尋" class="btn btn-primary btn-sm">		
									</form>
									<hr>
									<a href='<c:url value='/busTimes/tempBusInsert.controller?rid=${rid}' />' class='btn btn-primary'>申請新增班次</a>
                                	
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
                                	<div>
                                	<a href='<c:url value='http://localhost:8081/routes/routemain.controller' />' class='btn btn-primary'>返回路線總覽</a>
                                	<a href='<c:url value='/busTimes/tempbustimemain.controller?tEx=9' />' class='btn btn-primary'>進入班次申請紀錄</a>
									
                                	</div>
                                		
								<div id = "tempinput">
								<input id="rid" type="hidden" value="${rid}">
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
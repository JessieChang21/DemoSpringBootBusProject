<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

<title>新增路線成功</title>
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
$(document).ready(function(){
	$("#showTable tr:even").addClass('even');
});

$(document).ready(function(){
	var rid = $('#rid').val();
	load(rid);
});

function load(rid){
	$.ajax({
	   type:'post',
		   url:'/routes/findrouteinfobyid.controller/' + rid,
		   dataType:'JSON',
		   contentType:'application/json',
		   success: function(data){
			   
			   console.log('success:' + data);
			   var json = JSON.stringify(data,null,4);
			   console.log('json:' + json);
			   
			   $('#showproduct').empty("");
			   
			  if(data==null){
				 $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
		      }else{
		    	 var table = $('#showproduct');
		    	 table.append("<tr align='center' id='ptitle'><th>車站順序</th><th>車站名稱</th><th>行經時間</th></tr>");
		    	
		    	 $.each(data, function(i,n){
		    		if(i%2==0){
				   var tr = "<tr align='center' class='even'>" + "<td>" + n.stationSequence + "</td>" +
				            "<td>" + n.station + "</td>" + "<td>" + n.sequenceTime + "</td>"+"</tr>";
				   table.append(tr);
		    		}else{
		    			var tr = "<tr align='center' class='odd'>" + "<td>" + n.stationSequence + "</td>" +
		            "<td>" + n.station + "</td>" + "<td>" + n.sequenceTime + "</td>"+"</tr>";
		   			table.append(tr);
		    		}
			});
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
                    <h1 class="h3 mb-2 text-gray-800">申請案${bus.testBusNumber}詳情</h1>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3" align='center'>
                            <h6 class="m-0 font-weight-bold text-primary">
								<img src="/images/check.png" width="100" height="100">
                            	已新增路線
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                               <table class = "table table-bordered" id="showTable">
							   	    <tr>
									<td>路線編號:</td><td>${routes.routeId}</td>
									</tr>
									<tr>
									<td>路線名稱:</td><td>${routes.tripName}</td>
									</tr>
									<tr>
									<td>地區:</td><td>${routes.area}</td>
									</tr>
									<tr>
									<td>方向:</td><td>
									<c:if test="${routes.direction==0}">去程</c:if>
							      <c:if test="${routes.direction==1}">返程 </c:if>
									</td>
									</tr>
							   </table>
							   <table class = "table table-bordered" id="showproduct">
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
                                	<a href="<c:url value='http://localhost:8081/routes/routemain.controller' />" class="btn btn-primary">至路線列表</a>
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
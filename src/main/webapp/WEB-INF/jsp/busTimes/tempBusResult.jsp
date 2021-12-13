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

<title>申請成功</title>
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
                    <h1 class="h3 mb-2 text-gray-800">申請案${tempBus.testBusNumber}詳情</h1>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3" align='center'>
                            <h6 class="m-0 font-weight-bold text-primary">
                            <img src="/images/check.png" width="100" height="100">
                            <c:if test="${tempBus.toExamine==0}">已撤回申請 </c:if>
							<c:if test="${tempBus.toExamine!=0}">已進行申請</c:if>
							         
									
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                               <table class = "table table-bordered" id="showTable">
							   	  <tr>
							         <td>申請編號:</td><td>${tempBus.testBusNumber}</td>
							      </tr>
							      <tr>
							         <td>車次編號:</td><td>
							         <c:if test="${tempBus.busNumberPo==null}">未有編號 </c:if>
							         <c:if test="${tempBus.busNumberPo!=''}">${tempBus.busNumberPo}</c:if>
							         </td>
							      </tr>
							      <tr>
							         <td>路線編號:</td><td>${tempBus.routeId}</td>
							      </tr>
							      <tr>
							         <td>路線名稱:</td><td>${tempBus.tripName}</td>
							      </tr>
							      <tr>
							         <td>地區:</td><td>${tempBus.area}</td>
							      </tr>
							      <tr>
							         <td>起始站:</td><td>${tempBus.initialStation}</td>
							      </tr>
							      <tr>
							         <td>終點站:</td><td>${tempBus.finalStation}</td>
							      </tr>
							      <tr>
							         <td>出發時間:</td><td>${tempBus.initialTime}</td>
							      </tr>
							      <tr>
							         <td>總座位數:</td><td>${tempBus.totalSeats}</td>
							      </tr>
							      <tr>
							         <td>旅程總時間:</td><td>${tempBus.travelTime}</td>
							      </tr>
							      <tr>
							         <td>備註:</td><td>${tempBus.note}</td>
							      </tr>
							      
							      <tr>
							      <td>運行頻率(週):</td>
							      <td>
							      <c:if test="${tempBus.sunday==1}">星期日 </c:if>
							      <c:if test="${tempBus.monday==1}">星期一 </c:if>
							      <c:if test="${tempBus.tuesday==1}">星期二 </c:if>
							      <c:if test="${tempBus.wednesday==1}">星期三 </c:if>
							      <c:if test="${tempBus.thursday==1}">星期四 </c:if>
							      <c:if test="${tempBus.friday==1}">星期五 </c:if>
							      <c:if test="${tempBus.saturday==1}">星期六 </c:if>
							      </td>
							      </tr>
							      
							      <tr>
							         <td>申請人:</td><td>${tempBus.empolyeeName}</td>
							      </tr>
							      <tr>
							         <td>申請說明:</td><td>${tempBus.toExamineNote}</td>
							      </tr>
							      <tr>
							         <td>申請日期:</td><td>${tempBus.toExamineDate}</td>
							      </tr>
							      <c:choose >
								      <c:when test="${tempBus.managerName==null}">
								      	  <tr>
									         <td colspan='2' align='center'>尚未審查</td>
									      </tr>
								      </c:when>
								      <c:when test="${tempBus.managerName!=null}">
									      <tr>
									         <td>審查員:</td><td>${tempBus.managerName}</td>
									      </tr>
									      <tr>
									         <td>審查評語:</td><td>${tempBus.examineNote}</td>
									      </tr>
									      <tr>
									         <td>審查日期:</td><td>${tempBus.passDate}</td>
									      </tr>
									  </c:when>
							      </c:choose>
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
	                                	<a href="<c:url value='http://localhost:8081/busTimes/tempbustimemain.controller?tEx=9' />" class="btn btn-primary">進入班次申請紀錄</a>
										<a href="<c:url value='http://localhost:8081/busTimes/findbustimeShow.controller?rid=${tempBus.routeId}' />" class="btn btn-primary">上一頁</a>
									</div>
                                		
								<div id = "tempinput">
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
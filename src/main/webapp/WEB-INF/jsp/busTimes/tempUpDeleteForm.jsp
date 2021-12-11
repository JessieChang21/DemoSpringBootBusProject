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

<title>刪除申請修改</title>
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
                    <h1 class="h3 mb-2 text-gray-800">申請刪除班次</h1>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">
									
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <form:form action="toChangeBus.controller" method="post" modelAttribute="tempBus">
							    <table class="table table-bordered" id="showroutes" width="100%" cellspacing="0">
	                              <tr>
							         <td><form:label path="testBusNumber">申請編號:</form:label></td>
							         <td><form:hidden path="testBusNumber"/>${tempBus.testBusNumber}</td>
							      </tr>
							      <tr>
							         <td><form:label path="busNumberPo">車次編號:</form:label></td>
							         <td><form:hidden path="busNumberPo"/>${tempBus.busNumberPo}</td>
							      </tr>
							      <tr>
									  <td><form:label path="routeId">路線編號:</form:label></td>
									  <td><form:hidden path="routeId"/>${tempBus.routeId}</td>
								      </tr>
								      <tr>
								         <td><form:label path="tripName">路線名稱:</form:label></td>
								         <td><form:hidden path="tripName"/>${tempBus.tripName}</td>
								      </tr>
								      <tr>
								         <td><form:label path="area">地區:</form:label></td>
								         <td><form:hidden path="area"/>${tempBus.area}</td>
								  </tr>
							      <tr>
							         <td><form:label path="initialTime">發車時間:</form:label></td>
							         
							         <td>
							         <form:hidden path="initialTime" />${tempBus.initialTime}
							         </td>
							      </tr>
							      <tr>
							         <td><form:label path="totalSeats">總座位數:</form:label></td>
							         <td><form:hidden path="totalSeats"/>${tempBus.totalSeats}</td>
							      </tr>
							      <tr>
							         <td><form:label path="note">班次備註:</form:label></td>
							         <td><form:hidden path = "note" rows = "3" cols = "30" />${tempBus.note}</td>
							      </tr>
							      <tr>
							        <td><form:label path="note">運行日:</form:label></td>
							        <td><form:hidden path="sunday"/>  <form:hidden path="monday"/>  
							        <form:hidden path="tuesday" /> <form:hidden path="wednesday"/>  
							        <form:hidden path="thursday"/> <form:hidden path="friday"/>
							        <form:hidden path="saturday" />
							        
							         <c:if test="${tempBus.sunday==1}">星期日</c:if>
							      <c:if test="${tempBus.monday==1}">星期一 </c:if>
							      <c:if test="${tempBus.tuesday==1}">星期二 </c:if>
							      <c:if test="${tempBus.wednesday==1}">星期三 </c:if>
							      <c:if test="${tempBus.thursday==1}">星期四 </c:if>
							      <c:if test="${tempBus.friday==1}">星期五 </c:if>
							      <c:if test="${tempBus.saturday==1}">星期六 </c:if>
							     
							        </td>
							     </tr>
							      
							      <tr>
							         <td><label>審查員:</label>
							         <form:hidden path="managerName"/></td>
							         <td>${tempBus.managerName} </td>
							      </tr>
							      
							      <tr>
							         <td><label>審查評語:</label>
							         <form:hidden path="examineNote" rows = "5" cols = "30"/></td>
							         <td>${tempBus.examineNote} </td>
							      </tr>
							      <tr>
							         <td><form:label path="empolyeeName">申請者:</form:label></td>
							         <td><form:hidden path="empolyeeName"/>${tempBus.empolyeeName}</td>
							      </tr>
							      <tr>
							         <td><form:label path="toExamineNote">申請說明:</form:label></td>
							         <td><form:textarea path="toExamineNote" rows = "5" cols = "30"/></td>
							      </tr>
							      
							      <tr align='center'>
							      	 <td colspan="2">
							      	 <input type="submit" name="delete" value="申請刪除" class="btn btn-danger" onclick="return(confirm('是否確認要送出刪除申請？'))">
							      	 &emsp;&emsp;&emsp;
							      	 <input type="submit" name="noWant" value="撤回申請" class="btn btn-warning" onclick="return(confirm('是否確認要撤回申請？'))">
							      	 </td>
							      </tr>
                                </table>
                            </form:form>
                                
                                <div>
								<div id = "tempinput"></div>
									<a href="<c:url value='http://localhost:8081/busTimes/tempbustimemain.controller?tEx=9' />" class="btn btn-primary">返回申請列表</a>
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
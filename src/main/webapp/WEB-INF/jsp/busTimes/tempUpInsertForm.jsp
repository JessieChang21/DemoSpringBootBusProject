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

<title>新增案件修改</title>
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
	
	insertTime();
	var initialT = $('#initialTimeBefore').val();
	var hhB = initialT.substring(0,2);
	var mmB = initialT.substring(3,5);
	
	var hh = hhB;
	var mm = mmB;
	var time = document.getElementById("timeError");
	
	$("#idSelectHour").change(function () {
		  $("#idSelectHour option:selected").each(function () {
		            hh = $(this).text();
		  });
// 		  $("#initialTimech").text(str);
			console.log(hh);
		  if(hh!="--" && mm!="--" && hh!="" && mm!=""){
			  	tt = "<input type='hidden' name='initialTime' value='" + hh + ":"+ mm + "' />";
				time.innerHTML = tt;
			} else {
				tt = "<span style='color:red; font-size:8px;'>請選擇發車時間</span>";
				time.innerHTML = tt;
			}
		})
	$("#idSelectMin").change(function () {
		  $("#idSelectMin option:selected").each(function () {
		            mm = $(this).text();
		  });
		  console.log(mm);
		  if(hh!="--" && mm!="--" && hh!="" && mm!=""){
			  	tt = "<input type='hidden' name='initialTime' value='" + hh + ":"+ mm + "' />";
				time.innerHTML = tt;
			} else {
				tt =  "<span style='color:red; font-size:8px;'>請選擇發車時間</span>";
				time.innerHTML = tt;
			}
	})
	
});


function insertTime(){
	//取原本的發車時間
	var initialT = $('#initialTimeBefore').val();
	var hhB = initialT.substring(0,2);
	var mmB = initialT.substring(3,5);
	
	
	var theSeleH = $('#idSelectHour');
 	var theSeleM = $('#idSelectMin');
 	var op="";
 	for(var i=0; i<24; i++){
 		if(i>9){
 			if((i+"")==hhB){
 				op += "<option value='"+ i +"' selected='selected'>"+ i +"</option>";
 			} else {
 				op += "<option value='"+ i +"'>"+ i +"</option>";
 			}
 		} else {
 			if(('0'+i)==hhB){
 				op += "<option value='0"+ i +"' selected='selected'>0"+ i +"</option>";
 			} else{
 				op += "<option value='0"+ i +"'>0"+ i +"</option>";
 	 			
 			}
 		}
 	}
 	theSeleH.append(op);
 	
 	var op2="";
 	for(var i=0; i<60; i+=5){
 		if(i>9){
 			if((i+"")==mmB){
 				op2 += "<option value='"+ i +"' selected='selected'>"+ i +"</option>";
 			} else {
 				op2 += "<option value='"+ i +"'>"+ i +"</option>";
 			}} else {
 				if(('0'+i)==mmB){
 	 				op2 += "<option value='0"+ i +"' selected='selected'>0"+ i +"</option>";
 	 			} else{
 	 				op2 += "<option value='0"+ i +"'>0"+ i +"</option>";
 	 	 		}
 			}
 	}
 	theSeleM.append(op2);
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
                    <h1 class="h3 mb-2 text-gray-800">新增班次修改</h1>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">
									
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <form:form action="addTempBus.controller" method="post" modelAttribute="tempBus">
 								   <table class="table table-bordered" id="showroutes" width="100%" cellspacing="0">
                                      <tr>
								         <td><form:label path="testBusNumber">申請編號:</form:label></td>
								         <td><form:hidden path="testBusNumber"/>${tempBus.testBusNumber}</td>
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
								        <td id="initialTimech"><input id='initialTimeBefore' type='hidden' value='${tempBus.initialTime}'>
										<select id = "idSelectHour"></select>:
								        <select id = "idSelectMin"></select>
								        <span id="timeError" style='color:red; font-size:8px;'><input type='hidden' name='initialTime' value='${tempBus.initialTime}'/>${errors.initialTimeE}</span>
								        </td>
								     </tr>
								      <tr>
								         <td><form:label path="totalSeats">總座位數:</form:label></td>
								         <td><form:input path="totalSeats"/></td>
								      </tr>
								      <tr>
								         <td><form:label path="note">班次備註:</form:label></td>
								         <td><form:textarea path = "note" rows = "3" cols = "30" /></td>
								      </tr>
								      <tr>
								         <td><form:label path="note">運行日:</form:label></td>
								         <td><form:checkbox path="sunday" value="1"/>星期日  <form:checkbox path="monday" value="1"/>星期一  
								         <form:checkbox path="tuesday" value="1"/>星期二  <form:checkbox path="wednesday" value="1"/>星期三  
								         <form:checkbox path="thursday" value="1"/>星期四  <form:checkbox path="friday" value="1"/>星期五  
								         <form:checkbox path="saturday" value="1"/>星期六</td>
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
								      	 <form:hidden path="toExamineDate" value = "${tempBus.toExamineDate}"/>
								         <form:hidden path="initialStation" value = "${tempBus.initialStation}"/>
									      	<form:hidden path="finalStation" value = "${tempBus.finalStation}"/>
									      	<form:hidden path="travelTime" value = "${tempBus.travelTime}"/>
									      <form:hidden path="passDate"/>
									      
								      	 <input type="submit" name="toExamine" value="申請新增" class="btn btn-primary" onclick="return(confirm('是否確認要送出新增申請？'))">
								      	 &emsp;&emsp;&emsp;
								      	 <input type="submit" name="noWantNew" value="撤回申請" class="btn btn-warning" onclick="return(confirm('是否確認要撤回申請？'))">
								      	 </td>
								      </tr>
                                </table>
                            </form:form>
                                
                                <div>
								<div id = "tempinput"></div>
									<a href="<c:url value='http://localhost:8081/busTimes/tempbustimemain.controller?tEx=9' />" class="btn btn-primary">返回班次申請紀錄</a>
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
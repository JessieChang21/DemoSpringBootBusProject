<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
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
$(document).ready(function() {
	getsubstitute();
	$('#timeperiod').empty("");
	var timeperiod = $('#timeperiod');
	timeperiod.append($("<option value='AM'>早上</option>"));
	timeperiod.append($("<option value='PM'>下午</option>"));	
});
function getsubstitute(){
	$.ajax({
		   type:'Post',
		   url:'/GetHoliday/getsubstituteid',
		   dataType:'JSON',
		   contentType:'application/json',
		   success: function(data){
			   console.log('success:' + data);
			   var json = JSON.stringify(data,null,4);
			   console.log('json:' + json);
			   var parsedObjinArray = JSON.parse(json); 
			   
			   $('#substituteid').empty("");
			   $('#substitutename').empty("");
			   var substituteid = $('#substituteid');
			   $.each(parsedObjinArray, function(i,n){
				   substituteid.append("<option value='"+n.id+"'>"+n.id +"-"+n.employeename+"</option>");
			   });
		   },error: function() {console.log("error-getJob");}
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
					<h1 class="h3 mb-2 text-gray-800">員工請假</h1>
					<p class="mb-4">
						<a target="_blank" href="https://datatables.net">official
							DataTables documentation</a>.
					</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">員工請假</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
	<form action="getholidayInsert" method ="post">
		<table class="table table-bordered" id="showemployees"width="100%" cellspacing="0">
			<tr>
				<th><label>請假人員ID</label></th>
				<th><label id='employeeid' name='employeeid'>${empId}</label></th>
				<th><label>請假人員姓名</label></th>
				<th><label id='employeename' name='employeename'>${empName}</label></th>
			</tr>
			<tr>
				<td><label>剩餘假期時數</label></td>
				<td colspan='3'><label id='LaveHours' name='LaveHours'>${LaveHours} 小時(天*8時)</label></td>
			</tr>
			<tr>
				<td><label>代班人員</label></td>
				<td colspan='3'><select id="substituteid" name="substituteid"></select></td>
			</tr>
			<tr>
				<td><label>請假日期</label></td>
				<td><input id="date" name="date" type="date" value=''></td>
				<td><label>請假時段</label></td>
				<td><select id="timeperiod" name="timeperiod"></select></td>
			</tr>
			<tr>
				<td colspan='4'>
					<button type="submit" value="GetHolidayInsert"">確認送出</button>
					<button><a href="<c:url value='/GetHoliday/getholidayindex'/> " >回前頁</a></button>
					<font color="red">${errors.errors}</font>
				</td>
			</tr>
		</table>
	</form>
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
	<script src="/ServerSide/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/ServerSide/js/demo/chart-area-demo.js"></script>
	<script src="/ServerSide/js/demo/chart-pie-demo.js"></script>

</body>
</html>
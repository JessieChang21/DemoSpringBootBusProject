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

<title>Employee List</title>

<!-- Custom fonts for this template-->
<link href="/ServerSide/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/ServerSide/css/sb-admin-2.min.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	var indexPage = 1;
	$(document).ready(function() {
		load(indexPage);
	});

	function change(page) {
		indexPage = page;
		load(indexPage);
	}
	
	function load(indexPage){
		   $.ajax({
			   type:'Post',
			   url:'/employee/queryByPage/' + indexPage,
			   dataType:'JSON',
			   contentType:'application/json',
			   success: function(data){
				   console.log('success:' + data);
				   var json = JSON.stringify(data,null,4);
				   console.log('json:' + json);
				   
				   $('#showemployees').empty("");
				   if(data==null){
					   $('table').prepend("<tr><td colspan='2'>查無員工資料</td></tr>");;
				   }else{
					   var table = $('#showemployees');
					   table.append("<tr id='etitle'><th>員工ID</th><th>員工姓名</th><th>性別</th><th>職稱</th><th>職等</th></tr>");
					   $.each(data, function(i,n){
						    table.append("<tr align='center'>");
						    table.append("<td><a href='employQuery.controller?pid=" + n.id + "'>" + n.id + "</a></td>");
							table.append("<td>" + n.employeename + "</td>");
							table.append("<td style='display:none'>"+ n.groupid +"</td>");
						    if(n.gender == "M"){
						    	table.append("<td>男</td>");
						    }else{
						    	table.append("<td>女</td>");
						    }
						    if($.trim(n.jobid) == "1"){
						    	table.append("<td>站務員</td>");
						    }else{
						    	table.append("<td>駕駛員</td>");
						    }
			    	        //table.append("<td>"+ n.jobid +"</td>");
			    	        if($.trim(n.jobid) == "1"){
						    	table.append("<td>專員</td>");
						    }else{
						    	table.append("<td>經理</td>");
						    }
			    	        //table.append("<td>"+ n.rankid +"</td>");
			    	    	table.append("<td style='display:none'>"+ n.enterdate +"</td>");
			    	    	table.append("<td style='display:none'>"+ n.seniority +"</td>");
				            
			    	    	table.append("</tr>");
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
					<h1 class="h3 mb-2 text-gray-800">員工資料查詢</h1>
					<p class="mb-4">
						<a target="_blank" href="https://datatables.net">official
							DataTables documentation</a>.
					</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">員工資料查詢</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="showemployees"width="100%" cellspacing="0"></table>

								<table id="showpage">
									<tr>
										<td>Total Pages:${totalPages} Total
											Records:${totalElements}</td>
										<td id="feedbackupdate" align="center" />
										<td colspan="3" align="right">Previous <c:forEach var="i"
												begin="1" end="${totalPages}" step="1">
												<button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
											</c:forEach>Next
										</td>
									</tr>
									<tr>
										<td><a href='/employee/employadd.controller'
											class="btn btn-primary">新增員工</a></td>
									</tr>
								</table>
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
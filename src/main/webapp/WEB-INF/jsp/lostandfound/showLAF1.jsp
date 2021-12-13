<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
<style type="text/css">
body, table {
	font-family: verdana, arial, sans-serif;
	font-size: 14px;
	border-collapse: collapse;
}

td, th {
	padding: 3px 3px;
	margin: 0px;
	border: 1px solid #BBB;
	white-space: nowrap;
}

a {
	text-decoration: none
}

a:hover {
	text-decoration: underline
}

a:visited {
	color: blue;
}

table {
	margin-left: auto;
	margin-right: auto;
}

.content {
	height: 15px;
	width: 100px;
	overflow: hidden;
	text-overflow: ellipsis
}

input[type='checkbox'] {
	visibility: hidden;
	position: absolute;
}

input[type='checkbox']:checked+.content {
	height: auto;
	width: auto;
}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>公告管理</title>

<!-- Custom fonts for this template-->
<link href="/ServerSide/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/ServerSide/css/sb-admin-2.min.css" rel="stylesheet">

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
					<h1 class="h3 mb-2 text-gray-800">遺失物編輯</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">DataTables</h6>
							<form method='POST' action="<c:url value='/selectLAFbyid'/>">
		<input name='id' type='text'> <input type='submit'
			style="width: 200px; height: 40px; border: 2px blue none; background-color: white; font-size: 130%"
			value='搜尋'>
	</form>
						</div>
						<div class="card-body" align="center">
							<div class="table-responsive">
								<c:choose>
									<c:when test="${!empty list2}">
										<table border="1">
											<tr>
												<th width='150'>編號</th>
												<th width='150'>巴士編號</th>
												<th width='150'>物品名聲</th>
												<th width='150'>拾獲地點</th>
												<th width='150'>拾獲時間</th>
												<th width='150'>編輯資料</th>
												<th width='150'>刪除資料</th>
											</tr>
											<c:forEach var="laf" items="${list2}">
												<tr>

													<td align='center'>${laf.id}</td>
													<td align='center'>${laf.itbussnumber}</td>
													<td align='center'>${laf.itname}</td>
													<td align='center'>${laf.itplace}</td>
													<td align='center'>${laf.itdate}</td>
													<td align='center'><a
														href="<c:url value='updatelostandfound/${laf.id}' />">編輯</a></td>
													<td align='center'><a
														href="<c:url value='deletelostandfound/${laf.id}' />">刪除</a></td>
												</tr>
											</c:forEach>
										</table><BR/>
										<table border="1">
											<tr>
												<th width='150'>編號</th>
												<th width='150'>巴士編號</th>
												<th width='150'>物品名聲</th>
												<th width='150'>拾獲地點</th>
												<th width='150'>拾獲時間</th>
												<th width='150'>編輯資料</th>
												<th width='150'>刪除資料</th>
											</tr>
											<c:forEach var="laf" items="${list}">
												<tr>
													<td align='center'>${laf.id}</td>
													<td align='center'>${laf.itbussnumber}</td>
													<td align='center'>${laf.itname}</td>
													<td align='center'>${laf.itplace}</td>
													<td align='center'>${laf.itdate}</td>
													<td align='center'><a
														href="<c:url value='updatelostandfound/${laf.id}' />">編輯</a></td>
													<td align='center'><a
														href="<c:url value='deletelostandfound/${laf.id}' />">刪除</a></td>
												</tr>
											</c:forEach>
										</table>
									</c:when>
									<c:otherwise>
										<table border="1">
											<tr>
												<th width='150'>編號</th>
												<th width='150'>巴士編號</th>
												<th width='150'>物品名聲</th>
												<th width='150'>拾獲地點</th>
												<th width='150'>拾獲時間</th>
												<th width='150'>編輯資料</th>
												<th width='150'>刪除資料</th>
											</tr>
											<c:forEach var="laf" items="${list}">
												<tr>
													<td align='center'>${laf.id}</td>
													<td align='center'>${laf.itbussnumber}</td>
													<td align='center'>${laf.itname}</td>
													<td align='center'>${laf.itplace}</td>
													<td align='center'>${laf.itdate}</td>
													<td align='center'><a
														href="<c:url value='updatelostandfound/${laf.id}' />">編輯</a></td>
													<td align='center'><a
														href="<c:url value='deletelostandfound/${laf.id}' />">刪除</a></td>
												</tr>
											</c:forEach>
										</table>
									</c:otherwise>

								</c:choose>
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
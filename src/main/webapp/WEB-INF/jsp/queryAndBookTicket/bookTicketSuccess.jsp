<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="colorlib">
<meta name="description" content="">
<meta name="keywords" content="">
<meta charset="UTF-8">
<title>訂票成功</title>
<link rel="icon" href="images/bus.svg" type="image/x-icon" />
<style type="text/css">
#banner{
    background-image: url("/images/queryRoutes/tai.jpg");
}
table {
	font-family: "Poppins", sans-serif;
	border-collapse: collapse;
	text-align: center;
	margin: auto;
	width:73vw;
/* 	margin-left:23% */
}

table tr th {
	background-color: darkslategray;
	color:white;
	font-size: 1.3em;
	font-family: "Poppins", sans-serif;
	border: 1px solid white;
}

table td{
	color:black;
	font-size: 1.2em;
	border: 1px solid gray;
}

table thead tr, table tbody tr {
	line-height: 32px;
}

table tr:last-child td:first-child, table tr:last-child td:nth-child(2),
	table tr:last-child td:nth-child(3), table tr:last-child td:last-child
	/*設定table表格最後一列底部邊框 */ {
/* 	border-bottom: 2px solid #000; */
}


table tr:first-child th:first-child {
	border-top-left-radius: 12px;
}

table tr:first-child th:last-child {
	border-top-right-radius: 12px;
}

table tr:last-child td:first-child {
	border-bottom-left-radius: 12px;
}

table tr:last-child td:last-child {
	border-bottom-right-radius: 12px;
}
#showInfo{
	font-size: 1.5em;
	font-family: "Poppins", sans-serif;
	font-weight: bold;
	color:darkgray;
	margin-left:13vw;
}
#totalPrice{
	font-size: 1.5em;
	font-family: "Poppins", sans-serif;
	font-weight: bold;
	color:#f8b600;
	margin-left:70vw;
}
</style>
<!-- CSS ============================================= -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<link rel="stylesheet" href="/travelista/css/linearicons.css">
<link rel="stylesheet" href="/travelista/css/font-awesome.min.css">
<link rel="stylesheet" href="/travelista/css/bootstrap.css">
<link rel="stylesheet" href="/travelista/css/magnific-popup.css">
<link rel="stylesheet" href="/travelista/css/jquery-ui.css">
<link rel="stylesheet" href="/travelista/css/nice-select.css">
<link rel="stylesheet" href="/travelista/css/animate.min.css">
<link rel="stylesheet" href="/travelista/css/owl.carousel.css">
<link rel="stylesheet" href="/travelista/css/main.css">
</head>
<body>
	<!-- <script -->
	<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
	<script src="/travelista/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="/travelista/js/popper.min.js"></script>
	<script src="/travelista/js/vendor/bootstrap.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="/travelista/js/jquery-ui.js"></script>
	<script src="/travelista/js/easing.min.js"></script>
	<script src="/travelista/js/hoverIntent.js"></script>
	<script src="/travelista/js/superfish.min.js"></script>
	<script src="/travelista/js/jquery.ajaxchimp.min.js"></script>
	<script src="/travelista/js/jquery.magnific-popup.min.js"></script>
	<script src="/travelista/js/jquery.nice-select.min.js"></script>
	<script src="/travelista/js/owl.carousel.min.js"></script>
	<script src="/travelista/js/mail-script.js"></script>
	<script src="/travelista/js/main.js"></script>

	<!-- HTML ============================================= -->
<c:import url="/WEB-INF/jsp/commons/header.jsp" />
	<!-- start banner Area -->
	<section class="about-banner relative" id="banner">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">訂票成功</h1>
					<p class="text-white link-nav">
						<a href="/mainpage">首頁 </a> <span class="lnr lnr-arrow-right"></span>
						<span> 訂票成功</span>
					</p>
				</div>
			</div>
		</div>

	</section>
	<!-- End banner Area -->
	<!-- -------------------------------------------------------------------- -->
	<br /><br />
	<div id="showInfo">您的訂票資訊如下:</div>
	<br />
		<table>
			<tr>
				<th>訂票編號</th>
				<th>車次編號</th>
				<th>路線名稱</th>
				<th>起站</th>
				<th>迄站</th>
				<th>乘車日期</th>
				<th>發車時間</th>
				<th>旅程時間</th>
				<th>座位編號</th>
				<th>票種</th>
				<th>票價</th>
			</tr>
			<c:forEach var="aBean" items="${memberorder}">
			<tr>
				<td>${aBean.orderid}</td>
				<td>${aBean.busnumber}</td>
				<td>${aBean.tripname}</td>
				<td>${aBean.initialstation}</td>
				<td>${aBean.finalstation}</td>
				<td>${aBean.traveldate}</td>
				<td>${aBean.initialtime}</td>
				<td>${aBean.traveltime}</td>
				<td>${aBean.seat}</td>
				<td>${aBean.tickettype}</td>
				<td>${aBean.price}</td>
			</tr>
			</c:forEach>
		</table>
		<br><br>
		<div id="totalPrice"> 訂單總金額 : NT$ ${totalPrice} 元整</div>
	<!-- -------------------------------------------------------------------- -->
	<c:import url="/WEB-INF/jsp/commons/footer.jsp" />
	
</body>
</html>

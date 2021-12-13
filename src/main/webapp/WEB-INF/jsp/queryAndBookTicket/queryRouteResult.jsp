<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="colorlib">
<meta name="description" content="">
<meta name="keywords" content="">
<meta charset="UTF-8">
<title>車次查詢結果</title>
<link rel="icon" href="images/bus.svg" type="image/x-icon" />
<style type="text/css">
#banner{
    background-image: url("/images/queryRoutes/tai.jpg");
}
#all, #d0, #d1 {
	font-size: 1.2em;
}

#left {
	text-align: center;
	width: 300px;
}

#tripname, #tripdate, #triptime {
	float:left;
	font-size: 1.5em;
	font-family: "Poppins", sans-serif;
	font-weight: bold;
	background-color: #f8b600;
	border-radius: 10px;
	margin-bottom: 3%;
	margin-left: 4%;
	width: 300px;
	height: 50px;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
}

.none {
	float: right;
	margin-right: 35%;
	font-size: 1.5em;
	font-family: "Poppins", sans-serif;
	font-weight: bold;
	background-color: darkslategray;
	border-radius: 10px;
	width: 300px;
	height: 50px;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
}

table {
	font-family: "Poppins", sans-serif;
	border-collapse: collapse;
	text-align: center;
	margin: auto;
	width:73vw;
	margin-left:23%
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
/* 	height: 50px; */
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
					<h1 class="text-white">車次查詢結果</h1>
					<p class="text-white link-nav">
						<a href="/mainpage">首頁 </a> <span class="lnr lnr-arrow-right"></span>
						<span> 車次查詢結果</span>
					</p>
				</div>
			</div>
		</div>

	</section>
	<!-- End banner Area -->
	<!-- -------------------------------------------------------------------- -->
	<BR />
	<div id="left">
		<span id="tripname">查詢路線 : ${inputdataObj.tripname}</span>
		<span id="tripdate">查詢日期 : ${inputdataObj.traveldate}</span>
		<span id="triptime">查詢時間 : ${inputdataObj.initialtime}</span>
		<span id="triptime">查詢人數 : 大人:${inputdataObj.adult}人 ,小孩: ${inputdataObj.children}人</span>
	</div>

	<c:choose>
		<c:when test="${empty result}">
			<div id="all" class="none">暫無相關班次資訊</div>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${empty byTripnameResult0}">
			<div id="d0" class="none">暫無順向班次資訊</div>
		</c:when>
		<c:otherwise>
			<div id="table_right">
				<form action="/members/bookTicket.controller" method="POST">
					<table id="showbus">
						<tr>
							<th colspan="10">順向</th>
						</tr>
						<tr>
							<th>車次</th>
							<th>起站</th>
							<th>迄站</th>
							<th>發車時間</th>
							<th>旅程時間</th>
							<th>全票票價</th>
							<th>半票票價</th>
							<th>剩餘座位</th>
							<th>備註</th>
							<th>訂票</th>
						</tr>
						<c:forEach var="aBean" items="${byTripnameResult0}">
							<tr>
								<td>${aBean.busnumber}</td>
								<td>${aBean.initialstation}</td>
								<td>${aBean.finalstation}</td>
								<td>${aBean.initialtime}</td>
								<td>${aBean.traveltime}</td>
								<td>${aBean.adultprice}</td>
								<td>${aBean.childrenprice}</td>
								<td>${aBean.remainseats}</td>
								<td>${aBean.note}</td>
								<td><button class="btn btn-outline-warning" type="submit" name="bookBus"
										value="${aBean.busnumber}">BookNow!</button></td>
							</tr>
						</c:forEach>
					</table>
					<input id="tripname" value="${inputdataObj.tripname}" type="hidden">
					<input id="traveldate" value="${inputdataObj.traveldate}"
						type="hidden"> <input id="weekday"
						value="${inputdataObj.weekday}" type="hidden"> <input
						id="initialtime" value="${inputdataObj.initialtime}" type="hidden">
					<input id="adult" value="${inputdataObj.adult}" type="hidden">
					<input id="children" value="${inputdataObj.children}" type="hidden">
					<input id="inputdata" name="inputdata" type="hidden">
				</form>
			</div>
		</c:otherwise>
	</c:choose>
	<br>
	<br>
	<c:choose>
		<c:when test="${empty byTripnameResult1}">
			<div id="d1" class="none">暫無逆向班次資訊</div>
		</c:when>
		<c:otherwise>
			<div id="table_right">
				<form action="/members/bookTicket.controller" method="POST">
					<table id="showbus">
						<tr>
							<th colspan="10">逆向</th>
						</tr>
						<tr>
							<th>車次</th>
							<th>起站</th>
							<th>迄站</th>
							<th>發車時間</th>
							<th>旅程時間</th>
							<th>全票票價</th>
							<th>半票票價</th>
							<th>剩餘座位</th>
							<th>備註</th>
							<th>訂票</th>
						</tr>
						<c:forEach var="aBean" items="${byTripnameResult1}">
							<tr>
								<td>${aBean.busnumber}</td>
								<td>${aBean.initialstation}</td>
								<td>${aBean.finalstation}</td>
								<td>${aBean.initialtime}</td>
								<td>${aBean.traveltime}</td>
								<td>${aBean.adultprice}</td>
								<td>${aBean.childrenprice}</td>
								<td>${aBean.remainseats}</td>
								<td>${aBean.note}</td>
								<td><button class="btn btn-outline-warning" type="submit" name="bookBus"
										value="${aBean.busnumber}">BookNow!</button></td>
							</tr>
						</c:forEach>
					</table>

					<input id="tripname" value="${inputdataObj.tripname}" type="hidden">
					<input id="traveldate" value="${inputdataObj.traveldate}"
						type="hidden"> <input id="weekday"
						value="${inputdataObj.weekday}" type="hidden"> <input
						id="initialtime" value="${inputdataObj.initialtime}" type="hidden">
					<input id="adult" value="${inputdataObj.adult}" type="hidden">
					<input id="children" value="${inputdataObj.children}" type="hidden">
					<input id="inputdata" name="inputdata" type="hidden">
				</form>
			</div>
		</c:otherwise>
	</c:choose>
	

	<!-- -------------------------------------------------------------------- -->
	<c:import url="/WEB-INF/jsp/commons/footer.jsp" />

	<script type="text/javascript">
		var params = {
			"tripname" : $("#tripname").val(),
			"traveldate" : $("#traveldate").val(),
			"weekday" : $("#weekday").val(),
			"initialtime" : $("#initialtime").val(),
			"adult" : $("#adult").val(),
			"children" : $("#children").val()
		}

		$("#inputdata").val(JSON.stringify(params));

		window.onload = function() {
			var all = $("#all").html();
			var d0 = $("#d0").html();
			var d1 = $("#d1").html();

			if (all == "暫無相關班次資訊") {
				$("#d0").removeClass("none");
				$("#d1").removeClass("none");
				$("#d0").html("");
				$("#d1").html("");

			}
		}
	</script>

</body>

</html>
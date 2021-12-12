
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<style type="text/css">
.wrap {
	border: 0px solid black;
	width: 1150px;
	min-height: 800px;
	margin: 0px;
	padding: 1px;
	background-color: none;
}

.header {
	border: 0px solid black;
	width: 1120px;
	height: 80px;
	margin: 10px;
	padding: 10px;
	height: 80px;
}

.left {
	border: 0px solid black; width : 180px;
	height: 600px;
	float: left;
	margin: 10px;
	width: 180px;
}

.center {
	width: 900px;
	border: 0px solid black;
	/*height: 600px;*/
	margin: 10px;
	margin-left: 30PX;
	float: left;
	color: Black;
}

.header ul {
	float: right;
	margin-top: 15px;
	margin-right: 20px;
}

.header ul li {
	float: left;
	margin-right: 25px;
	font-size: 18px;
}

.header ul li a {
	text-decoration: none;
	font-size: x-large;
	background-color: #f2b201;
	border-radius: 5px;
	color: black;
}

#Area2Routes {
	background-color: #F5F5F6;
	border-radius: 15px;
	padding: 2px;
	margin: 10px;
}

#Area2Routes h4 {
	background-color: #ba8300;
	border-radius: 10px;
	margin: 1px;
	color:white;
	font-size: xx-large;
}

#Area2Routes ul li a {
	background-color: #f2b200;
	border-radius: 5px;
	margin: 2px;
	padding: 2px;
	color: black !important;
	font-weight: bolder;
}

#Area2Routes span a {
	display: block;
	background-color: #ffe44b;
	border-radius: 10px;
	margin:1px;
	padding: 5px;
	color: black !important;
	font-size: x-large;
}

#Area2Routes .hided-Area {
	display: none;
}

#Area2Routes .showed-Area {
	
}

#TourContentShowedHere h2 {
	background-color: #f2b201 !important;
}

#TourName a {
	margin: 5px;
	background-color: #ffe44b !important;
	font-size: larger;
}

#TourQuery {
	
}

#TourContent {
	background-color: #F5F5F6;
	border: 0px solid black !important;
	color: green !important;
	margin-left: auto;
	margin-right: auto;
}

#TourTable {
	margin-top:10px;
	margin-left: 210px;
	margin-right: auto;
	text-align: left;
}

#TourTable td {
	padding-left: 10px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="/travelista/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="colorlib">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>超值旅遊套票</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
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

	<!-- #header -->
	<c:import url="/WEB-INF/jsp/commons/header.jsp" />
	<!-- start banner Area -->
	<section class="about-banner relative">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">旅遊套票</h1>
					<p class="text-white link-nav">
						<a href="/2">首頁 </a> <span class="lnr lnr-arrow-right"></span> <a
							href="/tourpackages?area=臺北市&NMSE=1">優惠活動</a>
					</p>
					<div class="wrap">
						<div class="header">
							<ul>
								<li><a href="">║套票一覽║</a></li>
								<li><a href="">║購買指南║</a></li>
								<li><a href="">║使用說明║</a></li>
								<li><a href="">║兌換地點║</a></li>
								<li><a href="">║注意事項║</a></li>
							</ul>
						</div>
						<div class="content">
							<div class="left">
								<div id="Area2Routes">
									<div>
										<h4>路線選擇</h4>
									</div>
									<div id="showedArea">
										<ul style="display: inline;">
											<li id="N" style="display: inline;"><a href="#1">北部</a></li>
											<li id="M" style="display: inline;"><a href="#2">中部</a></li>
											<li id="S" style="display: inline;"><a href="#3">南部</a></li>
											<li id="E" style="display: inline;"><a href="#4">東部</a></li>
										</ul>
									</div>
									<div id="TotalN">
										<!-- 北 -->
										<c:if test="${NMSE==1}">
											<span id="North" class="showed-Area">
											 <c:if
													test="${NMSE!=1}">
													<span id="North" class="hided-Area">
												</c:if>
										</c:if>
										<span> <a href="/tourpackages?area=宜蘭縣&NMSE=1">宜蘭縣</a>	
										</span>
										<span> <a href="/tourpackages?area=基隆市&NMSE=1">基隆市</a>
										</span> 
										<span> <a href="/tourpackages?area=臺北市&NMSE=1">臺北市</a>
										</span> 
										<span> <a href="/tourpackages?area=新北市&NMSE=1">新北市</a>
										</span> 
										<span> <a href="/tourpackages?area=桃園市&NMSE=1">桃園市</a>
										</span> 
										<span> <a href="/tourpackages?area=新竹縣&NMSE=1">新竹縣</a>
										</span>
									</div>
									<div id="TotalM">
										<!-- 中 -->
										<c:if test="${NMSE==2}">
											<span id="Middle" class="showed-Area">
										</c:if>
										<c:if test="${NMSE!=2}">
											<span id="Middle" class="hided-Area">
										</c:if>
										<span> <a href="/tourpackages?area=苗栗縣&NMSE=2">苗栗縣</a>
										</span> <span> <a href="/tourpackages?area=臺中市&NMSE=2">臺中市</a>
										</span> <span> <a href="/tourpackages?area=南投縣&NMSE=2">南投縣</a>
										</span> <span> <a href="/tourpackages?area=彰化縣&NMSE=2">彰化縣</a>
										</span> <span> <a href="/tourpackages?area=雲林縣&NMSE=2">雲林縣</a>
										</span>
									</div>
									<div id="TotalS">
										<!-- 南 -->
										<c:if test="${NMSE==3}">
											<span id="South" class="showed-Area">
										</c:if>
										<c:if test="${NMSE!=3}">
											<span id="South" class="hided-Area">
										</c:if>
										<span> <a href="/tourpackages?area=嘉義縣&NMSE=3">嘉義縣</a>
										</span> <span> <a href="/tourpackages?area=臺南市&NMSE=3">臺南市</a>
										</span> <span> <a href="/tourpackages?area=高雄市&NMSE=3">高雄市</a>
										</span> <span> <a href="/tourpackages?area=屏東縣&NMSE=3">屏東縣</a>
										</span>
									</div>
									<div id="TotalE">
										<!-- 東 -->
										<c:if test="${NMSE==4}">
											<span id="East" class="showed-Area">
										</c:if>
										<c:if test="${NMSE!=4}">
											<span id="East" class="hided-Area">
										</c:if>
										<span> <a href="/tourpackages?area=花蓮縣&NMSE=4">花蓮縣</a>
										</span> <span> <a href="/tourpackages?area=臺東縣&NMSE=4">臺東縣</a>
										</span>
									</div>
								</div>
								<!-- Area2Routes -->
							</div>
							<!-- Left -->
							<div class="center">
								<!-- 套票內容長在這 -->
								<div id="TourContentShowedHere">
									<h1 style="text-align: left;">${Area}--</h1>
									<c:forEach var="AreaItems" items="${AreaList}">
										<c:if test="${AreaItems.direction == 1}">
											<div>${AreaItems.tripName}(順)</div>
										</c:if>
										<c:if test="${AreaItems.direction != 1}">
											<div id="tripName">
												<h2>${AreaItems.tripName}(來回)</h2>
											</div>
										</c:if>
										<c:forEach var="Tour" items="${TourList}">
											<c:if
												test="${Tour.fk_routes_routeId == AreaItems.routeId && Tour.tourUseEnd.compareTo(crdate) > 0}">
												<div id="TourQuery">
													<div id="TourName" class="hidetogglebtn">
														<div style="background-color: #FFE44B"> <a>${Tour.tourName}</a>
														</div>
													</div>
													<div id="TourContent" class="showcontent"
														style="display: none;">
														<br> <img style="width: 300px; hieght: 200px"
															src="/images/tour/${Tour.tourId}.jpg">
														<h3>║ ${Tour.tourName} ║</h3>
														<div id="TourTable">
															<table>
																<tr>
																	<th>套票內容:</th>
																	<td style="text-align: left;">${Tour.tourContent}</td>
																</tr>
																<tr>
																	<th>套票價格:</th>
																	<td>優惠價:${Tour.discountPrice}原價:${Tour.tourPrice}</td>
																</tr>
																<tr>
																	<th>適用路線:</th>
																	<td>${AreaItems.tripName}</td>
																</tr>
																<tr>
																	<th>販售時間:</th>
																	<td>${Tour.tourSaleStart}到${Tour.tourSaleEnd}</td>
																</tr>
																<tr>
																	<th>使用使間:</th>
																	<td>${Tour.tourUseStart}到${Tour.tourUseEnd}</td>
																</tr>
															</table>
														</div>
													</div>
													<!-- TourContent -->
												</div>
												<!-- TourQuery -->
											</c:if>
										</c:forEach>
									</c:forEach>
								</div>
								<!-- 套票內容結束 -->
							</div>
							<!-- center -->
						</div>
						<!--content-->
					</div>
					<!-- wrap -->
				</div>
				<!-- about-content col-lg-12 萬惡之源 -->
			</div>
			<!-- row d-flex align-items-center justify-content-center -->
		</div>

	</section>
	<!-- End banner Area -->
	<c:import url="/WEB-INF/jsp/tourFunction/footerForTour.jsp" />

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
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>
		$('#N').click(function(showedNorth) {
			console.log('顯示北部');
			$('#North').attr('class', 'showed-Area');
			$('#Middle').attr('class', 'hided-Area');
			$('#South').attr('class', 'hided-Area');
			$('#East').attr('class', 'hided-Area');
		});
		$('#M').click(function(showedMiddle) {
			console.log('顯示中部');
			$('#North').attr('class', 'hided-Area');
			$('#Middle').attr('class', 'showed-Area');
			$('#South').attr('class', 'hided-Area');
			$('#East').attr('class', 'hided-Area');
		});
		$('#S').click(function(showedSouth) {
			console.log('顯示南部');
			$('#North').attr('class', 'hided-Area');
			$('#Middle').attr('class', 'hided-Area');
			$('#South').attr('class', 'showed-Area');
			$('#East').attr('class', 'hided-Area');
		});
		$('#E').click(function(showedEast) {
			console.log('顯示東部');
			$('#North').attr('class', 'hided-Area');
			$('#Middle').attr('class', 'hided-Area');
			$('#South').attr('class', 'hided-Area');
			$('#East').attr('class', 'showed-Area');
		});

		//function showedTourContent(tourId){
		//	console.log('顯示內容');
		//	console.log($('#showContent'+tourId));
		//	if($(tourId == tourId)){
		//	$('#TourContent'+tourId).attr('class','showed-Content');
		//	}
		//}

		$(document).ready(function() {
			$(".hidetogglebtn").click(function() {
				$(this).next(".showcontent").slideToggle();
			});
		});
	</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<style type="text/css">
.header {
	border: 1px solid black;
	height: 150px;
	margin: 10px;
	font-size: 22px;
	padding: 10px;
}

.left {
	width: 180px;
	border: 1px solid black;
	height: 600px;
	float: left;
	margin: 10px;
	margin-right: 30px;
}

.center {
	width: 900px;
	border: 1px solid black;
	height: 600px;
	float: left;
	margin: 10px;
	color: white;
}

.header h1 a {
	background-image: url('./images/tour/tourtitleimages.jpg');
	background-position: center center;
	background-repeat: no-repeat;
	background-size: 100px 100px;
	width: 128px;
	height: 128px;
	text-indent: 101%;
	overflow: hidden;
	white-space: nowrap;
	float: left;
}

.header ul {
	float: right;
	margin-top: 55px;
	margin-right: 20px;
}

.header ul li {
	float: left;
	margin-right: 25px;
	font-size: 18px;
}

.header ul li a {
	text-decoration: none;
	color: white;
}
.showed-Area {
	
}

.hided-Area {
	display: none;
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
<body style="background-color: #F2F2F2;">

	<!-- #header -->
	<c:import url="/WEB-INF/jsp/commons/header.jsp" />
	<!-- start banner Area -->
	<section class="about-banner relative">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div>
					<div class="wrap">
							<h1>
								<a href="/tourfindall">旅遊套票</a>
							</h1>
						<div class="header">
							<h1 class="text-white">XXXX</h1>
							<p class="text-white link-nav">
								<a href="/2">首頁 </a> <span class="lnr lnr-arrow-right"></span> <a
									href="/xxx"> XXXX</a>
							</p>
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
									<div id="showedArea" >
										<ul style="display: inline;" >
											<li id="N" class="nav-item" style="display: inline;"><a href="#1">北部</a></li>
											<li id="M" class="nav-item" style="display: inline;"><a href="#2">中部</a></li>
											<li id="S" class="nav-item" style="display: inline;"><a href="#3">南部</a></li>
											<li id="E" class="nav-item" style="display: inline;"><a href="#4">東部</a></li>
										</ul>
									</div>

									<!-- 北 -->
									<c:if test="${NMSE==1}">
										<div id="North" class="showed-Area">
									</c:if>
									<c:if test="${NMSE!=1}">
										<div id="North" class="hided-Area">
									</c:if>
									<div>
										<a href="/tourpackages?area=宜蘭縣&NMSE=1">宜蘭縣</a>
									</div>
									<div>
										<a href="/tourpackages?area=基隆市&NMSE=1">基隆市</a>
									</div>
									<div>
										<a href="/tourpackages?area=臺北市&NMSE=1">臺北市</a>
									</div>
									<div>
										<a href="/tourpackages?area=新北市&NMSE=1">新北市</a>
									</div>
									<div>
										<a href="/tourpackages?area=桃園市&NMSE=1">桃園市</a>
									</div>
									<div>
										<a href="/tourpackages?area=新竹縣&NMSE=1">新竹縣</a>
									</div>
								</div>
								<!-- 中 -->
								<c:if test="${NMSE==2}">
									<div id="Middle" class="showed-Area">
								</c:if>
								<c:if test="${NMSE!=2}">
									<div id="Middle" class="hided-Area">
								</c:if>
								<div>
									<a href="/tourpackages?area=苗栗縣&NMSE=2">苗栗縣</a>
								</div>
								<div>
									<a href="/tourpackages?area=臺中市&NMSE=2">臺中市</a>
								</div>
								<div>
									<a href="/tourpackages?area=南投縣&NMSE=2">南投縣</a>
								</div>
								<div>
									<a href="/tourpackages?area=彰化縣&NMSE=2">彰化縣</a>
								</div>
								<div>
									<a href="/tourpackages?area=雲林縣&NMSE=2">雲林縣</a>
								</div>
							</div>
							<!-- 南 -->
							<c:if test="${NMSE==3}">
								<div id="South" class="showed-Area">
							</c:if>
							<c:if test="${NMSE!=3}">
								<div id="South" class="hided-Area">
							</c:if>
							<div>
								<a href="/tourpackages?area=嘉義縣&NMSE=3">嘉義縣</a>
							</div>
							<div>
								<a href="/tourpackages?area=臺南市&NMSE=3">臺南市</a>
							</div>
							<div>
								<a href="/tourpackages?area=高雄市&NMSE=3">高雄市</a>
							</div>
							<div>
								<a href="/tourpackages?area=屏東縣&NMSE=3">屏東縣</a>
							</div>
						</div>
						<!-- 東 -->
						<c:if test="${NMSE==4}">
							<div id="East" class="showed-Area">
						</c:if>
						<c:if test="${NMSE!=4}">
							<div id="East" class="hided-Area">
						</c:if>
						<div>
							<a href="/tourpackages?area=花蓮縣&NMSE=4">花蓮縣</a>
						</div>
						<div>
							<a href="/tourpackages?area=臺東縣&NMSE=4">臺東縣</a>
						</div>
					</div>
				</div>
			</div>
			<div class="center">
				<div id="">
					<h1>${Area}-------</h1>
					<c:forEach var="AreaItems" items="${AreaList}">
						<c:if test="${AreaItems.direction == 1}">
							<div>${AreaItems.tripName}(順)</div>
						</c:if>
						<c:if test="${AreaItems.direction != 1}">
							<div><h2 style="background-color: #f2b201">${AreaItems.tripName}(來回)</h2></div>
						</c:if>
						<c:forEach var="Tour" items="${TourList}">
							<c:if test="${Tour.fk_routes_routeId == AreaItems.routeId && Tour.tourUseEnd.compareTo(crdate) > 0}">
								<div><h2 style="background-color: #FFFF99"><a>V ${Tour.tourName} V</a></h2></div>
								<div>
								<br><img style="width: 80px; hieght: 120px" src="/images/tour/tourimages${Tour.tourId}.jpg">
								<h3 style="color: white">║ ${Tour.tourName} ║</h3>
								<table>
								<tr><th>套票內容</th><td>${Tour.tourContent}</td></tr>
								<tr><th>套票價格</th><td>優惠價:${Tour.discountPrice}原價:${Tour.tourPrice}</td></tr>
								<tr><th>適用路線</th><td>${AreaItems.tripName}</td></tr>
								<tr><th>販售時間</th><td>${Tour.tourSaleStart}到${Tour.tourSaleEnd}</td></tr>
								<tr><th>使用使間</th><td>${Tour.tourUseStart}到${Tour.tourUseEnd}</td></tr>
								</table>
								</div>
							</c:if>
						</c:forEach>
					</c:forEach>
				</div>


			</div>
		</div>

	</section>
	<!-- End banner Area -->

	<!-- start footer Area -->
	<footer class="footer-area section-gap">
		<div class="container">

			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>About Agency</h6>
						<p>The world has become so fast paced that people don’t want
							to stand by reading a page of information, they would much rather
							look at a presentation and understand the message. It has come to
							a point</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Navigation Links</h6>
						<div class="row">
							<div class="col">
								<ul>
									<li><a href="#">Home</a></li>
									<li><a href="#">Feature</a></li>
									<li><a href="#">Services</a></li>
									<li><a href="#">Portfolio</a></li>
								</ul>
							</div>
							<div class="col">
								<ul>
									<li><a href="#">Team</a></li>
									<li><a href="#">Pricing</a></li>
									<li><a href="#">Blog</a></li>
									<li><a href="#">Contact</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Newsletter</h6>
						<p>For business professionals caught between high OEM price
							and mediocre print and graphic output.</p>
						<div id="mc_embed_signup">
							<form target="_blank"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get" class="subscription relative">
								<div class="input-group d-flex flex-row">
									<input name="EMAIL" placeholder="Email Address"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Email Address '" required=""
										type="email">
									<button class="btn bb-btn">
										<span class="lnr lnr-location"></span>
									</button>
								</div>
								<div class="mt-10 info"></div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget mail-chimp">
						<h6 class="mb-20">InstaFeed</h6>
						<ul class="instafeed d-flex flex-wrap">
							<li><img src="/travelista/img/i1.jpg" alt=""></li>
							<li><img src="/travelista/img/i2.jpg" alt=""></li>
							<li><img src="/travelista/img/i3.jpg" alt=""></li>
							<li><img src="/travelista/img/i4.jpg" alt=""></li>
							<li><img src="/travelista/img/i5.jpg" alt=""></li>
							<li><img src="/travelista/img/i6.jpg" alt=""></li>
							<li><img src="/travelista/img/i7.jpg" alt=""></li>
							<li><img src="/travelista/img/i8.jpg" alt=""></li>
						</ul>
					</div>
				</div>
			</div>

			<div
				class="row footer-bottom d-flex justify-content-between align-items-center">
				<p class="col-lg-8 col-sm-12 footer-text m-0">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="fa fa-heart-o" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
				<div class="col-lg-4 col-sm-12 footer-social">
					<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
						class="fa fa-twitter"></i></a> <a href="#"><i
						class="fa fa-dribbble"></i></a> <a href="#"><i
						class="fa fa-behance"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

	<script src="/travelista/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="/travelista/js/popper.min.js"></script>
	<script src="/travelista/js/vendor/bootstrap.min.js"></script>
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
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
	</script>
</body>
</html>
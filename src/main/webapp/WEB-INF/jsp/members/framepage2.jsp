<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<style type="text/css">
.gray { 
    -webkit-filter: grayscale(100%);
    -moz-filter: grayscale(100%);
    -ms-filter: grayscale(100%);
    -o-filter: grayscale(100%);
    
    filter: grayscale(100%);
	
    filter: gray;
}
table {
	margin: auto;
	width: 70%;
	border-collapse: collapse;
}

#table_wrap>table {
	font-size: 16px;
	text-align: center;
	margin: 0 auto;
	border-collapse: separate;
	border-spacing: 0;
	border: 2px #000;
}

table thead tr, table tbody tr {
	height: 50px;
	line-height: 50px;
	/*background-color: pink;*/
}

table tr th:first-child, table tr td:first-child { /*設定table左邊邊框*/
	border-left: 2px solid #eaeaea;
}

table tr th:last-child, table tr td:last-child { /*設定table右邊邊框*/
	border-right: 2px solid #eaeaea;
}

table tr td:first-child, table tr td:nth-child(2), table tr td:nth-child(3),
	table tr td:last-child { /*設定table表格每列底部邊框*/
	border-bottom: 2px solid #eaeaea;
}

table tr:last-child td:first-child, table tr:last-child td:nth-child(2),
	table tr:last-child td:nth-child(3), table tr:last-child td:last-child
	{ /!*設定table表格最後一列底部邊框 *!/ border-bottom:2pxsolid#000;
	
}

table tr th {
	background-color: #f8b600;
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

a {
	text-decoration: none
}

a:hover {
	text-decoration: underline
}

a:visited {
	color: blue;
}

#Title1 {
	margin: auto;
	font-size: 25px;
	font-weight: bold;
	text-align: center;
}

input:hover {
	background-color: #F1E1FF;
	text-decoration: underline;
}

select {
        text-align: center;
	 	width:200px;
        overflow: hidden;
        border: 1px;
        outline: none;
        background: #eee;
        border-radius: 10px;
        }
option{
       width: 200px;
       font-size: 20px;
       display: inline-block;
       border-radius: 10px;
       padding-top: 10px;
        }
#minetable{
	margin: auto;
	width: 75%;
	border-collapse: collapse;
	font-size: 16px;
	text-align: center;
	margin: 0 auto;
	border-collapse: separate;
	border-spacing: 0;
	border: 2px #000;
	padding:20px;

}
#umembername{
	text-align:center;
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 300px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
    height:10px;
}
#uemail{
	text-align:center;
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 300px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
    height:10px;
}
.lalaland{
    text-align: center;
    position: absolute;
    width: 100%;
    left: 50%;
    top: 50%;
   	transform: translate(-50%, 5%);
} 
.rowword {
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}

</style>
<meta charset="UTF-8">
<title>熱門景點</title>

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
<title>Travel</title>
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
				<div class="about-content col-lg-12">
					<h1 class="text-white">熱門目的地</h1>
					<p class="text-white link-nav">
						<a href="/mainpage">首頁 </a> <span class="lnr lnr-arrow-right"></span> <a
							href="/framePage2"> 熱門目的地</a>
					</p>
				</div>
			</div>
		</div>

	</section>
	<!-- End banner Area -->
	<BR />
	<BR />
	<BR />
	<section class="price-area section-gap" style="padding-top: 0px;">

		<div class="container">
			<div class="row d-flex justify-content-center" style="height:70px;">
				<div class="menu-content pb-70 col-lg-8">
					<div class="title text-center">
						<p>我們都生活在一個屬於年輕人的時代，生活步調變得非常的快速</p>
						<input id="userid" type="text" value="${framebean.userid}" style='height:1px;width:1px;visibility:hidden' readonly='readonly'/>
					</div>
				</div>
			</div>
			<div>
			<div class="row">
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/travelista/images/Jiufen.jpg" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/travelista/images/greenReef.jpg"
								alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/qiandaohu .png" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				</div>
			<div class="row" style="height: 100px;">
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;新北市瑞芳區.九份&emsp;&emsp;&emsp;&emsp;
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;新北市石門區.老梅綠石槽&emsp;&emsp;&emsp;
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;新北市石碇區.千島湖&emsp;&emsp;&emsp;&emsp;&emsp;
						</div>
					</div>
				</div>
			</div>
		</div>
			<div>
			<div class="row">
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/shitiping.png" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/luseshuidao.jpg"
								alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/penghu.jpg" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				</div>
			<div class="row" style="height: 100px;">
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;花蓮縣豐濱鄉.石梯坪&emsp;&emsp;&emsp;&emsp;&emsp;
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;臺南市安南區.綠色隧道&emsp;&emsp;&emsp;&emsp;
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;澎湖縣七美鄉.雙心石滬&emsp;&emsp;&emsp;&emsp;
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/zixinglou.jpg"  
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/qixingtan.png"
								alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/taipingshan .jpg" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				</div>
			<div class="row" style="height: 100px;">
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;屏東縣泰武鄉.紫心樓天空之橋&emsp;
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;花蓮縣新城鄉.七星潭&emsp;&emsp;&emsp;&emsp;&emsp;
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;宜蘭縣大同鄉.情懷古步道&emsp;&emsp;&emsp;&emsp;
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/alishan.png" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/kadangbudao.jpg"
								alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/xiaohuangshan.jpg" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				</div>
			<div class="row" style="height: 100px;">
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;嘉義縣東部.阿里山隙頂&emsp;&emsp;&emsp;&emsp;
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;太魯閣國家公園.砂卡礑步道&emsp;&emsp;
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;南投縣竹山鎮.小黃山&emsp;&emsp;&emsp;&emsp;
						</div>
					</div>
				</div>
			</div>
		</div>
		

		<!-- End popular-destination Area -->
	</section>
	<BR />

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
					<script>document.write(new Date().getFullYear());</script>
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
</body>
</html>
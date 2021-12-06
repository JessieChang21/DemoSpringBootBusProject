<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<style type="text/css">
table {
	margin: auto;
	width: 70%;
	border-collapse: collapse;
}

#table_wrap > table {
font-size: 16px;
text-align: center;
margin: 0 auto;
border-collapse: separate;
border-spacing: 0;
border: 2px #000;
}
table thead tr,table tbody tr {
height: 50px;
line-height: 50px;
/*background-color: pink;*/
}
table tr th:first-child,table tr td:first-child {/*設定table左邊邊框*/
border-left: 2px solid #eaeaea;
}
table tr th:last-child,table tr td:last-child {/*設定table右邊邊框*/
border-right: 2px solid #eaeaea;
}
table tr td:first-child,
table tr td:nth-child(2),
table tr td:nth-child(3),
table tr td:last-child{/*設定table表格每列底部邊框*/
border-bottom: 2px solid #eaeaea;
}
table tr:last-child td:first-child,
table tr:last-child td:nth-child(2),
table tr:last-child td:nth-child(3),
table tr:last-child td:last-child{/!*設定table表格最後一列底部邊框*!/
border-bottom: 2px solid #000;
}
table tr th {
background-color: orange;

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
a{ text-decoration:none} a:hover{ text-decoration:underline}
a:visited {
color:blue;
}
#Title1 {
	margin: auto;
	font-size: 25px;
	font-weight: bold;
	text-align: center;
}
input:hover{
  background-color:	#F1E1FF;
  text-decoration:underline;
}
#more:hover{background-color:	#F1E1FF;}
#nav { display: block; text-align:right; font-family: 'PT Sans', sans-serif; font-size:14px; font-weight:bold;}

span.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}

.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}

</style>

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
<title>Travel</title>

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
	<header id="header">
		<div class="header-top">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-sm-6 col-6 header-top-left">
						<ul>
							<li><a href="#">Visit Us</a></li>
							<li><a href="#">Buy Tickets</a></li>
						</ul>
					</div>
					<div class="col-lg-6 col-sm-6 col-6 header-top-right">
						<div class="header-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-dribbble"></i></a> <a href="#"><i
								class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="/2"><img src="/travelista/img/logo.png" alt=""
						title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li><a href="/2">Home</a></li>
						<li><a href="about.html">About</a></li>
						<li><a href="packages.html">Packages</a></li>
						<li><a href="hotels.html">Hotels</a></li>
						<li><a href="/showAnnouncement">最新消息</a></li>
						<li class="menu-has-children"><a
							href="queryRoutemain.controller">查詢車次&訂購車票</a>
							<ul>
								<li><a href="queryMemberOrdermain.controller">查詢刪除訂購車票</a></li>

							</ul></li>
						<li class="menu-has-children"><a href="">Pages</a>
							<ul>
								<li><a href="elements.html">Elements</a></li>
								<li class="menu-has-children"><a href="">Level 2 </a>
									<ul>
										<li><a href="#">Item One</a></li>
										<li><a href="#">Item Two</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li>
							<c:choose>
								<c:when test='${empty members.membername}'>
									<li class="menu-has-children"> 登入註冊
<!-- 										<ul> -->
<!-- 											<li><a href="login/page">會員登入</a></li> -->
<!-- 											<li><a href="register/membersregister.controller">註冊</a></li> -->
<!-- 										</ul> -->
									</li>
								</c:when>
								<c:when test='${! empty members.membername}'>
									<li class="menu-has-children"><a href="#"><img height='30px'width='30px' Style="border-radius:50%"
                src="<c:url value='/getMemberImage?id=${members.id}' />">&ensp;${members.membername} ,您好</a>
										<ul>
											<li><a href="elements.html">會員資料</a></li>
											<li><a href="/logingout">登出</a></li>
										</ul>
									</li>
								</c:when>
							</c:choose>
						</li>
					</ul>
				</nav>
				<!-- #nav-menu-container -->
			</div>
		</div>
	</header>
	<!-- #header -->
	

<!-- 	start banner Area -->
	<section class="banner-area relative">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row fullscreen align-items-center justify-content-between">

				<div class="col-lg-12 col-md-6 banner-right">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active" id="update-tab"
							data-toggle="tab" href="#update" role="tab" aria-controls="update"
							aria-selected="true">修改資料</a></li>
					</ul>
					
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="update" role="tabpanel"
							aria-labelledby="flight-tab">
							<form:form class="form-wrap123" method="POST" action="/memberupdate.controller" enctype='multipart/form-data' modelAttribute="members">
							
								<form:input path="memberpwd" name="memberpwd" type="password" value="${members.memberpwd}" style="height:1px; visibility:hidden" readonly="readonly" />
								<img height='100px' width='100px' Style="border-radius:50%" src="<c:url value='/getMemberImage?id=${members.id}' />">
								<form:input path="memberMultipartFile" name="memberMultipartFile" type='file'/>
								
								<form:input path="id" name="id" type="id" value="${members.id}" style="height:1px; visibility:hidden" readonly="readonly" />
								<br>	
								<form:input path="email" name="email" type="text" value="${members.email}" class="form-control" readonly="readonly"/>
								<br>
								<form:input path="membername" name="membername" type="text" value="${members.membername}" class="form-control" readonly="readonly"/>
								<br>
								<div class="radio">請選擇性別: 
								<label><form:radiobutton path="gender" name="gender" value="男" /> 男 </label>
								<label><form:radiobutton path="gender" value="女" /> 女 </label> 
								<label><form:radiobutton path="gender" value="保密" checked="true"/> 保密 </label> </div>
								<br>
								<form:select path="age" name="age" value="${members.age}" class="form-control"> 
								<option value="1">--請選擇--</option> <option value="2">10歲以下</option> <option value="3">10歲至20歲</option > <option value="4">20歲至30歲</option> <option value="5">30歲至40歲</option>
								<option value="6">40歲至50歲</option><option value="7">50歲至60歲</option> <option value="8">60歲至70歲</option> <option value="9">70歲以上 </option> </form:select>
								<br>
								<form:input path="adress" name="adress" placeholder="請輸入地址" type="text" class="form-control"/>
<!-- 								<br> -->
<!-- 								<input id="memberpwd" path='memberpwd' name="memberpwd" placeholder="請輸入密碼(至少8碼)" type="password" value="" class="form-control" /> -->
								
								<div id="btnArea" align="center">
							 	 	<input class="primary-btn" type="submit" name="submit" value="儲存"/>
							  		<input class="primary-btn" type="reset" name="cancel" value="重填" />
								</div>
<!-- 								<div id="feedback" align="center"></div> -->
								
							</form:form>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- start footer Area -->
	<footer class="footer-area section-gap">
		<div class="container">

			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>About Agency</h6>
						<p>The world has become so fast paced that people donât want
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
	<script
		src="/travelista/https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
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
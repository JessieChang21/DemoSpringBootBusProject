<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header id="header">
	<div class="header-top">
		<div class="container">
			<div class="row align-items-center">
<!-- 				<div class="col-lg-6 col-sm-6 col-6 header-top-left"> -->
<!-- 					<ul> -->
<!-- 						<li><a href="#">Visit Us</a></li> -->
<!-- 						<li><a href="#">Buy Tickets</a></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 				<div class="col-lg-6 col-sm-6 col-6 header-top-right"> -->
<!-- 					<div class="header-social"> -->
<!-- 						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i -->
<!-- 							class="fa fa-twitter"></i></a> <a href="#"><i -->
<!-- 							class="fa fa-dribbble"></i></a> <a href="#"><i -->
<!-- 							class="fa fa-behance"></i></a> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div>
		</div>
	</div>
	<div class="container main-menu">
		<div class="row align-items-center justify-content-between d-flex">
			<div id="logo">
				<a href="/mainpage"><span
					style="color: #f8b600; font-family: Microsoft JhengHei; font-weight: bold; font-size: 2.2em; text-align: end; font-style: italic;">
					<i class="fas fa-bus-alt"></i> 無事坐Bus</span></a>
			</div>
			<nav id="nav-menu-container">
				<ul class="nav-menu">
					<li><a href="/2">首頁</a></li>
					<li><a href="/showmap">地圖查詢</a></li>
					<li class="menu-has-children"><a href="">優惠活動</a>
						<ul>
							<li><a href="/tourpackages?area=%E8%87%BA%E5%8C%97%E5%B8%82&NMSE=1">旅遊套票</a></li>
						</ul></li>
					<li><a href="/showAnnouncement">最新消息</a>
					<li><a href="">旅遊套票</a>
					<li><c:choose>
							<c:when test='${empty members.membername}'>
								<li class="menu-has-children"><a href="/framePage2">熱門目的地
								</a></li>
							</c:when>
							<c:when test='${! empty members.membername}'>
								<li class="menu-has-children"><a href="/framePage">熱門目的地
								</a></li>	
							</c:when>
						</c:choose></li>
					<li><a href="/showlostandfound">失物招領</a></li>
					<li><a href="/showmap">路線總覽</a></li>
					

					<li><c:choose>
							<c:when test='${empty members.membername}'>
								<li class="menu-has-children"><a href="/login/page">登入&ensp;/&ensp;註冊
								</a></li>
							</c:when>
							<c:when test='${! empty members.membername}'>
								<li class="menu-has-children"><a href="#"><img
										height='30px' width='30px' Style="border-radius: 50%"
										src="<c:url value='/getMemberImage?id=${members.id}' />">&ensp;${members.membername}
										,您好</a>
									<ul>
										<li><a href="/updatemembers.controller">會員中心</a></li>
										<li><a href="/logout">登出</a></li>
									</ul></li>
							</c:when>
						</c:choose></li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<!-- #header -->
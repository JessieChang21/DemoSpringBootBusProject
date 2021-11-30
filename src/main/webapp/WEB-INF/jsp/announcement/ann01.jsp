<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>announcement01</title>
<style>
.new_con {
	width: 1000px;
	margin: 0px auto;
	font-family: Microsoft JhengHei;
	color: #2d2929;
	border: 1px solid rgba(0, 0, 0, 0.0);
	padding: 0px;
}

.new_block {
	margin: 10px auto 20px auto;
	padding: 50px;
}

.news_txt {
	font-size: 1em;
	line-height: 1.8;
	border: 3px dashed #cacaca;
	font-family: Microsoft JhengHei;
	padding: 32px;
	border-radius: 12px;
	position: relative;
}
</style>
</head>
<body>
	<c:forEach var="an" items="${ann01}">
		<section class="new_block">
			<div style="text-align: center;">
				<hr>
				<h1>${an.antitle}</h1>
				<span><fmt:formatDate value="${an.registerdate}" type="date"
						dateStyle="long" /></span>
				<hr>
			</div>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<div class="new_con">
				<c:choose>
					<c:when test="${empty an.animages}">
						<p align="center" class="news_txt">${an.ancontent}<BR />
						</p>
					</c:when>
					<c:otherwise>
						<p align="center" class="news_txt">${an.ancontent}<BR />
							<img id="output1" width="100%" height="100%" src="../animages/${an.animages}">
						</p>
					</c:otherwise>
				</c:choose>
			</div>
		</section>
	</c:forEach>
	<a href="<c:url value='/showAnnouncement'/>">上一頁</a>
</body>
</html>
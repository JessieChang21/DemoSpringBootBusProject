<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Query Success</title>
<style>
table {
	border-collapse: collapse;
	font-family: monospace;
	font-weight: normal;
	font-size: 16px;
	border: 1.2px solid grey;
	margin-left: 3vw;
	text-align: center;
}
</style>
</head>
<body>
	<h3>查詢結果</h3>
	<div>您所輸入的上車站 : ${initStation}</div>
	<div>您所輸入的下車站 : ${finalStation}</div>
	<br />
	<div>符合班次:</div>
	<br />
	<form action="bookTicket.controller" method="POST">
		<table border="1">
			<tr>
				<th>車次編號</th>
				<th>起站</th>
				<th>迄站</th>
				<th>發車時間</th>
				<th>總座位數</th>
				<th>剩餘座位數</th>
				<th>發車日期</th>
				<th>乘車時間</th>
				<th>訂票</th>
			</tr>


			<c:forEach var="aBean" items="${resultTotalBus}">
				<tr>
					<td>${aBean.busnumber}</td>
					<td>${aBean.initialstation}</td>
					<td>${aBean.finalstation}</td>
					<td>${aBean.formatinitaltime}</td>
					<td>${aBean.totalseats}</td>
					<td>${aBean.remainseats}</td>
					<td>${aBean.note}</td>
					<td>${aBean.traveltime}</td>
					<td><button type="submit" name="bookBus" value="${aBean.busnumber}">送出</button></td>
				</tr>
			</c:forEach>
		</table>
	</form>
<br> <a href="<c:url value='/index'/>">回首頁</a>
</body>
</html>
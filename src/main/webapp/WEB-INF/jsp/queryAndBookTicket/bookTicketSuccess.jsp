<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂票成功</title>
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
<h3>訂票成功</h3>
	<div>您的訂票資訊如下:</div>
	<br />
<!-- 	<form action="deleteTicket.controller" method="POST"> -->
		<table border="1">
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
				<td>${userinput.tripname}</td>
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
		<div> 訂單總金額 : NT$ ${totalPrice} 元整</div>
<!-- 	</form> -->
	<br> <a href="<c:url value='/index' />">回首頁</a>
</body>
</html>

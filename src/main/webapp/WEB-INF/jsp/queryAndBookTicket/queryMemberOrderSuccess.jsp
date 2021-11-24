<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Query Member Order Success</title>
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
<h3>訂票資訊查詢結果</h3>
	<br />
	<div>您的訂票資訊如下:</div>
	<br/>
	<form action="deleteTicket.controller" method="POST">
		<table border="1">
			<tr>
				<th>訂票代號</th>
				<th>車次編號</th>
				<th>起站</th>
				<th>迄站</th>
				<th>發車時間</th>
				<th>乘車時間</th>
				<th>刪除此筆訂單</th>
			</tr>
			<tr>
				<td>${order.orderid}</td>
				<td>${order.busnumber}</td>
				<td>${order.initialstation}</td>
				<td>${order.finalstation}</td>
				<td>${order.formatinitaltime}</td>
				<td>${order.traveltime}</td>
				<td><button type="submit" name="deleteTicket"
						value="${order.orderid}">送出</button></td>
			</tr>
		</table>
	</form>
	<br> <a href="<c:url value='/index' />">回首頁</a>
</body>
</html>
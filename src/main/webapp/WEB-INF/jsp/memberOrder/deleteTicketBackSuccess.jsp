<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>已刪除訂單</title>
<link rel="icon" href="/images/bus.svg" type="/image/x-icon" />
</head>
<body>
<div>
<form>
<table>
	<tr><td>訂單編號:</td><td>${n[0].orderid}</td></tr>
	<tr><td>會員名稱:</td><td>${n[0].email}</td></tr>
	<tr><td>車次編號:</td><td>${n[0].busnumber}</td></tr>
	<tr><td>起始站:</td><td>${n[0].initialstation}</td></tr>
	<tr><td>終點站:</td><td>${n[0].finalstation}</td></tr>
	<tr><td>出發日期:</td><td>${n[0].traveldate}</td></tr>
	<tr><td>出發時間:</td><td>${n[0].initialtime}</td></tr>
	<tr><td>票種:</td><td>${n[0].tickettype}</td></tr>
	<tr><td>票價:</td><td>${n[0].price}</td></tr>
	<tr><td>座位:</td><td>${n[0].seat}</td></tr>
	<tr><td>數量:</td><td>${n[0].orderqty}</td></tr>
	
<tr>
	<th>訂單編號</th>
	<th>會員名稱</th>
	<th>車次編號</th>
	<th>起始站</th>
	<th>終點站</th>
	<th>出發日期</th>
	<th>出發時間</th>
	<th>票種</th>
	<th>票價</th>
	<th>座位</th>
	<th>數量</th>
</tr>

 <c:forEach var="aBean" items="${n}">
					<tr>
						<td>${aBean.orderid}</td>
						<td>${aBean.email}</td>
						<td>${aBean.busnumber}</td>
						<td>${aBean.initialstation}</td>
						<td>${aBean.finalstation}</td>
						<td>${aBean.traveldate}</td>
						<td>${aBean.initialtime}</td>
						<td>${aBean.tickettype}</td>
						<td>${aBean.price}</td>
						<td>${aBean.seat}</td>
						<td>${aBean.orderqty}</td>
					</tr>
</c:forEach>
</table>
</form>
<a href="http://localhost:8081/memberOrderBackmain.controller">回到訂單總覽</a>
</div>
</body>
</html>
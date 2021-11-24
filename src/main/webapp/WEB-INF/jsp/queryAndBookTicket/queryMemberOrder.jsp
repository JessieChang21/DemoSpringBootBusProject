<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Query Member Order</title>
</head>
<body>
<h3>查詢訂票資訊</h3>
<form action="queryMemberOrder.controller" method="post">
	<table>
		<tr>
			<td>請輸入訂票代號(共6碼):</td>
			<td><input type="text" name="orderid"/></td>
           	<td style="color:red">${errors.orderid} ${errors.msg}</td>	
		</tr>
		<tr>
           <td><button type="submit" value="login">送出</button></td>
           
        </tr>
	</table>
</form>

<br> <a href="<c:url value='/index'/>">回首頁</a>
</body>
</html>
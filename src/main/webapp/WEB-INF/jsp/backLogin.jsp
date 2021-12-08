<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
<meta charset="utf-8">
<title>LoginSystem</title>
</head>
<body>
<div align="center">
<h2>登入</h2>

<form action="EmployeeLogin.controller" method="post">
	<table>
		<tr>
		<td>請輸入用戶名:</td>
		<td><input type="text" name="id"></td>
		<td>${errors.name}</td>
		</tr>
		<tr>
		<td>請輸入密碼:</td>
		<td><input type="password" name="pwd"></td>
		<td>${errors.pwd}</td>
		</tr>
		<tr>		
		<td></td><td><button type="submit" name="Login" >登入</button></td>
		</tr>
		<tr>
		<td></td><td>${errors.msg}</td>
		</tr>
	</table>
</form>
<h1>
	<c:choose>
		<c:when test='${ ! empty logoutMessage}'>
			${logoutMessage}
	   	</c:when>
	</c:choose>
 </h1>
 <div>
 	<%
		session.removeAttribute("logoutMessage");
	%>
	</div>
</div>
<div>
	<a href="backLoginsystem.controller">回首頁</a>
	
	</div>
</body>
</html>
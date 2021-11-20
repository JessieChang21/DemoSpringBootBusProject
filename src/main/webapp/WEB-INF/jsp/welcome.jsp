<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Welcome</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 
</head>
<body>
<form action="/login/welcome" method="post">
<h1 align="center">歡迎</h1><br>
<div align="center">
<%-- <c:url value = 'logout'/> --%>
	<a href="<c:url value = '/members/membersmain.controller'/>" class="btn btn-primary"> 查詢會員資料 </a><br>
	<hr>
	   	
	<br>
	<a href="<c:url value = '/register/membersregister.controller'/>" class="btn btn-primary"> 註冊 </a><br><br>
	
	<a href="<c:url value = '/logout'/>" class="btn btn-primary"> 登出 </a><br>

</body>
</html>
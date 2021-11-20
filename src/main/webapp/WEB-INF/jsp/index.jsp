<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>SpringBootHomework</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
 
</head>
<body>
<h1 align="center">首頁</h1><br>
<div align="center">
	<a href="members/membersmain.controller" class="btn btn-primary"> 查詢會員資料 </a><br>
	<hr>
	
	<c:choose>
	
		<c:when test='${empty membername}'>
			<a href="login/page" class="btn btn-primary"> 登入 </a><br>
	   	</c:when>
	   	
	</c:choose>
	<br>
	<a href="register/membersregister.controller" class="btn btn-primary"> 註冊 </a><br><br>
	
	<c:choose>
	
		<c:when test='${ ! empty membername}'>
			<a href="logout" class="btn btn-primary"> 登出 </a><br>
	   	</c:when>
	</c:choose>
	
	
	
</div>
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
</body>
</html>
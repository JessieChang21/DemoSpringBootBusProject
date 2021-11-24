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
<br>
<h1 align="center">第二組-客運訂票</h1><br>
<div align="center">
	<c:choose>
		<c:when test='${empty membername}'>
			<a href="login/page" class="btn btn-primary"> 員工登入(可CRUD會員資料) </a><br>
	   	</c:when>
	</c:choose>
	<br>
	<c:choose>
		<c:when test='${ ! empty membername}'>
			<a href="logout" class="btn btn-primary"> 員工登出 </a><br>
	   	</c:when>
	</c:choose>
	
	<hr>
	
<!-- 	<a href="register/membersregister.controller" class="btn btn-primary"> 會員註冊 </a><br><br> -->
<!-- 	<a href="members/membersmain.controller" class="btn btn-primary"> 查詢/新增會員資料 </a><br> -->
	
	
		<a href="<c:url value='queryRoutemain.controller'/>"
			class="btn btn-primary">查詢車次 & 訂購車票</a> <br>
		<br> <a href="<c:url value='queryMemberOrdermain.controller'/>"
			class="btn btn-primary">查詢/刪除訂購車票</a>
	
	
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
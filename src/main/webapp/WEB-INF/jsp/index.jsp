<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>SpringBootHomework</title>
  <link rel='stylesheet' href='/webjars/bootstrap/3.3.7/css/bootstrap.min.css'>
  <link rel="icon" href="images/bus.svg" type="image/x-icon" />

  <link rel="stylesheet" href="/webjars/font-awesome/5.13.0/css/all.min.css"></link>
</head>
<body>
<br>
<h1 align="center">�ĤG��-�ȹB�q��<i class="fas fa-bus"></i></h1><br>


<div align="center">
	<c:choose>
		<c:when test='${empty membername}'>
			<a href="login/page" class="btn btn-primary"> ���u�n�J(�iCRUD�|�����) </a><br>
	   	</c:when>
	</c:choose>
	<br>
	<c:choose>
		<c:when test='${ ! empty membername}'>
			<a href="logout" class="btn btn-primary"> ���u�n�X </a><br>
	   	</c:when>
	</c:choose>
	
	<hr>
	
<!-- 	<a href="register/membersregister.controller" class="btn btn-primary"> �|�����U </a><br><br> -->
<!-- 	<a href="members/membersmain.controller" class="btn btn-primary"> �d��/�s�W�|����� </a><br> -->
	
	
		<a href="<c:url value='queryRoutemain.controller'/>"
			class="btn btn-primary">�d�ߨ��� & �q�ʨ���</a> <br>
		<br> <a href="<c:url value='queryMemberOrdermain.controller'/>"
			class="btn btn-primary">�d��/�R���q�ʨ���</a>
	
	
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
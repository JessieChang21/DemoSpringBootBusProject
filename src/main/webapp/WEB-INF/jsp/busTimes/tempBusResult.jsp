<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="/images/bus.svg" type="/image/x-icon" />
</head>
<body>
<h3>已申請班次</h3>
<div>
路線:${tempBusRoute}
</div>

<div>
<a href="<c:url value='http://localhost:8081/busTimes/tempbustimemain.controller?tEx=9' />" class="btn btn-primary">進入班次申請紀錄</a>
</div>

</body>
</html>
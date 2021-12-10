<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Holiday Index</title>
<link rel="stylesheet" href="/css/memberssystem.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<table border="1">
		<tr><th>員工請假列表</th></tr>
		<tr><td><a href='/GetHoliday/getholidayQuerybyId'>請假查詢</a></td></tr>
		<tr><td><a href='/GetHoliday/getholidayadd'>請假</a></td></tr>
		<tr><td><a href='/GetHoliday/getholidayRelease'>主管放行</a></td></tr>
	</table>
</body>
</html>
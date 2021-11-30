<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
	background-color: #FFE384;
}
a{ text-decoration:none} a:hover{ text-decoration:underline}
a:visited {
color:blue;
}
</style>
</head>
<body><br/><br/><br/>
	<div align='center'>
		<table border='1'>
			<tr>
				<td align='center' width="150px"><a href="<c:url value='/saveAnnouncement' />">新增公告</a></td>
				<td align='center' width="150px"><a href="<c:url value='/showAnnouncement2'/>">查詢公告</a></td>
				<td align='center' width="150px"><a href="<c:url value='/showAnnouncement1'/>">編輯公告</a></td>
				<td align='center' width="150px"><a href="<c:url value='/savelostandfound' />">新增遺失物</a></td>
				<td align='center' width="150px"><a href="<c:url value='/showlostandfound'/>">查詢遺失物</a></td>
				
				
			</tr>
		</table>
	</div>
	
	
</body>
</html>
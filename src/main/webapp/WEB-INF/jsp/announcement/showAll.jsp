<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body,table{
    font-family:verdana,arial,sans-serif;
    font-size:12px;
    border-collapse:collapse;
}

td,th{
    padding:3px 3px;
    margin:0px;
    border:1px solid #BBB;
    white-space:nowrap;
}
a{ text-decoration:none} a:hover{ text-decoration:underline}
a:visited {
color:blue;
}
table{
margin-left:auto; 
margin-right:auto;
}
.content{
    height:15px;
    width:100px;
    overflow:hidden;
    text-overflow:ellipsis
}

input[type='checkbox'] { visibility: hidden; position: absolute; }
input[type='checkbox']:checked + .content { height: auto; width: auto;}
</style>
</head>
<body>
<div style="text-align: center;">
			<hr>
			<h1>公告資料</h1>
			<hr>
			<a href="<c:url value='/' />">回首頁</a>
		</div>

<p><BR/></p>
	<table border="1" >
		<tr >
			<th width='50'>編號</th>
			<th width='120'>類別</th>
			<th width='250'>主旨</th>
			<th width='150'>內容</th>
			<th width='150'>公告時間</th>
			<th width='150'>編輯資料</th>
			<th width='150'>刪除資料</th>
		</tr>
		<c:forEach var="an" items="${list}">
			<tr>
				<td align='center' height='100'>${an.id}</td>
				<td align='center'>${an.ancategory}</td>
				<td align='center'>${an.antitle}</td>
				<c:choose>
					<c:when test="${empty an.animages}">
						<td align="center" class="news_txt"><label><input type="checkbox" /><div class="content"><span class="hidden">${an.ancontent}</span></div></label><BR />
						</td>
					</c:when>
					<c:otherwise>
						<td align="center" class="news_txt"><label><input type="checkbox" /><div class="content"><span class="hidden">${an.ancontent}<BR/><img id="output1" width="50%" height="50%" src="../animages/${an.animages}"></span></div></label>
							
						</td>
					</c:otherwise>
				</c:choose>
				<td align='center'><fmt:formatDate value="${an.registerdate}" type="date" dateStyle="long"/></td>
				<td align='center'><a href="<c:url value='updateAnnouncement/${an.id}' />">編輯</a></td>
				<td align='center'><a href="<c:url value='deleteAnnouncement/${an.id}' />">刪除</a></td>	
			</tr>
		</c:forEach>
	</table>
	<p><BR/></p>

</body>
</html>
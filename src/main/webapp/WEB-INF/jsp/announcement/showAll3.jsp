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
<style type="text/css">
table {
	margin: auto;
	width: 70%;
	border-collapse: collapse;
}

#table_wrap > table {
font-size: 16px;
text-align: center;
margin: 0 auto;
border-collapse: separate;
border-spacing: 0;
border: 2px #000;
}
table thead tr,table tbody tr {
height: 50px;
line-height: 50px;
/*background-color: pink;*/
}
table tr th:first-child,table tr td:first-child {/*設定table左邊邊框*/
border-left: 2px solid #eaeaea;
}
table tr th:last-child,table tr td:last-child {/*設定table右邊邊框*/
border-right: 2px solid #eaeaea;
}
table tr td:first-child,
table tr td:nth-child(2),
table tr td:nth-child(3),
table tr td:last-child{/*設定table表格每列底部邊框*/
border-bottom: 2px solid #eaeaea;
}
table tr:last-child td:first-child,
table tr:last-child td:nth-child(2),
table tr:last-child td:nth-child(3),
table tr:last-child td:last-child{/!*設定table表格最後一列底部邊框*!/
border-bottom: 2px solid #000;
}
table tr th {
background-color: orange;

}
table tr:first-child th:first-child {
border-top-left-radius: 12px;
}
table tr:first-child th:last-child {
border-top-right-radius: 12px;
}
table tr:last-child td:first-child {
border-bottom-left-radius: 12px;
}
table tr:last-child td:last-child {
border-bottom-right-radius: 12px;
}
a{ text-decoration:none} a:hover{ text-decoration:underline}
a:visited {
color:blue;
}
#Title1 {
	margin: auto;
	font-size: 25px;
	font-weight: bold;
	text-align: center;
}
input:hover{
  background-color:	#F1E1FF;
  text-decoration:underline;
}
#more:hover{background-color:	#F1E1FF;}
#nav { display: block; text-align:right; font-family: 'PT Sans', sans-serif; font-size:14px; font-weight:bold;}

</style>

</head>
<body>
<br/><br/>
	<hr>
<div id="Title1">公告資料</div>
<hr>
<br/><br/>
<div id="table_wrap" align='center'>
	<table id="showlaf">
		<tr  height='45px'  >
			<th width='350'>類別</th>
			<th width='350'>主旨</th>
			<th width='350'>公告時間</th>
		</tr>
		<c:forEach var="an" items="${list}">
			<tr  height='40px' align='center'>
				<td width='250' >${an.ancategory}</td>
				<td ><a href="<c:url value='/ann01/${an.id}'/>">${an.antitle}</a></td>
				<td ><fmt:formatDate value="${an.registerdate}" type="date" dateStyle="short"/></td>
			</tr>
		</c:forEach>
	</table>
	</div>
	
<div id="nav" align='center'><table><tr><td height="50px"><a id="more" href="<c:url value='/showAnnouncement'/>">了解更多</a></td></tr></table></div>
</body>
</html>
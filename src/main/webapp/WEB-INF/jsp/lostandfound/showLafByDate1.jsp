<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head><style type="text/css">
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
</style>

<meta charset="UTF-8">
<title>Show LostAndFound</title>
</head>
<body>
<br />
	<br />
	<hr>
	<div id="Title1">遺失物查詢</div>
	<hr>
	<br />
	<div id="table_wrap" style="float:left;margin-left:70px">
	<table id="showlaf" >
		<tr>
			<th style="background-color:#E6CAFF;font-size:140%" align="center" width="300px" height="200px" >失物招領<BR/>遺失月份</th>
		</tr>
		<tr>
				<td style="background-color:pink;"><form method='POST'
					action="<c:url value='/showlafbydate'/>">
					<input name='itdate' type='hidden' type='text' value='2021/11'>
					<input type='submit' style="width:200px;height:40px;border:2px blue none;background-color:pink;font-size:130%" value='十一月份'>
					</form>
				</td></tr>
			<tr>
				<td style="background-color:pink;"><form method='POST'
					action="<c:url value='/showlafbydate'/>">
					<input name='itdate' type='hidden' type='text' value='2021/10'>
					<input type='submit' style="width:200px;height:40px;border:2px blue none;background-color:pink;font-size:130%" value='十月份'>
					</form>
				</td></tr>
				<tr>
				<td style="background-color:pink;"><form method='POST'
					action="<c:url value='/showlafbydate'/>">
					<input name='itdate' type='hidden' type='text' value='2021/9'>
					<input type='submit' style="width:200px;height:40px;border:2px blue none;background-color:pink;font-size:130%" value='九月份'><br>
				</form></td>
			</tr>
		
	</table>
	</div>
	<div id="table_wrap" >
	<table style="align:center">
		<tr >
			<th width='150'>巴士編號</th>
			<th width='150'>物品名稱</th>
			<th width='150'>拾獲地點</th>
			<th width='150'>拾獲時間</th>
			
		</tr>
		<c:forEach var="laf" items="${list1}">
			<tr>
				<td align='center'>${laf.itbussnumber}</td>
				<td align='center'>${laf.itname}</td>
				<td align='center'>${laf.itplace}</td>
				<td align='center'>${laf.itdate}</td>
<%-- 				<td align='center'><a href="<c:url value='updatelostandfound/${laf.id}' />">編輯</a></td> --%>
<%-- 				<td align='center'><a href="<c:url value='deletelostandfound/${laf.id}' />">刪除</a></td> --%>
			</tr>
			
		</c:forEach>
		
	</table>
	</div>
	<div align="center" >
	<p>
		<a  href="<c:url value='/showlostandfound' />">顯示全部</a>
		</p>
	</div>


	<!-- 		<input  type='submit' value='查詢'><br> -->

	
</body>
</html>
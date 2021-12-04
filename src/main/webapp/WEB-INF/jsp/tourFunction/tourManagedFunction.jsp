<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TOUR Managed Function Part</title>
</head>
<body>
	<form action="post">
		<table>
			<tr>
				<th>套票ID</th>
				<th>套票名稱</th>
				<th>套票原價</th>
				<th>套票優惠售價</th>
				<th>適用路線ID</th>
				<th>套票內容</th>
				<th>販售時間</th>
				<th>使用時間</th>
				<th>縮圖</th>
				<th>資料維護</th>
			</tr>
			<c:forEach var='Tour' items='${TourList}'>
				<tr>
					<td style="text-align: center">${Tour.tourId}</td>
					<td>${Tour.tourName}</td>
					<td>${Tour.tourPrice}</td>
					<td>${Tour.discountPrice}</td>
					<td style="text-align: center">${Tour.fk_tour_routeId}</td>
					<td style="text-align: center">${Tour.tourContent}</td>
					<td style="text-align: center">${Tour.tourSaleStart}&emsp;到&emsp;${Tour.tourSaleEnd}</td>
					<td style="text-align: center">${Tour.tourUseStart}&emsp;到&emsp;${Tour.tourUseEnd}</td>
					<td><img width='60' height='72' src="<c:url value='URL' />"/></td>
					<td><a class='editlink' href="/tourEdit?editId=${Tour.tourId}">編輯</a></td>
					<td><a class='deletelink' href="">刪除</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>
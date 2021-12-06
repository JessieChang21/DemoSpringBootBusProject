<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">
	table {
		border: 1px solid white;
	}
	
	table th {
		border: 1px solid white;
		padding: 5px;
		color: gold;
	}
	
	table td {
		border: 1px solid BLACK;
		padding: 5px;
		color: black;
	}
</style>
<meta charset="UTF-8">
<title>TOUR Managed Function Part</title>
</head>
<body>
	<table style="text-align: center">
		<tr>
			<th>套票ID</th>
			<th>套票名稱</th>
			<th>套票原價</th>
			<th>優惠售價</th>
			<th>適用路線</th>
			<th>套票內容</th>
			<th>販售時間</th>
			<th>使用時間</th>
			<th>縮圖</th>
			<th colspan="2">資料維護</th>
		</tr>
		<tr>
			<td></td>
			<td><textarea id="insertname" 	  		   style="text-align:left ; width: 200px; height: 50px;resize: none"></textarea></td>
			<td><input    id="insertPrice"   value=""  style="text-align:center ; width: 45px;"></td>
			<td><input    id="insertdPrice"  value=""  style="text-align:center ; width: 45px;"></td>
			<td>
				<!--<input    id="insertRouteId" value=""  style="text-align:center ; width: 45px;"> -->
				<select id="insertRouteId">
					<c:forEach var='Routes' items='${RoutesList}'>
						<option value="${Routes.routeId}">${Routes.tripName}</option>
					</c:forEach>
				</select>
			</td>
			<td><textarea id="insertContent" style="height: 100px;width: 300px;"></textarea></td>
			<td style="text-align: center">
				<input id="insertSaleS"	type="date" value="" type="text" style="text-align:center">
				<br>到<br>
				<input id="insertSaleE" type="date" value="" type="text" style="text-align:center">
			</td>
			<td style="text-align: center">
			<input id="insertUseS"		type="date" value="" type="text" style="text-align:center">
				<br>到<br> 
				<input id="insertUseE"  type="date" value="" type="text" style="text-align:center">
			</td>
			<td><input id="insertIMGURL" value=""></td>
			<td><button onclick="insertNewData()">新增</button></td>
			<td></td>
		</tr>
		<c:forEach var='Tour' items='${TourList}'>
			<tr>
				<td style="text-align: center">${Tour.tourId}</td>
				<td><input 		id="upName${Tour.tourId}"	    value="${Tour.tourName}"  		style="text-align:center ; width: 200px;"></td>
				<td><input 		id="upPrice${Tour.tourId}" 		value="${Tour.tourPrice}"       style="text-align:center ; width: 45px;"></td>
				<td><input 		id="updisPrice${Tour.tourId}" 	value="${Tour.discountPrice}"   style="text-align:center ; width: 45px;"></td>
				<td>
					<select id="upRouteId${Tour.tourId}">
						<c:forEach var='Routes' items='${RoutesList}'>
							<option value="${Routes.routeId}">${Routes.tripName}</option>
							<c:if test="${Tour.fk_routes_routeId == Routes.routeId}">
							<option value="${Routes.routeId}" selected="selected">${Routes.tripName}</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
				<td><textarea 	id="upContent${Tour.tourId}" 	style="height: 100px;width: 300px;resize: none;">${Tour.tourContent}</textarea></td>
				<td style="text-align: center">
					<input 		id="upSS${Tour.tourId}" 		value="${Tour.tourSaleStart}" type="text" style="text-align:center ; width: 136px">
					<br>到<br>
					<input 		id="upSE${Tour.tourId}" 		value="${Tour.tourSaleEnd}"   type="text" style="text-align:center ; width: 136px">
				</td>
				<td style="text-align: center">
					<input 		id="upUS${Tour.tourId}" 		value="${Tour.tourUseStart}"  type="text" style="text-align:center ; width: 136px">
					<br>到<br>
					<input 		id="upUE${Tour.tourId}" 		value="${Tour.tourUseEnd}"    type="text" style="text-align:center ; width: 136px">
				</td>
				<td>
					<img width='60' height='72' src="/images/tour/tourimages${Tour.tourId}.jpg"/>
					<input 		id="upIMGURL${Tour.tourId}" 	Value="${Tour.tourURL}"><br>
				</td>
				<td><button onclick="update(${Tour.tourId})">修改</button></td>
				<td><button onclick="deleteData(${Tour.tourId})">刪除</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
<script>
	function update(tourId){
		console.log(tourId)
		var goUrl="/tourInsert?"
			goUrl = goUrl + "tourId="+tourId;
			goUrl = goUrl + "&tourName="+ $('#upName'+tourId).val();
			goUrl = goUrl + "&tourPrice="+ $('#upPrice'+tourId).val();
			goUrl = goUrl + "&discountPrice="+ $('#updisPrice'+tourId).val();
			goUrl = goUrl + "&fk_routes_routeId="+ $('#upRouteId'+tourId).val();
			goUrl = goUrl + "&tourContent="+ $('#upContent'+tourId).val();
			goUrl = goUrl + "&tourSaleStart="+ $('#upSS'+tourId).val();
			goUrl = goUrl + "&tourSaleEnd="+ $('#upSE'+tourId).val();
			goUrl = goUrl + "&tourUseStart="+ $('#upUS'+tourId).val();
			goUrl = goUrl + "&tourUseEnd="+ $('#upUE'+tourId).val();
			goUrl = goUrl + "&tourURL="+ $('#upIMGURL'+tourId).val();
		location.href=goUrl
	}
	
	function insertNewData (){
		var goUrl="/tourInsert?"
				console.log($('#insertname'))
			goUrl = goUrl + "tourId=0";
			goUrl = goUrl + "&tourName="+ $('#insertname').val();
			goUrl = goUrl + "&tourPrice="+ $('#insertPrice').val();
			goUrl = goUrl + "&discountPrice="+ $('#insertdPrice').val();
			goUrl = goUrl + "&fk_routes_routeId="+ $('#insertRouteId').val();
			goUrl = goUrl + "&tourContent="+ $('#insertContent').val();
			//goUrl = goUrl + "&tourSaleStart="+ new Date($('#insertSaleS').val()).getTime();
			//goUrl = goUrl + "&tourSaleEnd="+ new Date($('#insertSaleE').val()).getTime();
			//goUrl = goUrl + "&tourUseStart="+ new Date($('#insertUseS').val()).getTime();
			//goUrl = goUrl + "&tourUseEnd="+ new Date($('#insertUseE').val()).getTime();
			goUrl = goUrl + "&tourSaleStart="+ $('#insertSaleS').val();
			goUrl = goUrl + "&tourSaleEnd="+ $('#insertSaleE').val();
			goUrl = goUrl + "&tourUseStart="+ $('#insertUseS').val();
			goUrl = goUrl + "&tourUseEnd="+ $('#insertUseE').val();
			goUrl = goUrl + "&tourURL="+ $('#insertIMGURL').val();
		location.href=goUrl
		
	}
	function deleteData(tourId){
		var goURL = "/tourDelete?editId="+tourId;
		location.href=goURL;
	}
</script>
</html>
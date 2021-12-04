<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>TOUR Managed Function Part</title>
</head>
<body>
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
		<tr>
			<td></td>
			<td><textarea id="insertname" rows="" cols=""></textarea></td>
			<td><input id="insertPrice" value=""></td>
			<td><input id="insertdPrice" value=""></td>
			<td><input id="insertRouteId" value="">
				
				<!--  <select  id="insertRouteId">
				
				  <option value="0">Volvo</option>
				  <option value="1">Saab</option>
				  <option value="2">Mercedes</option>
				  <option value="3">Audi</option>
				  
				</select>
				-->
			</td>
			<td><textarea id="insertContent" rows="" cols=""></textarea></td>
			<td style="text-align: center"><input id="insertSaleS"
				type="date" value=""><br>到<br> <input
				id="insertSaleE" type="date" value=""></td>
			<td style="text-align: center"><input id="insertUseS"
				type="date" value=""><br>到<br> <input
				id="insertUseE" type="date" value=""></td>
			<td><input id="insertIMGURL" value=""></td>
			<td><button onclick="insertNewData()">新增</button></td>

		</tr>
		<c:forEach var='Tour' items='${TourList}'>
			<tr>
				<td style="text-align: center">${Tour.tourId}</td>
				<td><textarea id="upName${Tour.tourId}">${Tour.tourName}</textarea></td>
				<td><input id="upPrice${Tour.tourId}" value="${Tour.tourPrice}"></td>
				<td><input id="updisPrice${Tour.tourId}"
					value="${Tour.discountPrice}"></td>
				<td style="text-align: center"><input
					id="upRouteId${Tour.tourId}" value="${Tour.fk_tour_routeId}"></td>
				<td style="text-align: center"><textarea
						id="upContent${Tour.tourId}">${Tour.tourContent}</textarea></td>
				<td style="text-align: center"><input id="upSS${Tour.tourId}"
					value="${Tour.tourSaleStart}"><br>到<br> <input
					id="upSE${Tour.tourId}" value="${Tour.tourSaleEnd}"></td>
				<td style="text-align: center"><input id="upUS${Tour.tourId}"
					value="${Tour.tourUseStart}"><br>到<br> <input
					id="upUE${Tour.tourId}" value="${Tour.tourUseEnd}"></td>
				<td><input id="upIMGURL${Tour.tourId}" Value="${Tour.tourURL}">

					<img width='60' height='72' src="<c:url value='URL' />" /></td>
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
			goUrl = goUrl + "&fk_tour_routeId="+ $('#upRouteId'+tourId).val();
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
			goUrl = goUrl + "&fk_tour_routeId="+ $('#insertRouteId').val();
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
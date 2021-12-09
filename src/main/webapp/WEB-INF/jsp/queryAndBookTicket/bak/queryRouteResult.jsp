<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>車次查詢結果</title>
</head>
<body>
<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
	<h3>車次查詢結果</h3>
	<div>路線名稱 : ${inputdataObj.tripname}</div>
	<div>旅行日期 : ${inputdataObj.traveldate}</div>
	<br/>
	<br/>
	<c:choose>
		<c:when test="${empty result}">
			<div id="all">暫無相關班次資訊</div>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${empty byTripnameResult0}">
			<div id="d0">暫無順向班次資訊</div>
		</c:when>
		<c:otherwise>
			<form action="/members/bookTicket.controller" method="POST">
				<table border="1">
					<tr>
						<th colspan="10">順向</th>
					</tr>
					<tr>
						<th>車次</th>
						<th>起站</th>
						<th>迄站</th>
						<th>發車時間</th>
						<th>旅程時間</th>
						<th>全票票價</th>
						<th>半票票價</th>
						<th>剩餘座位</th>
						<th>備註</th>
						<th>訂票</th>
					</tr>
					<c:forEach var="aBean" items="${byTripnameResult0}">
						<tr>
							<td>${aBean.busnumber}</td>
							<td>${aBean.initialstation}</td>
							<td>${aBean.finalstation}</td>
							<td>${aBean.initialtime}</td>
							<td>${aBean.traveltime}</td>
							<td>${aBean.adultprice}</td>
							<td>${aBean.childrenprice}</td>
							<td>${aBean.remainseats}</td>
							<td>${aBean.note}</td>
							<td><button type="submit" name="bookBus"
									value="${aBean.busnumber}">BookNow!</button></td>
						</tr>
					</c:forEach>
				</table>
				<input id="tripname" value="${inputdataObj.tripname}" type="hidden">
				<input id="traveldate" value="${inputdataObj.traveldate}" type="hidden">
				<input id="weekday" value="${inputdataObj.weekday}" type="hidden">
				<input id="initialtime" value="${inputdataObj.initialtime}" type="hidden">
				<input id="adult" value="${inputdataObj.adult}" type="hidden">
				<input id="children" value="${inputdataObj.children}" type="hidden">
				<input id="inputdata" name="inputdata" type="hidden">
			</form>
		</c:otherwise>
	</c:choose>	
	<c:choose>
		<c:when test="${empty byTripnameResult1}">
			<div id="d1">暫無逆向班次資訊</div>
		</c:when>
		<c:otherwise>
			<form action="/members/bookTicket.controller" method="POST">
				<table border="1">
					<tr>
						<th colspan="10">逆向</th>
					</tr>
					<tr>
						<th>車次</th>
						<th>起站</th>
						<th>迄站</th>
						<th>發車時間</th>
						<th>旅程時間</th>
						<th>全票票價</th>
						<th>半票票價</th>
						<th>剩餘座位</th>
						<th>備註</th>
						<th>訂票</th>
					</tr>
					<c:forEach var="aBean" items="${byTripnameResult1}">
						<tr>
							<td>${aBean.busnumber}</td>
							<td>${aBean.initialstation}</td>
							<td>${aBean.finalstation}</td>
							<td>${aBean.initialtime}</td>
							<td>${aBean.traveltime}</td>
							<td>${aBean.adultprice}</td>
							<td>${aBean.childrenprice}</td>
							<td>${aBean.remainseats}</td>
							<td>${aBean.note}</td>
							<td><button type="submit" name="bookBus"
									value="${aBean.busnumber}">BookNow!</button></td>
						</tr>
					</c:forEach>
				</table>
				
				<input id="tripname" value="${inputdataObj.tripname}" type="hidden">
				<input id="traveldate" value="${inputdataObj.traveldate}" type="hidden">
				<input id="weekday" value="${inputdataObj.weekday}" type="hidden">
				<input id="initialtime" value="${inputdataObj.initialtime}" type="hidden">
				<input id="adult" value="${inputdataObj.adult}" type="hidden">
				<input id="children" value="${inputdataObj.children}" type="hidden">
				<input id="inputdata" name="inputdata" type="hidden">	
			</form>
		</c:otherwise>
	</c:choose>	
	
	
	<script type="text/javascript">
		var params = {
    	    "tripname": $("#tripname").val(),
    		"traveldate":$("#traveldate").val(),
    		"weekday":$("#weekday").val(),
    		"initialtime":$("#initialtime").val(),
    		"adult":$("#adult").val(),
    		"children":$("#children").val()
        	}
        
    	$("#inputdata").val(JSON.stringify(params));
		
		window.onload = function() {
			var all = $("#all").html();
			var d0 = $("#d0").html();
			var d1 = $("#d1").html();
			
			if(all == "暫無相關班次資訊"){
				$("#d0").html("");
				$("#d1").html("");
			}
		}
	</script>
</body>
</html>
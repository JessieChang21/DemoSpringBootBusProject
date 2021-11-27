<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<script src="/webjars/jquery/3.1.1-1/jquery.min.js"></script>

<title>Query Route</title>
<script type="text/javascript">
	$.noConflict();
	jQuery(document).ready(function() {
		data = [ {
					"area" : "台北市",
					"station" : [ {
								"stationNo" : "0",
								"name" : "台北轉運站"
							} ]
				}, {
					"area" : "台中市",
					"station" : [ {
								"stationNo" : "1",
								"name" : "朝馬站"
							} ]
				}, {
					"area" : "彰化縣",
					"station" : [ {
								"stationNo" : "2",
								"name" : "中莊子"
								}, {
								"stationNo" : "3",
								"name" : "彰化師大"
								}, {
								"stationNo" : "4",
								"name" : "和調里"
								}, {
								"stationNo" : "5",
								"name" : "彰化站"
								} ]
				} ];

				var areaArr = new Array();
				var areaString = new Array();

				for (let i = 0; i < data.length; i++) {
					areaString[i] = new Array();

					let cityArea = data[i].area;
					areaArr[i] = cityArea;

					jQuery("#initCity").append(`<option>` + cityArea + `</option>` );
					jQuery("#finalCity").append(`<option>` + cityArea + `</option>` );

					for (let j = 0; j < data[i].station.length; j++) {
						let stationName = data[i].station[j].name;
						areaString[i][j] = stationName;
						}
				}

				jQuery("#initCity").on("change", function() {
						if (jQuery("#initStation").has("option")) {
							jQuery("#initStation>option").remove();
						}

						jQuery("#initStation").append(`<option selected>請選擇...</option>`);
							let selectCity = jQuery("#initCity>option:selected").text();
							for (let i = 0; i < areaString.length; i++) {
								for (let j = 0; j < areaString[i].length; j++) {
									if (selectCity == areaArr[i]) {
										jQuery("#initStation").append(`<option>` + areaString[i][j] + `</option>`);
									}
								}
						}
										});

				jQuery("#finalCity").on("change",function() {
						if (jQuery("#finalStation").has("option")) {
							jQuery("#finalStation>option").remove();
						}

						jQuery("#finalStation").append(`<option selected>請選擇...</option>`);
							let selectCity = jQuery("#finalCity>option:selected").text();
								for (let i = 0; i < areaString.length; i++) {
									for (let j = 0; j < areaString[i].length; j++) {
										if (selectCity == areaArr[i]) {
											jQuery("#finalStation").append(`<option>` + areaString[i][j] + `</option>`);
										}
									}
								}

				});
			});
</script>

</head>
<body>
	<h3>查詢車次</h3>
	<form action="queryRoute.controller" method="post">
		<table>
		<tr id="selectInit">
			<td>
				<label>起站地區:</label>
				<select id="initCity" name="initStation">
					<option selected >請選擇...</option>
				</select> 
			</td>
			<td>
				<label>上車站:</label>
			 	<select id="initStation" name="initStation"></select>
			</td>
			<td>
				<div style="color:#FF0000; font-size:60%">${errors.initStation}</div>
			</td>
		</tr>

		<tr id="selectfinal">
			<td>
				<label>訖站地區:</label>
				<select id="finalCity" name="finalStation">
					<option selected>請選擇...</option>
				</select>
			</td>
			<td>
				<label>下車站:</label>
				<select id="finalStation" name="finalStation"></select>
			</td>
			<td>
				<div style="color:#FF0000; font-size:60%">${errors.finalStation}</div>
			</td>
			<td>
				<div style="color:#FF0000; font-size:60%">${errors.sameStation}</div>
			</td>
		</tr>
			
		<tr>
			<td><input type="date" name="date"/></td>
		</tr>
		
		<tr>
			<td><input type="time" name="time"/></td>
		</tr>
		<tr>
			<td><button type="submit" value="queryRoute">送出</button></td>
		</tr>
		</table>
	</form>

<br> <a href="<c:url value='/index'/>">回首頁</a>

</body>
</html>
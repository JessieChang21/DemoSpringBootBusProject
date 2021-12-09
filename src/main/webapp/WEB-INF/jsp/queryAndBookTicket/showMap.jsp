<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>路線總覽</title>
<link rel="icon" href="images/bus.svg" type="image/x-icon" />
<link rel="stylesheet" href="/travelista-master/main.css">
<link rel="stylesheet"
	href="/webjars/font-awesome/5.13.0/css/all.min.css">
<link rel='stylesheet' href='/webjars/leaflet/dist/leaflet.css'>
<link rel='stylesheet'
	href='/webjars/leaflet.markercluster/dist/MarkerCluster.css'>
<link rel='stylesheet'
	href='/webjars/leaflet.markercluster/dist/MarkerCluster.Default.css'>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/leaflet.locatecontrol@0.75.0/dist/L.Control.Locate.min.css" />

<style>
#mapid {
	height: 88vh;
	width: 90vw;
	margin: auto;
	margin-top: 0;
}

.marker-cluster-small {
	background-color: rgba(181, 226, 140, 0.6);
}

.marker-cluster-small div {
	background-color: rgba(110, 204, 57, 0.6);
}

.marker-cluster-medium {
	background-color: rgba(241, 211, 87, 0.6);
}

.marker-cluster-medium div {
	background-color: rgba(240, 194, 12, 0.6);
}

.marker-cluster-large {
	background-color: rgba(253, 156, 115, 0.6);
}

.marker-cluster-large div {
	background-color: rgba(241, 128, 23, 0.6);
}

.marker-cluster {
	background-clip: padding-box;
	border-radius: 20px;
}

.marker-cluster div {
	width: 30px;
	height: 30px;
	margin-left: 5px;
	margin-top: 5px;
	text-align: center;
	border-radius: 15px;
	font-size: 12px;
	font-family: monospace;
}

.marker-cluster span {
	line-height: 30px;
}

#logo {
	color: #f8b600;
	font-family: Microsoft JhengHei;
	font-weight: bold;
	font-size: 1.8em;
	text-align: end;
	font-style: italic;
	margin-left: 1vw;
}

#logo2 {
	color: white;
	font-family: Microsoft JhengHei;
	font-size: 1.5em;
	font-weight: bold;
	margin-left: 20px;
}

.container {
	background-color: black;
	opacity: 73%;
	padding: auto;
	margin: auto;
	width: 90vw;
	height: 55px;
	margin-bottom: 0;
	display: flex;
	align-items: center
}

.container a:link, .container a:visited {
	text-decoration: none;
	color: #f8b600;
}


</style>
</head>
<body>
	<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
	<script src="/webjars/leaflet/dist/leaflet.js"></script>
	<script
		src="/webjars/leaflet.markercluster/dist/leaflet.markercluster.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/leaflet.locatecontrol@0.75.0/dist/L.Control.Locate.min.js"
		charset="utf-8"></script>

	<div class="container main-menu">
		<div>
			<span id="logo"><a href="/mainpage"> <i
					class="fas fa-bus-alt"></i> 無事坐Bus
			</a></span> <span id="logo2">- 路線總覽</span>
		</div>
	</div>

	<div id="mapid"></div>

	<script>
		var map = L.map('mapid').setView(
				[ 25.033915828225833, 121.54341113794499 ], 12);
		// add layers
		var osm = L.tileLayer(
				'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
					maxZoom : 20,
				});
		osm.addTo(map);

		googleStreets = L.tileLayer(
				'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}', {
					maxZoom : 20,
					subdomains : [ 'mt0', 'mt1', 'mt2', 'mt3' ]
				});
		googleStreets.addTo(map);

		googleSat = L.tileLayer(
				'http://{s}.google.com/vt/lyrs=s&x={x}&y={y}&z={z}', {
					maxZoom : 20,
					subdomains : [ 'mt0', 'mt1', 'mt2', 'mt3' ]
				});
		googleSat.addTo(map);

		// layer control
		var baseLayers = {
			"OpenStreetMap" : osm,
			"Satellite" : googleSat,
			"Google Map" : googleStreets
		}

		L.control.locate().addTo(map);
		L.control.layers(baseLayers).addTo(map);

		// set icon  color
		var blackIcon = new L.Icon(
				{
					iconUrl : 'https://cdn.jsdelivr.net/gh/pointhi/leaflet-color-markers@master/img/marker-icon-2x-black.png',
					iconSize : [ 25, 41 ],
					iconAnchor : [ 12, 41 ],
					popupAnchor : [ 1, -34 ],
					shadowSize : [ 41, 41 ]
				});

		var blueIcon = new L.Icon(
				{
					iconUrl : 'https://cdn.jsdelivr.net/gh/pointhi/leaflet-color-markers@master/img/marker-icon-2x-blue.png',
					iconSize : [ 25, 41 ],
					iconAnchor : [ 12, 41 ],
					popupAnchor : [ 1, -34 ],
					shadowSize : [ 41, 41 ]
				});
		var goldIcon = new L.Icon(
				{
					iconUrl : 'https://cdn.jsdelivr.net/gh/pointhi/leaflet-color-markers@master/img/marker-icon-2x-gold.png',
					iconSize : [ 25, 41 ],
					iconAnchor : [ 12, 41 ],
					popupAnchor : [ 1, -34 ],
					shadowSize : [ 41, 41 ]
				});
		var greenIcon = new L.Icon(
				{
					iconUrl : 'https://cdn.jsdelivr.net/gh/pointhi/leaflet-color-markers@master/img/marker-icon-2x-green.png',
					iconSize : [ 25, 41 ],
					iconAnchor : [ 12, 41 ],
					popupAnchor : [ 1, -34 ],
					shadowSize : [ 41, 41 ]
				});
		var greyIcon = new L.Icon(
				{
					iconUrl : 'https://cdn.jsdelivr.net/gh/pointhi/leaflet-color-markers@master/img/marker-icon-2x-grey.png',
					iconSize : [ 25, 41 ],
					iconAnchor : [ 12, 41 ],
					popupAnchor : [ 1, -34 ],
					shadowSize : [ 41, 41 ]
				});
		var orangeIcon = new L.Icon(
				{
					iconUrl : 'https://cdn.jsdelivr.net/gh/pointhi/leaflet-color-markers@master/img/marker-icon-2x-orange.png',
					iconSize : [ 25, 41 ],
					iconAnchor : [ 12, 41 ],
					popupAnchor : [ 1, -34 ],
					shadowSize : [ 41, 41 ]
				});
		var redIcon = new L.Icon(
				{
					iconUrl : 'https://cdn.jsdelivr.net/gh/pointhi/leaflet-color-markers@master/img/marker-icon-2x-red.png',
					iconSize : [ 25, 41 ],
					iconAnchor : [ 12, 41 ],
					popupAnchor : [ 1, -34 ],
					shadowSize : [ 41, 41 ]
				});
		var violetIcon = new L.Icon(
				{
					iconUrl : 'https://cdn.jsdelivr.net/gh/pointhi/leaflet-color-markers@master/img/marker-icon-2x-violet.png',
					iconSize : [ 25, 41 ],
					iconAnchor : [ 12, 41 ],
					popupAnchor : [ 1, -34 ],
					shadowSize : [ 41, 41 ]
				});
		var yellowIcon = new L.Icon(
				{
					iconUrl : 'https://cdn.jsdelivr.net/gh/pointhi/leaflet-color-markers@master/img/marker-icon-2x-yellow.png',
					iconSize : [ 25, 41 ],
					iconAnchor : [ 12, 41 ],
					popupAnchor : [ 1, -34 ],
					shadowSize : [ 41, 41 ]
				});

		// set marker
		// var orangeAppleMarker = L.marker([25.033915828225833, 121.54341113794499], { icon: greenIcon }).addTo(map)
		// .bindPopup('<p>You are here!</p>').openPopup();

		var markers = new L.MarkerClusterGroup().addTo(map);
		var STR = new Array();
		window.onload = function() {
			$.ajax({
				url : "/queryMap",
				type : "GET",
				dataType : 'JSON',
				contectType : 'application.json',
				success : function(data) {
					var str = JSON.stringify(data);
					var json = JSON.parse(str);

					for (let i = 0; i < json.length; i++) {
						var tripicon;
						if (json[i].tripname == '縱谷花蓮線'
								|| json[i].tripname == '東眼山線'
								|| json[i].tripname == '關子嶺線') {
							tripicon = blackIcon;
						} else if (json[i].tripname == '太魯閣線'
								|| json[i].tripname == '雲林草嶺線') {
							tripicon = blueIcon;
						} else if (json[i].tripname == '冬山河線'
								|| json[i].tripname == '西濱快線') {
							tripicon = goldIcon;
						} else if (json[i].tripname == '壯圍沙丘線'
								|| json[i].tripname == '黃金福隆線') {
							tripicon = greenIcon;
						} else if (json[i].tripname == '宜蘭東北角海岸線'
								|| json[i].tripname == '光林我嘉線') {
							tripicon = greyIcon;
						} else if (json[i].tripname == '礁溪線'
								|| json[i].tripname == '故宮南院線') {
							tripicon = orangeIcon;
						} else if (json[i].tripname == '大溪快線'
								|| json[i].tripname == '北投竹子湖線') {
							tripicon = redIcon;
						} else if (json[i].tripname == '小烏來線'
								|| json[i].tripname == '山博行線') {
							tripicon = violetIcon;
						} else if (json[i].tripname == '石門水庫線'
								|| json[i].tripname == '皇冠北海岸線') {
							tripicon = yellowIcon;
						}

						markers.addLayer(L.marker([ json[i].lan, json[i].lon ],
								{
									icon : tripicon
								}).bindPopup(
								'<h3>' + json[i].tripname + ": </h3>"
										+ '<h4> ( ' + json[i].stationsequence
										+ " ) " + json[i].station + ' </h4>')
								.openPopup());
					}
					map.addLayer(markers);
				}
			})
		}
	</script>
</body>
</html>
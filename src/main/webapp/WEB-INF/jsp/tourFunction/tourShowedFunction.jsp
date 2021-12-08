<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="all.css">
<style type="text/css">
	html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
		blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
		em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var,
		b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend,
		table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
		details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
		output, ruby, section, summary, time, mark, audio, video {
		margin: 0;
		padding: 0;
		border: 0;
		font-size: 100%;
		font: inherit;
		vertical-align: baseline;
	}
	/* HTML5 display-role reset for older browsers */
	article, aside, details, figcaption, figure, footer, header, hgroup,
		menu, nav, section {
		display: block;
	}
	
	body {
		line-height: 1;
	}
	
	ol, ul {
		list-style: none;
	}
	
	blockquote, q {
		quotes: none;
	}
	
	blockquote:before, blockquote:after, q:before, q:after {
		content: '';
		content: none;
	}
	
	table {
		border-collapse: collapse;
		border-spacing: 0;
	}
	
	* {
		box-sizing: border-box;
	}
	
	.clearfix {
		clear: both;
	}
	
	.wrap {
		width: 900px;
		margin: 0 auto;
	}
	
	.header {
		border: 1px solid black;
		height: 150px;
		margin: 10px;
		background: grey;
		font-size: 22px;
		padding: 10px;
	}
	
	.left {
		width: 180px;
		border: 1px solid black;
		height: 600px;
		float: left;
		margin: 10px;
		background: grey;
	}
	
	.center {
		width: 680px;
		border: 1px solid black;
		height: 600px;
		float: left;
		margin: 10px;
		background: grey;
	}
	
	.right {
		width: 230px;
		border: 1px solid black;
		height: 600px;
		float: left;
		margin: 10px;
		background: grey;
	}
	
	.footer {
		border: 1px solid black;
		height: 200px;
		margin: 10px;
		background: grey;
	}
	
	.header h1 a {
		background-image: url('./images/tour/tourtitleimages.jpg');
		background-position: center center;
		background-repeat: no-repeat;
		background-size: 100px 100px;
		width: 128px;
		height: 128px;
		text-indent: 101%;
		overflow: hidden;
		white-space: nowrap;
		float: left;
	}
	
	.header ul {
		float: right;
		margin-top: 55px;
		margin-right: 20px;
	}
	
	.header ul li {
		float: left;
		margin-right: 25px;
		font-size: 18px;
	}
	
	.header ul li a {
		text-decoration: none;
		color: white;
	}
	
	.showed-Area {
		
	}
	
	.hided-Area {
		display: none;
	}
</style>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<h1>
				<a href="/tourfindall">旅遊套票</a>
			</h1>
			<ul>
				<li><a href="">║套票一覽║</a></li>
				<li><a href="">║購買指南║</a></li>
				<li><a href="">║使用說明║</a></li>
				<li><a href="">║兌換地點║</a></li>
				<li><a href="">║注意事項║</a></li>
			</ul>
		</div>
		<div class="content">
			<div class="left">
				<div id="Area2Routes" >
					<div>
					<h4>路線選擇</h4>
					</div>
					<div id="showedArea">
						<ul style="display: inline;">
							<li id="N" style="display: inline;"><a href="#1">北部</a></li>
							<li id="M" style="display: inline;"><a href="#2">中部</a></li>
							<li id="S" style="display: inline;"><a href="#3">南部</a></li>
							<li id="E" style="display: inline;"><a href="#4">東部</a></li>
						</ul>
					</div>
					<!-- 北 -->
					<div id="North" class="showed-Area">
						<div>宜蘭縣</div>
						<div>基隆市</div>
						<div>台北市</div>
						<div>新北市</div>
						<div>桃園市</div>
						<div>新竹縣</div>
					</div>
					<!-- 中 -->
					<div id="Middle" class="hided-Area">
						<div>苗栗縣</div>
						<div>台中市</div>
						<div>南投縣</div>
						<div>彰化縣</div>
						<div>雲林縣</div>
					</div>
					<!-- 南 -->
					<div id="South" class="hided-Area">
						<div>嘉義縣</div>
						<div>台南市</div>
						<div>高雄市</div>
						<div>屏東縣</div>
					</div>
					<!-- 東 -->
					<div id="East" class="hided-Area">
						<div>花蓮縣</div>
						<div>台東縣</div>
					</div>
				</div>
			</div>
			<div class="center">
			<div id="">
			台北市
			</div>
			
			
			</div>
		</div>
		<div class="clearfix">4</div>
		<div class="footer">5</div>
	</div>
</body>
<script>
$('#N').click(function(showedNorth){
	console.log('顯示北部');
	$('#North').attr('class', 'showed-Area');
	$('#Middle').attr('class', 'hided-Area'); 
	$('#South').attr('class', 'hided-Area'); 
	$('#East').attr('class', 'hided-Area');
	});
$('#M').click (function (showedMiddle){
	console.log('顯示中部');
	$('#North').attr('class', 'hided-Area');
	$('#Middle').attr('class', 'showed-Area'); 
	$('#South').attr('class', 'hided-Area'); 
	$('#East').attr('class', 'hided-Area');
	});
$('#S').click (function (showedSouth){
	console.log('顯示南部');
	$('#North').attr('class', 'hided-Area');
	$('#Middle').attr('class', 'hided-Area'); 
	$('#South').attr('class', 'showed-Area'); 
	$('#East').attr('class', 'hided-Area');
	});
$('#E').click (function (showedEast){
	console.log('顯示東部');
	$('#North').attr('class', 'hided-Area');
	$('#Middle').attr('class', 'hided-Area'); 
	$('#South').attr('class', 'hided-Area'); 
	$('#East').attr('class', 'showed-Area');
	});
</script>
</html>
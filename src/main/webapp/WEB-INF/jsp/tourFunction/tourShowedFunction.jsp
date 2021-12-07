<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TourPackages</title>
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
	width: 430px;
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
	background-size:100px 100px;
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
				<li><a href="">║購買地點║</a></li>
				<li><a href="">║注意事項║</a></li>
				<li><a href="">66</a></li>
				<li><a href="">77</a></li>
			</ul>
		</div>
		<div class="content">
			<div class="left">
			<table>
			<tr>
			<th>北</th>
			<th>中</th>
			<th>南</th>
			<th>東</th>
			</tr>
			<tr>
			<td></td>
			</tr>
			</table>
			</div>
			<div class="center">2</div>
			<div class="right">3</div>
		</div>
		<div class="clearfix">4</div>
		<div class="footer">5</div>
	</div>
</body>
</html>
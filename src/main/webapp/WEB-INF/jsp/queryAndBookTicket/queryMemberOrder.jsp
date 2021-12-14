<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="colorlib">
<meta name="description" content="">
<meta name="keywords" content="">
<meta charset="UTF-8">
<title>會員訂單資訊</title>
<link rel="icon" href="images/bus.svg" type="image/x-icon" />
<style type="text/css">
#banner{
    background-image: url("/images/queryRoutes/thumb.jpg");
}

#showOrder{
	font-family: "Microsoft soft";
	font-weight: bold;
	font-size: 22px;
	margin-bottom: 2vh
}

#ordertable {
	border-collapse: collapse;
	
}
#ordertable th{
    background-color: darkslategray;
    color: white;
    font-family: "Poppins", sans-serif;
    border: 1px solid white;
    width: 100px;
    text-align: center;
 	font-size: 18px;
}
#ordertable tr td {
	
 	width: 100px;
	border: 1px solid black;
	text-align: center;
	font-weight: normal;
 	font-size: 16px; 
}
/* CSS ============================================= */
#sidea>a{
	color:black;
	font-family: "Microsoft soft";
	font-weight: bold
}
#table_wrap>table {
	font-size: 16px;
	text-align: center;
	margin: 0 auto;
	border-collapse: separate;
	border-spacing: 0;
	border: 2px #000;
}


#table_wrap>table {
	margin: auto;
	width: 70%;
	border-collapse: collapse;
	font-size: 16px;
	text-align: center;
	margin: 0 auto;
	border-collapse: separate;
	border-spacing: 0;
	border: 2px #000;
}

#table_wrap>thead tr,#table_wrap>tbody tr {
	height: 50px;
	line-height: 50px;
	/*background-color: pink;*/
}

#table_wrap>tr th:first-child,#table_wrap>tr td:first-child { /*設定table左邊邊框*/
	border-left: 2px solid #eaeaea;
}

#table_wrap>tr th:last-child,#table_wrap>tr td:last-child { /*設定table右邊邊框*/
	border-right: 2px solid #eaeaea;
}

#table_wrap>tr td:first-child,#table_wrap>tr td:nth-child(2), table tr td:nth-child(3),
	table tr td:last-child { /*設定table表格每列底部邊框*/
	border-bottom: 2px solid #eaeaea;
}

#table_wrap>tr:last-child td:first-child,#table_wrap>tr:last-child td:nth-child(2),
	table tr:last-child td:nth-child(3), table tr:last-child td:last-child
	{ /!*設定table表格最後一列底部邊框 *!/ border-bottom:2pxsolid#000;
	
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

#orderrange{
	width:75vw;
	margin-left:23vw;
}

#deleteorder{
	margin-top:1vw;
	margin-left:64vw;
}

#orderid{
	width:90px;
}

#memberOrder{
	width:75vw;
}
#totalPrice{
	font-size: 1.5em;
	font-family: "Poppins", sans-serif;
	font-weight: bold;
	color:#f8b600;
	margin-left:55vw;
	margin-top:1vw;
}
</style>
<!-- CSS ============================================= -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<link rel="stylesheet" href="/travelista/css/linearicons.css">
<link rel="stylesheet" href="/travelista/css/font-awesome.min.css">
<link rel="stylesheet" href="/travelista/css/bootstrap.css">
<link rel="stylesheet" href="/travelista/css/magnific-popup.css">
<link rel="stylesheet" href="/travelista/css/jquery-ui.css">
<link rel="stylesheet" href="/travelista/css/nice-select.css">
<link rel="stylesheet" href="/travelista/css/animate.min.css">
<link rel="stylesheet" href="/travelista/css/owl.carousel.css">
<link rel="stylesheet" href="/travelista/css/main.css">
</head>
<body>
<!-- 	<script src="/webjars/jquery/3.1.1/jquery.min.js"></script> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/travelista/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="/travelista/js/popper.min.js"></script>
	<script src="/travelista/js/vendor/bootstrap.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="/travelista/js/jquery-ui.js"></script>
	<script src="/travelista/js/easing.min.js"></script>
	<script src="/travelista/js/hoverIntent.js"></script>
	<script src="/travelista/js/superfish.min.js"></script>
	<script src="/travelista/js/jquery.ajaxchimp.min.js"></script>
	<script src="/travelista/js/jquery.magnific-popup.min.js"></script>
	<script src="/travelista/js/jquery.nice-select.min.js"></script>
	<script src="/travelista/js/owl.carousel.min.js"></script>
	<script src="/travelista/js/mail-script.js"></script>
	<script src="/travelista/js/main.js"></script>
	
	<!-- HTML ============================================= -->
	<c:import url="/WEB-INF/jsp/commons/header.jsp" />
	<!-- start banner Area -->
	<section class="about-banner relative" id="banner">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">訂票成功</h1>
					<p class="text-white link-nav">
						<a href="/mainpage">首頁 </a> <span class="lnr lnr-arrow-right"></span>
						<span> 訂票成功</span>
					</p>
				</div>
			</div>
		</div>

	</section>
	
	<BR />
	<BR />
	<BR />
	<div style="height:100px;">
	<div id="table_wrap" style="float: left; margin-left: 50px">
		<table id="table_wrap">
			<tr>
				<th style="background-color: #f8b600; font-size: 140%; color:white"
					align="center" width="300px" height="50px">會員中心</th>
			</tr>
			<tr>
				<td id="sidea" style="background-color: white;">
					<a href="/updatemembers.controller">會員資料更新</a>
				</td>
			</tr>
			<tr>
				<td id="sidea" style="background-color: white;">
					<a href="/members/queryMemberOrder">訂單查詢</a>
				</td>
			</tr>
		</table>
	</div>
	
	<div id="orderrange">
		<div id="showOrder">您的訂單編號如下，請點選查看:</div>
		<div id="memberOrder"></div>
	</div>

	<br>

	<c:import url="/WEB-INF/jsp/commons/footer.jsp" />
	<script>
	window.onload = function() {
		$("#memberOrder").empty();
		        
		$.ajax({
			url : "/members/queryMemberOrderByEmail",
			type : "GET",
			dataType : 'JSON',
			contectType : 'application.json',
			success : function(data) {
				var str = JSON.stringify(data);
				var json = JSON.parse(str);
				if(json.length==0){
					$("#showOrder").html("您暫無訂單紀錄");
				}
				for (let i = 0; i < json.length; i++) {
					$("#memberOrder").append(`<div id="` + json[i].orderid + `">`+
										`<button type="button" class="btn btn-warning" name = "orderid" id="orderid"  value="`+ json[i].orderid +`">` + json[i].orderid  + `</botton>
										</div><br>`);
				}
							
				$("button").on("click",function(){
					var orderid = $(this).val();
					$("#"+orderid+">table").remove();
					$("#"+orderid+">div").remove();
					var totalPrice=0;
					
					$.ajax({
						url : "/members/queryMemberOrderByOrderId/" + orderid,
						type : "GET",
						dataType : 'JSON',
						contectType : 'application.json',
						success : function(data) {
						    var str = JSON.stringify(data);
							var json = JSON.parse(str);
							$("#"+orderid+"").append(`<table id = "ordertable">
												<tr>
													<th>訂票編號</th>
													<th>車次編號</th>
													<th>路線名稱</th>
													<th>起站</th>
													<th>迄站</th>
													<th>乘車日期</th>
													<th>發車時間</th>
													<th>旅程時間</th>
													<th>座位編號</th>
													<th>票種</th>
													<th>票價</th>
						        				</tr></table>`);
							
							for (let i = 0; i < json.length; i++) {
							totalPrice += json[i].price;
							$("#"+orderid+"").append(`<table id = "ordertable">
										        <tr>
										        	<td>`+ json[i].orderid + `</td>
										        	<td>`+ json[i].busnumber +`</td>
										        	<td>`+ json[i].tripname +`</td>
										        	<td>`+ json[i].initialstation +`</td>
										        	<td>`+ json[i].finalstation +`</td>
										        	<td>`+ json[i].traveldate +`</td>
										        	<td>`+ json[i].formatinitaltime +`</td>
										        	<td>`+ json[i].traveltime +`</td>
										        	<td>`+ json[i].seat +`</td>
										        	<td>`+ json[i].tickettype +`</td>
										        	<td>`+ json[i].price +`</td>
										        </tr>
											
												</table>`);
								
							}
							$("#deleteorder").remove();
							$("#"+orderid+"").append(`<div id="totalPrice">訂單總金額 : NT$ ` + totalPrice + `元整 </div>`);
							$("#"+orderid+"").append(`<button type="button" id="deleteorder" value="`+orderid+`" class="btn btn-danger">刪除此筆訂單</button>`);
								$("#deleteorder").click(function(){
									var deleteorderid =$(this).val();
									alert("確認刪除此筆訂單?");
									$("#"+deleteorderid+"").remove();
									
									alert("訂單編號 "+deleteorderid+" 刪除成功!");
									if($("#memberOrder:has(button)").length == 0){
										$("#showOrder").html("您暫無訂單紀錄");
									}
									
									$.ajax({
										url : "/members/deleteMemberOrderByOrderId/" + deleteorderid,
										type : "GET",
										dataType : 'JSON',
										contectType : 'application.json',
										success : function(data) {
											console.log("delete success")
										
										
										}//ajax3 success
										
									}) // ajax3
									
									
								}) // deleteorder click
									
								
						} //ajax2 success
					}) //ajax2
				}) // botton click
								
								
			} //ajax1 success
							
		}) //ajax1

	}	//windowonload
		
		
		
		
		
	</script>
</body>
</html>
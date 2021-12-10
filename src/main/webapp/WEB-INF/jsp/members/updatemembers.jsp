<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="colorlib">
<meta name="description" content="">
<meta name="keywords" content="">
<meta charset="UTF-8">
<title>車次查詢結果</title>
<link rel="icon" href="images/bus.svg" type="image/x-icon" />
<style type="text/css">

#all, #d0, #d1 ,#m1{
	font-size: 1.2em;
}

#left {
	text-align: center;
	width: 300px;
}

#left {
	text-align: center;
	width: 500px;
}

#tripname, #tripdate, #triptime ,#updatemembers{
	float:left;
	font-size: 1.5em;
	font-family: "Poppins", sans-serif;
	font-weight: bold;
	background-color: #f8b600;
	border-radius: 10px;
	margin-bottom: 3%;
	margin-left: 4%;
	width: 300px;
	height: 50px;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
}

.none {
	float: right;
	margin-right: 35%;
	font-size: 1.5em;
	font-family: "Poppins", sans-serif;
	font-weight: bold;
	background-color: darkslategray;
	border-radius: 10px;
	width: 300px;
	height: 50px;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
}

table {
	font-family: "Poppins", sans-serif;
	border-collapse: collapse;
	text-align: center;
	margin: auto;
	width:73vw;
}

table tr th {
	background-color: darkslategray;
	color:white;
	font-size: 1.3em;
	font-family: "Poppins", sans-serif;
	border: 1px solid white;
}

table td{
	color:black;
	font-size: 16px;
	border: 1px solid #38a4ff;
	
}

table thead tr, table tbody tr {
/* 	height: 50px; */
 	line-height: 32px; 
}

table tr:last-child td:first-child, table tr:last-child td:nth-child(2),
	table tr:last-child td:nth-child(3), table tr:last-child td:last-child
	/*設定table表格最後一列底部邊框 */ {
/* 	border-bottom: 2px solid #000; */
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
#right {
	margin: auto;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
}

select {
            text-align: center;
/*             height: 50px; */
			width:200px
            overflow: hidden;
            border: none;
            outline: none;
            background: #eee;
            border-radius: 10px;
        }
option{
            width: 200px;
            height: 40px;
            font-size: 20px;
            display: inline-block;
            border-radius: 10px;
            padding-top: 10px;
        }
#table_wrap>table {
	font-size: 20px;
	text-align: center;
	margin: 0 auto;
	border-collapse: separate;
	border-spacing: 0;
	border: 3px #000;
	border-radius: 12px
/* } */
/* #table_wrap>table>tr>td{ */
/* 	font-size: 16px; */
/* 	text-align: center; */
/* 	margin: 0 auto; */
/* 	border-collapse: separate; */
/* 	border-spacing: 0; */
/* 	border: 3px #000; */
/* 	border-radius: 12px */
/* } */

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
	   load();
   });
   
   function load(){
	   var i;
	   var j;
	   $.ajax({
		   type:'Post',
		   url:'/membersAdress',
		   dataType:'JSON',
		   contentType:'application/json',
		   success: function(data){
			   
			   console.log('success:' + data);
			   var json = JSON.stringify(data,null,4);
			   console.log('json:' + json);			   
			   
			   var adresscity = data; 
			   console.log(adresscity);
			   var res = ""; 
			   
			   for(i =0;i<adresscity.length;i++){ 
			 
			   res += "<option>"+adresscity[i].cityname+"</option>" 
			   } 
			   
			    $("#adresscity").append(res); 
			    }
		    });

	$("#adresscity").change(function(){ 
		var selectedcityValue = $("#adresscity option:selected").val();
  		console.log(selectedcityValue);
//   		$('#adress').val(selectedcityValue);
// 			 var seled = $("option:selected").html(); 
			      
// 			 $("span").html(seled); 

// 			 console.log(seled);
			 var params = {"seled":selectedcityValue};
 
		  console.log(params);
			$.ajax({
		   	   type:'POST',
		   	   url:'/Adressarea',
		   	   dataType:'JSON',
		   	   contentType:'application/json',
		   	   data:JSON.stringify(params),
		   	   success: function(data){
		   		$("#adressarea").empty();
				   console.log(data);
				   var area = data;
				   console.log(area);
				   var aes = "";
				   for(j = 0;j<area.length;j++){ 
					   aes += "<option>"+area[j].areaname+"</option>"; 
					  } 
				   $("#adressarea").append(aes);
		   	   }
	   });
  });
  
   $("#adressarea").change(function(){ 
	   var selectedValue = $("#adressarea option:selected").val();
  		console.log(selectedValue);
  		$('#adress').val(selectedValue);
   });
   } 
</script>
</head>

<body>
	<!-- <script -->
	<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
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
	<section class="about-banner relative">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">車次查詢結果</h1>
					<p class="text-white link-nav">
						<a href="/mainpage">首頁 </a> <span class="lnr lnr-arrow-right"></span>
						<span> 車次查詢結果</span>
					</p>
				</div>
			</div>
		</div>

	</section>
	<!-- End banner Area -->
	<!-- -------------------------------------------------------------------- -->
	<BR />
	<div id="left">
		<span id="tripname">會員資料 : ${inputdataObj.updatemembers}</span>
		<span id="tripname">查詢路線 : ${inputdataObj.tripname}</span>
		<span id="tripdate">查詢日期 : ${inputdataObj.traveldate}</span>
		<span id="triptime">查詢時間 : ${inputdataObj.initialtime}</span>
	</div>
		<form:form method="POST" action="/memberupdate.controller" enctype='multipart/form-data' modelAttribute="members" >
		<div id="table_wrap">
			<table>	
			<tr>
			<td rowspan="2"><img height='100px' width='100px' Style="border-radius:50%" src="<c:url value='/getMemberImage?id=${members.id}' />">
			<td><form:input path="membername" name="membername" type="text" value="${members.membername}" readonly="readonly"/>
			</tr><tr>
			<td><form:input path="email" name="email" type="text" value="${members.email}" readonly="readonly"/>
			</tr><tr>
			<td><form:input path="memberMultipartFile" name="memberMultipartFile" type='file'/>
			
			<td><span class="radio">請選擇性別:&emsp;&emsp; 
			<label><form:radiobutton path="gender" name="gender" value="男" /> 男 </label>
			<label><form:radiobutton path="gender" value="女" /> 女 </label> 
			<label><form:radiobutton path="gender" value="保密" checked="true"/> 保密 </label> </span>
			</tr>
			<td><span style="float:left;">&emsp;&emsp;&emsp;年齡層:&emsp;&emsp;&emsp;</span><form:select path="age" name="age" value="${members.age}" > 
			<option value="1">--請選擇--</option> <option value="2">10歲以下</option> <option value="3">10歲至20歲</option > <option value="4">20歲至30歲</option> <option value="5">30歲至40歲</option>
			<option value="6">40歲至50歲</option><option value="7">50歲至60歲</option> <option value="8">60歲至70歲</option> <option value="9">70歲以上 </option> </form:select>
			</td>
			<td>
			<form:input path="adress" id="adress" name="adress" value="${members.adress}" style="height:1px; visibility:hidden" />
			<div ><span style="float:left;">&emsp;&emsp;&emsp;&emsp;請選擇居住地:&emsp;&emsp;&emsp;</span>
								<span style="float:left;">縣市:&emsp;&emsp;</span><select id="adresscity" style="float:left;"> 
									   <option>--請選擇縣市--</option> 
									  </select> 
									   
								  <span style="float:left;">&emsp;&emsp;&emsp;地區鄉政:&emsp;&emsp;</span><select id="adressarea" style="float:left;"> 
								    <option>--請選擇地區鄉政--</option> 
								   </select><br>
								  <span id="adress" style="height:101px; visibility:hidden" ><br></span></td></div>
			<tr><td colspan="2">
			<div id="btnArea" align="center">
		 	 	<input class="primary-btn" style="border-radius: 12px;width: 200px" type="submit" name="submit" value="儲存"/>
		  		<input class="primary-btn" style="border-radius: 12px;width: 200px" type="reset" name="cancel" value="重填" />
		  		<form:input path="memberpwd" name="memberpwd" type="password" value="${members.memberpwd}" style="height:1px;width:1px; visibility:hidden" readonly="readonly" />
		  		<form:input path="id" name="id" type="password" value="${members.id}" style="height:1px;width:1px; visibility:hidden" readonly="readonly" />
			</div></tr>
			</table>
			</div>
		</form:form>
	<c:choose>
		<c:when test="${empty result}">
			<div id="all" class="none">暫無相關班次資訊</div>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${empty byTripnameResult0}">
			<div id="d0" class="none">暫無順向班次資訊</div>
		</c:when>
		<c:otherwise>
			<div id="table_right">
				<form action="/members/bookTicket.controller" method="POST">
					<table id="showbus">
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
								<td><button class="btn btn-outline-warning" type="submit" name="bookBus"
										value="${aBean.busnumber}">BookNow!</button></td>
							</tr>
						</c:forEach>
					</table>
					<input id="tripname" value="${inputdataObj.tripname}" type="hidden">
					<input id="traveldate" value="${inputdataObj.traveldate}"
						type="hidden"> <input id="weekday"
						value="${inputdataObj.weekday}" type="hidden"> <input
						id="initialtime" value="${inputdataObj.initialtime}" type="hidden">
					<input id="adult" value="${inputdataObj.adult}" type="hidden">
					<input id="children" value="${inputdataObj.children}" type="hidden">
					<input id="inputdata" name="inputdata" type="hidden">
				</form>
			</div>
		</c:otherwise>
	</c:choose>
	<br>
	<br>
	<c:choose>
		<c:when test="${empty byTripnameResult1}">
			<div id="d1" class="none">暫無逆向班次資訊</div>
		</c:when>
		<c:otherwise>
			<div id="table_right">
				<form action="/members/bookTicket.controller" method="POST">
					<table id="showbus">
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
								<td><button class="btn btn-outline-warning" type="submit" name="bookBus"
										value="${aBean.busnumber}">BookNow!</button></td>
							</tr>
						</c:forEach>
					</table>
<%-- 					<input id="updatemembers" value="${inputdataObj.updatemembers}" type="hidden"> --%>
					<input id="tripname" value="${inputdataObj.tripname}" type="hidden">
					<input id="traveldate" value="${inputdataObj.traveldate}"
						type="hidden"> <input id="weekday"
						value="${inputdataObj.weekday}" type="hidden"> <input
						id="initialtime" value="${inputdataObj.initialtime}" type="hidden">
					<input id="adult" value="${inputdataObj.adult}" type="hidden">
					<input id="children" value="${inputdataObj.children}" type="hidden">
					<input id="inputdata" name="inputdata" type="hidden">
				</form>
			</div>
		</c:otherwise>
	</c:choose>


	<!-- -------------------------------------------------------------------- -->
	<c:import url="/WEB-INF/jsp/commons/footer.jsp" />

	<script type="text/javascript">
		var params = {
			"tripname" : $("#tripname").val(),
			"traveldate" : $("#traveldate").val(),
			"weekday" : $("#weekday").val(),
			"initialtime" : $("#initialtime").val(),
			"adult" : $("#adult").val(),
			"children" : $("#children").val()
		}

		$("#inputdata").val(JSON.stringify(params));

		window.onload = function() {
			var all = $("#all").html();
			var d0 = $("#d0").html();
			var d1 = $("#d1").html();

			if (all == "暫無相關班次資訊") {
				$("#d0").removeClass("none");
				$("#d1").removeClass("none");
				$("#d0").html("");
				$("#d1").html("");

			}
		}
	</script>

</body>

</html>
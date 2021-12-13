<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<style type="text/css">
table {
	margin: auto;
	width: 70%;
	border-collapse: collapse;
}

#table_wrap>table {
	font-size: 16px;
	text-align: center;
	margin: 0 auto;
	border-collapse: separate;
	border-spacing: 0;
	border: 2px #000;
}

table thead tr, table tbody tr {
	height: 50px;
	line-height: 50px;
	/*background-color: pink;*/
}

table tr th:first-child, table tr td:first-child { /*設定table左邊邊框*/
	border-left: 2px solid #eaeaea;
}

table tr th:last-child, table tr td:last-child { /*設定table右邊邊框*/
	border-right: 2px solid #eaeaea;
}

table tr td:first-child, table tr td:nth-child(2), table tr td:nth-child(3),
	table tr td:last-child { /*設定table表格每列底部邊框*/
	border-bottom: 2px solid #eaeaea;
}

table tr:last-child td:first-child, table tr:last-child td:nth-child(2),
	table tr:last-child td:nth-child(3), table tr:last-child td:last-child
	{ /!*設定table表格最後一列底部邊框 *!/ border-bottom:2pxsolid#000;
	
}

table tr th {
	background-color: darkslategray;
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

a {
	text-decoration: none
}

a:hover {
	text-decoration: underline
}

a:visited {
	color: blue;
}

#Title1 {
	margin: auto;
	font-size: 25px;
	font-weight: bold;
	text-align: center;
}

input:hover {
	background-color: #F1E1FF;
	text-decoration: underline;
}

select {
        text-align: center;
	 	width:200px;
        overflow: hidden;
        border: 1px;
        outline: none;
        background: #eee;
        border-radius: 10px;
        }
option{
       width: 200px;
       font-size: 20px;
       display: inline-block;
       border-radius: 10px;
       padding-top: 10px;
        }
#minetable{
	margin: auto;
	width: 75%;
	border-collapse: collapse;
	font-size: 16px;
	text-align: center;
	margin: 0 auto;
	border-collapse: separate;
	border-spacing: 0;
	border: 2px #000;
	padding:20px;

}
#umembername{
	text-align:center;
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 300px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
    height:10px;
}
#uemail{
	text-align:center;
    outline-style: none ;
    border: 1px solid #ccc; 
    border-radius: 10px;
    padding: 14px 16px;
    width: 300px;
    font-size: 18px;
    font-weight: 100;
    font-family: "Microsoft soft";
    height:10px;
}

#sidea>a{
	color:black;
	font-family: "Microsoft soft";
	font-weight: bold
}

#changepasswordtest, #memberupdatetitle{
	font-family: "Microsoft soft";
	font-weight: bold;
	color:white;
	font-size: 18px;
	text-align:center;
}

</style>
<meta charset="UTF-8">
<title>會員中心</title>
<link rel="icon" href="images/bus.svg" type="image/x-icon" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="/travelista/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="colorlib">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
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
   
   
   function passwordcheckclick(){
	   
	   var pemail = prompt('請輸入您的電子郵箱');

		if(pemail == null){
			alert('沒有輸入');
		}else{
		var params = {"email":pemail}
		console.log(params);
		$.ajax({
	    	   type:'POST',
	    	   url:'/sendeMail',
	    	   dataType:'JSON',
	    	   contentType:'application/json',
	    	   data:JSON.stringify(params),
	    	   success: function(data){
	    		   console.log(data);
	    		   console.log(data['random']);
	    		   var checkpassword = prompt('請輸入電子郵箱驗證碼');
	    		   if(checkpassword != data['random']){
	    				alert('電子郵箱驗證碼輸入錯誤');
	    			}else{
	    				var newpassword = prompt('請輸入新密碼(至少8位數)');
	    				if(newpassword.length < 8){
	    					alert('密碼不可少於8位數');
	    				}else{
	    					var checknewpassword = prompt('請再次輸入新密碼');
		    				if(newpassword != checknewpassword){
		    					alert('驗證密碼輸入錯誤');
		    				}else{
		    					$('#memberpwd').val(checknewpassword);
								console.log(checknewpassword);
								alert('密碼更改成功');
		    				}
	    				}
	    			}
	    		   
	    	   }
	    	});
		}
	}

</script>
</head>
<body style="background-color: #F2F2F2;">

	<!-- #header -->
	<c:import url="/WEB-INF/jsp/commons/header.jsp" />
	<!-- start banner Area -->
	<section class="about-banner relative">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">會員中心</h1>
					<p class="text-white link-nav">
						<a href="/mainpage">首頁 </a> <span class="lnr lnr-arrow-right"></span> <a
							href="/showAnnouncement"> 會員中心</a>
					</p>
				</div>
			</div>
		</div>

	</section>
	<!-- End banner Area -->
	<BR />
	<BR />
	<BR />
	<div style="height:100px; ">
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
<!-- 	<div id="minetable" align='center' style="float:left;width:780px;padding-top:0px;height:300px"> -->
	<form:form method="POST" action="/memberupdate.controller" enctype='multipart/form-data' modelAttribute="members" style="float:left;width:780px;height:380px;">
	<table style="float:left;width:780px;height:380px;">	
	<tr>
		<th id="memberupdatetitle" colspan="2" style="height:50px;padding-bottom: 0px;padding-top:0px">&emsp;&emsp;&emsp;&emsp;&emsp;會員更新</th>
<!-- 		<th></th> -->
	</tr>
	<tr>
		<td rowspan="3" style="text-align:center;"><img height='150px' width='150px' Style="border-radius:50%" src="<c:url value='/getMemberImage?id=${members.id}' />">
		<td style="text-align:center;">
			<form:input id="uemail" path="email" name="email" type="text" value="${members.email}" readonly="readonly"/>
	</tr>
	<tr>
		<td style="text-align:center;">
			<form:input id="umembername" path="membername" name="membername" type="text" value="${members.membername}" readonly="readonly" />
	</tr>
	<tr>
	
	
	<td><span class="radio">請選擇性別:&emsp;&emsp; 
	<label><form:radiobutton path="gender" name="gender" value="男" /> 男 </label>
	<label><form:radiobutton path="gender" value="女" /> 女 </label> 
	<label><form:radiobutton path="gender" value="保密" checked="true"/> 保密 </label> </span>
	</tr>
	<td ><form:input path="memberMultipartFile" name="memberMultipartFile" type='file'/>
	
	<td rowspan="2">
	<form:input path="adress" id="adress" name="adress" value="${members.adress}" style="height:1px; visibility:hidden" />
	<span style="float:left;">&emsp;&emsp;請選擇居住地:&emsp;</span>
			<span style="float:left;"></span><select id="adresscity" style="float:left;"> 
				   <option>--請選擇縣市--</option> 
				  </select> 
				   
			  <span></span><select id="adressarea"  style="float:left;"> 
			    <option>--請選擇地區鄉政--</option></select><br>
			  <span id="adress" style="height:1px; visibility:hidden" ><br></span></td>
    
  	<tr>
	
	
   <td><span style="float:left;">&emsp;&emsp;年齡層:&emsp;</span><form:select path="age" name="age" value="${members.age}" > 
	<option value="1">--請選擇--</option> <option value="2">10歲以下</option> <option value="3">10歲至20歲</option > <option value="4">20歲至30歲</option> <option value="5">30歲至40歲</option>
	<option value="6">40歲至50歲</option><option value="7">50歲至60歲</option> <option value="8">60歲至70歲</option> <option value="9">70歲以上 </option> </form:select>
	</td></tr>
	<tr><td colspan="2"><div id="btnArea" align="center">
	 	<input class="primary-btn" style="border-radius: 12px;width: 500px" type="submit" name="submit" value="儲存"/>
 		<form:input id="memberpwd" path="memberpwd" name="memberpwd" type="password" value="${members.memberpwd}" style="height:1px;width:1px; visibility:hidden" readonly="readonly" />
 		<form:input path="id" name="id" type="password" value="${members.id}" style="height:1px;width:1px; visibility:hidden" readonly="readonly" /></div></tr>
	</table>
	</form:form>

	<div style="width:300px; height:450px; float: right; margin-right: 50px">
		<table style="width:300px"><tr><th style="text-align:center;">
			<span id="minespan">
			<button id="changepasswordtest" onclick='passwordcheckclick()' class="primary-btn" style="border-radius: 12px;width: 200px; background-color: darkslategray">修改密碼</button></span></th></tr>
		<tr>
			<td style="background-color: white;text-align:center;">電子郵件:&emsp;${members.email}</td>
		</tr>
		<tr>
			<td style="background-color: white;text-align:center;">姓名:&emsp;${members.membername}</td>
		</tr>
		<tr>
			<td style="background-color: white;text-align:center;">性別:&emsp;${members.gender}</td>
		<tr>
		<td style="background-color: white;text-align:center;">年齡層:&emsp;${members.age}</td>
		</tr>
		<tr>
			<td style="background-color: white;text-align:center;">居住地:&emsp;${members.adress}</td>
		</tr>
		</table>
	</div>
	</div>
	<BR />
	
	<!-- Start insurence-one Area -->
	<section class="insurence-one-area section-gap"></section>
	<!-- End insurence-one Area -->


	
	<c:import url="/WEB-INF/jsp/commons/footer.jsp" />

	

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
</body>
</html>
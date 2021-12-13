<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<style type="text/css">
.gray { 
    -webkit-filter: grayscale(100%);
    -moz-filter: grayscale(100%);
    -ms-filter: grayscale(100%);
    -o-filter: grayscale(100%);
    
    filter: grayscale(100%);
	
    filter: gray;
}
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
	background-color: #f8b600;
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
.lalaland{
    text-align: center;
    position: absolute;
    width: 100%;
    left: 50%;
    top: 50%;
   	transform: translate(-50%, 5%);
} 
.rowword {
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}

</style>
<meta charset="UTF-8">
<title>熱門景點</title>
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
<!-- Site Title -->
<title>熱門景點</title>
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
load()
});

function load(){
	if(($('#frame1').val()) == 1){$('#framepic1').removeClass('gray')};
	if(($('#frame2').val()) == 1){$('#framepic2').removeClass('gray')};
	if(($('#frame3').val()) == 1){$('#framepic3').removeClass('gray')};
	if(($('#frame4').val()) == 1){$('#framepic4').removeClass('gray')};
	if(($('#frame5').val()) == 1){$('#framepic5').removeClass('gray')};
	if(($('#frame6').val()) == 1){$('#framepic6').removeClass('gray')};
	if(($('#frame7').val()) == 1){$('#framepic7').removeClass('gray')};
	if(($('#frame8').val()) == 1){$('#framepic8').removeClass('gray')};
	if(($('#frame9').val()) == 1){$('#framepic9').removeClass('gray')};
	if(($('#frame10').val()) == 1){$('#framepic10').removeClass('gray')};
	if(($('#frame11').val()) == 1){$('#framepic11').removeClass('gray')};
	if(($('#frame12').val()) == 1){$('#framepic12').removeClass('gray')};
}
// window.location.href="/framePage";

function framepage1(){
	console.log($('#frame1').val())
	var frame1 = $('#frame1').val();
	var change = 1;
	var liked ;
	if(frame1 == 0 || frame1 == null){
		$('#frame1').val(1);
		liked = 1;
		$('#framepic1').removeClass('gray');
	}else{
		$('#frame1').val(0);
		liked = 0;
		$('#framepic1').addClass('gray');
	}
	console.log($('#frame1').val())
	var frame1 = $('#frame1').val();
	var frame2= $('#frame2').val();
	var frame3= $('#frame3').val();
	var frame4= $('#frame4').val();
	var frame5= $('#frame5').val();
	var frame6= $('#frame6').val();
	var frame7= $('#frame7').val();
	var frame8= $('#frame8').val();
	var frame9= $('#frame9').val();
	var frame10= $('#frame10').val();
	var frame11= $('#frame11').val();
	var frame12= $('#frame12').val();
	var userid = $('#userid').val();
	var params = {
		"frame1":frame1,
		"frame2":frame2,
		"frame3":frame3,
		"frame4":frame4,
		"frame5":frame5,
		"frame6":frame6,
		"frame7":frame7,
		"frame8":frame8,
		"frame9":frame9,
		"frame10":frame10,
		"frame11":frame11,
		"frame12":frame12,
		"userid":userid,
		"change":change,
		"liked":liked
	}
	console.log(params);
	$.ajax({
		 type:'post',
		 url:'/updateframelike',
		 dataType:'JSON',
		 contentType:'application/json',
		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   console.log("修改成功");
				   $('#frame1').val(data['frame1']);
		 }
	});	
}

function framepage2(){
	console.log($('#frame2').val())
	var frame2 = $('#frame2').val();
	var change = 2;
	var liked ;
	if(frame2 == 0 || frame2 == null){
		$('#frame2').val(1);
		liked = 1;
		$('#framepic2').removeClass('gray');
	}else{
		$('#frame2').val(0);
		liked = 0;
		$('#framepic2').addClass('gray');
	}
	console.log($('#frame2').val())
	var frame1 = $('#frame1').val();
	var frame2= $('#frame2').val();
	var frame3= $('#frame3').val();
	var frame4= $('#frame4').val();
	var frame5= $('#frame5').val();
	var frame6= $('#frame6').val();
	var frame7= $('#frame7').val();
	var frame8= $('#frame8').val();
	var frame9= $('#frame9').val();
	var frame10= $('#frame10').val();
	var frame11= $('#frame11').val();
	var frame12= $('#frame12').val();
	var userid = $('#userid').val();
	var params = {
		"frame1":frame1,
		"frame2":frame2,
		"frame3":frame3,
		"frame4":frame4,
		"frame5":frame5,
		"frame6":frame6,
		"frame7":frame7,
		"frame8":frame8,
		"frame9":frame9,
		"frame10":frame10,
		"frame11":frame11,
		"frame12":frame12,
		"userid":userid,
		"change":change,
		"liked":liked
	}
	console.log(params);
	$.ajax({
		 type:'post',
		 url:'/updateframelike',
		 dataType:'JSON',
		 contentType:'application/json',
		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   console.log("修改成功");
				   $('#frame2').val(data['frame2']);
		 }
	});	
}
function framepage3(){
	console.log($('#frame3').val())
	var frame3 = $('#frame3').val();
	var change = 3;
	var liked ;
	if(frame3 == 0 || frame3 == null){
		$('#frame3').val(1);
		liked = 1;
		$('#framepic3').removeClass('gray');
	}else{
		$('#frame3').val(0);
		liked = 0;
		$('#framepic3').addClass('gray');
	}
	console.log($('#frame3').val())
	var frame1 = $('#frame1').val();
	var frame2= $('#frame2').val();
	var frame3= $('#frame3').val();
	var frame4= $('#frame4').val();
	var frame5= $('#frame5').val();
	var frame6= $('#frame6').val();
	var frame7= $('#frame7').val();
	var frame8= $('#frame8').val();
	var frame9= $('#frame9').val();
	var frame10= $('#frame10').val();
	var frame11= $('#frame11').val();
	var frame12= $('#frame12').val();
	var userid = $('#userid').val();
	var params = {
		"frame1":frame1,
		"frame2":frame2,
		"frame3":frame3,
		"frame4":frame4,
		"frame5":frame5,
		"frame6":frame6,
		"frame7":frame7,
		"frame8":frame8,
		"frame9":frame9,
		"frame10":frame10,
		"frame11":frame11,
		"frame12":frame12,
		"userid":userid,
		"change":change,
		"liked":liked
	}
	console.log(params);
	$.ajax({
		 type:'post',
		 url:'/updateframelike',
		 dataType:'JSON',
		 contentType:'application/json',
		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   console.log("修改成功");
				   $('#frame3').val(data['frame3']);
		 }
	});	
}
function framepage4(){
	console.log($('#frame4').val())
	var frame4 = $('#frame4').val();
	var change = 4;
	var liked ;
	if(frame4 == 0 || frame4 == null){
		$('#frame4').val(1);
		liked = 1;
		$('#framepic4').removeClass('gray');
	}else{
		$('#frame4').val(0);
		liked = 0;
		$('#framepic4').addClass('gray');
	}
	console.log($('#frame4').val())
	var frame1 = $('#frame1').val();
	var frame2= $('#frame2').val();
	var frame3= $('#frame3').val();
	var frame4= $('#frame4').val();
	var frame5= $('#frame5').val();
	var frame6= $('#frame6').val();
	var frame7= $('#frame7').val();
	var frame8= $('#frame8').val();
	var frame9= $('#frame9').val();
	var frame10= $('#frame10').val();
	var frame11= $('#frame11').val();
	var frame12= $('#frame12').val();
	var userid = $('#userid').val();
	var params = {
		"frame1":frame1,
		"frame2":frame2,
		"frame3":frame3,
		"frame4":frame4,
		"frame5":frame5,
		"frame6":frame6,
		"frame7":frame7,
		"frame8":frame8,
		"frame9":frame9,
		"frame10":frame10,
		"frame11":frame11,
		"frame12":frame12,
		"userid":userid,
		"change":change,
		"liked":liked
	}
	console.log(params);
	$.ajax({
		 type:'post',
		 url:'/updateframelike',
		 dataType:'JSON',
		 contentType:'application/json',
		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   console.log("修改成功");
				   $('#frame4').val(data['frame4']);
		 }
	});	
}
function framepage5(){
	console.log($('#frame5').val())
	var frame5 = $('#frame5').val();
	var change = 5;
	var liked ;
	if(frame5 == 0 || frame5 == null){
		$('#frame5').val(1);
		liked = 1;
		$('#framepic5').removeClass('gray');
	}else{
		$('#frame5').val(0);
		liked = 0;
		$('#framepic5').addClass('gray');
	}
	console.log($('#frame5').val())
	var frame1 = $('#frame1').val();
	var frame2= $('#frame2').val();
	var frame3= $('#frame3').val();
	var frame4= $('#frame4').val();
	var frame5= $('#frame5').val();
	var frame6= $('#frame6').val();
	var frame7= $('#frame7').val();
	var frame8= $('#frame8').val();
	var frame9= $('#frame9').val();
	var frame10= $('#frame10').val();
	var frame11= $('#frame11').val();
	var frame12= $('#frame12').val();
	var userid = $('#userid').val();
	var params = {
		"frame1":frame1,
		"frame2":frame2,
		"frame3":frame3,
		"frame4":frame4,
		"frame5":frame5,
		"frame6":frame6,
		"frame7":frame7,
		"frame8":frame8,
		"frame9":frame9,
		"frame10":frame10,
		"frame11":frame11,
		"frame12":frame12,
		"userid":userid,
		"change":change,
		"liked":liked
	}
	console.log(params);
	$.ajax({
		 type:'post',
		 url:'/updateframelike',
		 dataType:'JSON',
		 contentType:'application/json',
		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   console.log("修改成功");
				   $('#frame5').val(data['frame5']);
		 }
	});	
}
function framepage6(){
	console.log($('#frame6').val())
	var frame6 = $('#frame6').val();
	var change = 6;
	var liked ;
	if(frame6 == 0 || frame6 == null){
		$('#frame6').val(1);
		liked = 1;
		$('#framepic6').removeClass('gray');
	}else{
		$('#frame6').val(0);
		liked = 0;
		$('#framepic6').addClass('gray');
	}
	console.log($('#frame6').val())
	var frame1 = $('#frame1').val();
	var frame2= $('#frame2').val();
	var frame3= $('#frame3').val();
	var frame4= $('#frame4').val();
	var frame5= $('#frame5').val();
	var frame6= $('#frame6').val();
	var frame7= $('#frame7').val();
	var frame8= $('#frame8').val();
	var frame9= $('#frame9').val();
	var frame10= $('#frame10').val();
	var frame11= $('#frame11').val();
	var frame12= $('#frame12').val();
	var userid = $('#userid').val();
	var params = {
		"frame1":frame1,
		"frame2":frame2,
		"frame3":frame3,
		"frame4":frame4,
		"frame5":frame5,
		"frame6":frame6,
		"frame7":frame7,
		"frame8":frame8,
		"frame9":frame9,
		"frame10":frame10,
		"frame11":frame11,
		"frame12":frame12,
		"userid":userid,
		"change":change,
		"liked":liked
	}
	console.log(params);
	$.ajax({
		 type:'post',
		 url:'/updateframelike',
		 dataType:'JSON',
		 contentType:'application/json',
		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   console.log("修改成功");
				   $('#frame6').val(data['frame6']);
		 }
	});	
}
function framepage7(){
	console.log($('#frame7').val())
	var frame7 = $('#frame7').val();
	var change = 7;
	var liked ;
	if(frame7 == 0 || frame7 == null){
		$('#frame7').val(1);
		liked = 1;
		$('#framepic7').removeClass('gray');
	}else{
		$('#frame7').val(0);
		liked = 0;
		$('#framepic7').addClass('gray');
	}
	console.log($('#frame7').val())
	var frame1 = $('#frame1').val();
	var frame2= $('#frame2').val();
	var frame3= $('#frame3').val();
	var frame4= $('#frame4').val();
	var frame5= $('#frame5').val();
	var frame6= $('#frame6').val();
	var frame7= $('#frame7').val();
	var frame8= $('#frame8').val();
	var frame9= $('#frame9').val();
	var frame10= $('#frame10').val();
	var frame11= $('#frame11').val();
	var frame12= $('#frame12').val();
	var userid = $('#userid').val();
	var params = {
		"frame1":frame1,
		"frame2":frame2,
		"frame3":frame3,
		"frame4":frame4,
		"frame5":frame5,
		"frame6":frame6,
		"frame7":frame7,
		"frame8":frame8,
		"frame9":frame9,
		"frame10":frame10,
		"frame11":frame11,
		"frame12":frame12,
		"userid":userid,
		"change":change,
		"liked":liked
	}
	console.log(params);
	$.ajax({
		 type:'post',
		 url:'/updateframelike',
		 dataType:'JSON',
		 contentType:'application/json',
		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   console.log("修改成功");
				   $('#frame7').val(data['frame7']);
		 }
	});	
}
function framepage8(){
	console.log($('#frame8').val())
	var frame6 = $('#frame8').val();
	var change = 8;
	var liked ;
	if(frame8 == 0 || frame8 == null){
		$('#frame8').val(1);
		liked = 1;
		$('#framepic8').removeClass('gray');
	}else{
		$('#frame8').val(0);
		liked = 0;
		$('#framepic8').addClass('gray');
	}
	console.log($('#frame8').val())
	var frame1 = $('#frame1').val();
	var frame2= $('#frame2').val();
	var frame3= $('#frame3').val();
	var frame4= $('#frame4').val();
	var frame5= $('#frame5').val();
	var frame6= $('#frame6').val();
	var frame7= $('#frame7').val();
	var frame8= $('#frame8').val();
	var frame9= $('#frame9').val();
	var frame10= $('#frame10').val();
	var frame11= $('#frame11').val();
	var frame12= $('#frame12').val();
	var userid = $('#userid').val();
	var params = {
		"frame1":frame1,
		"frame2":frame2,
		"frame3":frame3,
		"frame4":frame4,
		"frame5":frame5,
		"frame6":frame6,
		"frame7":frame7,
		"frame8":frame8,
		"frame9":frame9,
		"frame10":frame10,
		"frame11":frame11,
		"frame12":frame12,
		"userid":userid,
		"change":change,
		"liked":liked
	}
	console.log(params);
	$.ajax({
		 type:'post',
		 url:'/updateframelike',
		 dataType:'JSON',
		 contentType:'application/json',
		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   console.log("修改成功");
				   $('#frame8').val(data['frame8']);
		 }
	});	
}
function framepage9(){
	console.log($('#frame9').val())
	var frame9 = $('#frame9').val();
	var change = 9;
	var liked ;
	if(frame9 == 0 || frame9 == null){
		$('#frame9').val(1);
		liked = 1;
		$('#framepic9').removeClass('gray');
	}else{
		$('#frame9').val(0);
		liked = 0;
		$('#framepic9').addClass('gray');
	}
	console.log($('#frame9').val())
	var frame1 = $('#frame1').val();
	var frame2= $('#frame2').val();
	var frame3= $('#frame3').val();
	var frame4= $('#frame4').val();
	var frame5= $('#frame5').val();
	var frame6= $('#frame6').val();
	var frame7= $('#frame7').val();
	var frame8= $('#frame8').val();
	var frame9= $('#frame9').val();
	var frame10= $('#frame10').val();
	var frame11= $('#frame11').val();
	var frame12= $('#frame12').val();
	var userid = $('#userid').val();
	var params = {
		"frame1":frame1,
		"frame2":frame2,
		"frame3":frame3,
		"frame4":frame4,
		"frame5":frame5,
		"frame6":frame6,
		"frame7":frame7,
		"frame8":frame8,
		"frame9":frame9,
		"frame10":frame10,
		"frame11":frame11,
		"frame12":frame12,
		"userid":userid,
		"change":change,
		"liked":liked
	}
	console.log(params);
	$.ajax({
		 type:'post',
		 url:'/updateframelike',
		 dataType:'JSON',
		 contentType:'application/json',
		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   console.log("修改成功");
				   $('#frame9').val(data['frame9']);
		 }
	});	
}
function framepage10(){
	console.log($('#frame10').val())
	var frame10 = $('#frame10').val();
	var change = 10;
	var liked ;
	if(frame10 == 0 || frame10 == null){
		$('#frame10').val(1);
		liked = 1;
		$('#framepic10').removeClass('gray');
	}else{
		$('#frame10').val(0);
		liked = 0;
		$('#framepic10').addClass('gray');
	}
	console.log($('#frame10').val())
	var frame1 = $('#frame1').val();
	var frame2= $('#frame2').val();
	var frame3= $('#frame3').val();
	var frame4= $('#frame4').val();
	var frame5= $('#frame5').val();
	var frame6= $('#frame6').val();
	var frame7= $('#frame7').val();
	var frame8= $('#frame8').val();
	var frame9= $('#frame9').val();
	var frame10= $('#frame10').val();
	var frame11= $('#frame11').val();
	var frame12= $('#frame12').val();
	var userid = $('#userid').val();
	var params = {
		"frame1":frame1,
		"frame2":frame2,
		"frame3":frame3,
		"frame4":frame4,
		"frame5":frame5,
		"frame6":frame6,
		"frame7":frame7,
		"frame8":frame8,
		"frame9":frame9,
		"frame10":frame10,
		"frame11":frame11,
		"frame12":frame12,
		"userid":userid,
		"change":change,
		"liked":liked
	}
	console.log(params);
	$.ajax({
		 type:'post',
		 url:'/updateframelike',
		 dataType:'JSON',
		 contentType:'application/json',
		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   console.log("修改成功");
				   $('#frame10').val(data['frame10']);
		 }
	});	
}
function framepage11(){
	console.log($('#frame11').val())
	var frame11 = $('#frame11').val();
	var change = 11;
	var liked ;
	if(frame11 == 0 || frame11 == null){
		$('#frame11').val(1);
		liked = 1;
		$('#framepic11').removeClass('gray');
	}else{
		$('#frame11').val(0);
		liked = 0;
		$('#framepic11').addClass('gray');
	}
	console.log($('#frame11').val())
	var frame1 = $('#frame1').val();
	var frame2= $('#frame2').val();
	var frame3= $('#frame3').val();
	var frame4= $('#frame4').val();
	var frame5= $('#frame5').val();
	var frame6= $('#frame6').val();
	var frame7= $('#frame7').val();
	var frame8= $('#frame8').val();
	var frame9= $('#frame9').val();
	var frame10= $('#frame10').val();
	var frame11= $('#frame11').val();
	var frame12= $('#frame12').val();
	var userid = $('#userid').val();
	var params = {
		"frame1":frame1,
		"frame2":frame2,
		"frame3":frame3,
		"frame4":frame4,
		"frame5":frame5,
		"frame6":frame6,
		"frame7":frame7,
		"frame8":frame8,
		"frame9":frame9,
		"frame10":frame10,
		"frame11":frame11,
		"frame12":frame12,
		"userid":userid,
		"change":change,
		"liked":liked
	}
	console.log(params);
	$.ajax({
		 type:'post',
		 url:'/updateframelike',
		 dataType:'JSON',
		 contentType:'application/json',
		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   console.log("修改成功");
				   $('#frame11').val(data['frame11']);
		 }
	});	
}
function framepage12(){
	console.log($('#frame12').val())
	var frame12 = $('#frame12').val();
	var change = 12;
	var liked ;
	if(frame12 == 0 || frame12 == null){
		$('#frame12').val(1);
		liked = 1;
		$('#framepic12').removeClass('gray');
	}else{
		$('#frame12').val(0);
		liked = 0;
		$('#framepic12').addClass('gray');
	}
	console.log($('#frame12').val())
	var frame1 = $('#frame1').val();
	var frame2= $('#frame2').val();
	var frame3= $('#frame3').val();
	var frame4= $('#frame4').val();
	var frame5= $('#frame5').val();
	var frame6= $('#frame6').val();
	var frame7= $('#frame7').val();
	var frame8= $('#frame8').val();
	var frame9= $('#frame9').val();
	var frame10= $('#frame10').val();
	var frame11= $('#frame11').val();
	var frame12= $('#frame12').val();
	var userid = $('#userid').val();
	var params = {
		"frame1":frame1,
		"frame2":frame2,
		"frame3":frame3,
		"frame4":frame4,
		"frame5":frame5,
		"frame6":frame6,
		"frame7":frame7,
		"frame8":frame8,
		"frame9":frame9,
		"frame10":frame10,
		"frame11":frame11,
		"frame12":frame12,
		"userid":userid,
		"change":change,
		"liked":liked
	}
	console.log(params);
	$.ajax({
		 type:'post',
		 url:'/updateframelike',
		 dataType:'JSON',
		 contentType:'application/json',
		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   console.log("修改成功");
				   $('#frame12').val(data['frame12']);
		 }
	});	
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
					<h1 class="text-white">熱門目的地</h1>
					<p class="text-white link-nav">
						<a href="/mainpage">首頁 </a> <span class="lnr lnr-arrow-right"></span> <a
							href="/framePage"> 熱門目的地</a>
					</p>
				</div>
			</div>
		</div>

	</section>
	<!-- End banner Area -->
	<BR />
	<BR />
	<BR />
	<section class="price-area section-gap" style="padding-top: 0px;">

		<div class="container">
			<div class="row d-flex justify-content-center" style="height:70px;">
				<div class="menu-content pb-70 col-lg-8">
					<div class="title text-center">
						<p>我們都生活在一個屬於年輕人的時代，生活步調變得非常的快速</p>
						<input id="userid" type="text" value="${framebean.userid}" style='height:1px;width:1px;visibility:hidden' readonly='readonly'/>
					</div>
				</div>
			</div>
			<div>
			<div class="row">
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/travelista/images/Jiufen.jpg" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/travelista/images/greenReef.jpg"
								alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/qiandaohu .png" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				</div>
			<div class="row" style="height: 100px;">
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;新北市瑞芳區.九份&emsp;&emsp;&emsp;&emsp;&emsp;
							<img id="framepic1" src="images/viewlike/likeit.png" class="gray" alt="" onclick='framepage1()' >
							<input id="frame1" type="button" value="${framebean.frame1}" style="visibility:hidden;height:1px;width:1px"/></h4>
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;新北市石門區.老梅綠石槽&emsp;&emsp;&emsp;
							<img id="framepic2" src="images/viewlike/likeit.png" class="gray" alt="" onclick='framepage2()' >
							<input id="frame2" type="button" value="${framebean.frame2}" style="visibility:hidden;height:1px;width:1px"/></h4>
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;新北市石碇區.千島湖&emsp;&emsp;&emsp;&emsp;&emsp;
							<img id="framepic3" src="images/viewlike/likeit.png" class="gray" alt="" onclick='framepage3()' >
							<input id="frame3" type="button" value="${framebean.frame3}" style="visibility:hidden;height:1px;width:1px"/></h4>
						</div>
					</div>
				</div>
			</div>
		</div>
			<div>
			<div class="row">
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/shitiping.png" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/luseshuidao.jpg"
								alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/penghu.jpg" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				</div>
			<div class="row" style="height: 100px;">
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;花蓮縣豐濱鄉.石梯坪&emsp;&emsp;&emsp;&emsp;&emsp;
							<img id="framepic4" src="images/viewlike/likeit.png" class="gray" alt="" onclick='framepage4()' >
							<input id="frame4" type="button" value="${framebean.frame4}" style="visibility:hidden;height:1px;width:1px"/></h4>
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;臺南市安南區.綠色隧道&emsp;&emsp;&emsp;&emsp;
							<img id="framepic5" src="images/viewlike/likeit.png" class="gray" alt="" onclick='framepage5()' >
							<input id="frame5" type="button" value="${framebean.frame5}" style="visibility:hidden;height:1px;width:1px"/></h4>
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;澎湖縣七美鄉.雙心石滬&emsp;&emsp;&emsp;&emsp;
							<img id="framepic6" src="images/viewlike/likeit.png" class="gray" alt="" onclick='framepage6()' >
							<input id="frame6" type="button" value="${framebean.frame6}" style="visibility:hidden;height:1px;width:1px"/></h4>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/zixinglou.jpg"  
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/qixingtan.png"
								alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/taipingshan .jpg" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				</div>
			<div class="row" style="height: 100px;">
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;屏東縣泰武鄉.紫心樓天空之橋&emsp;
							<img id="framepic7" src="images/viewlike/likeit.png" class="gray" alt="" onclick='framepage7()' >
							<input id="frame7" type="button" value="${framebean.frame7}" style="visibility:hidden;height:1px;width:1px"/></h4>
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;花蓮縣新城鄉.七星潭&emsp;&emsp;&emsp;&emsp;&emsp;
							<img id="framepic8" src="images/viewlike/likeit.png" class="gray" alt="" onclick='framepage8()' >
							<input id="frame8" type="button" value="${framebean.frame8}" style="visibility:hidden;height:1px;width:1px"/></h4>
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;宜蘭縣大同鄉.情懷古步道&emsp;&emsp;&emsp;&emsp;
							<img id="framepic9" src="images/viewlike/likeit.png" class="gray" alt="" onclick='framepage9()' >
							<input id="frame9" type="button" value="${framebean.frame9}" style="visibility:hidden;height:1px;width:1px"/></h4>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/alishan.png" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/kadangbudao.jpg"
								alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-destination relative">
						<div class="thumb relative">
							<div class="overlay overlay-bg"></div>
							<img class="img-fluid" src="/images/viewlike/xiaohuangshan.jpg" 
							alt="" style="border-radius: 12px;height:230px;width:350px">
						</div>
					</div>
				</div>
				</div>
			<div class="row" style="height: 100px;">
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;嘉義縣東部.阿里山隙頂&emsp;&emsp;&emsp;&emsp;
							<img id="framepic10" src="images/viewlike/likeit.png" class="gray" alt="" onclick='framepage10()' >
							<input id="frame10" type="button" value="${framebean.frame10}" style="visibility:hidden;height:1px;width:1px"/></h4>
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;太魯閣國家公園.砂卡礑步道&emsp;&emsp;
							<img id="framepic11" src="images/viewlike/likeit.png" class="gray" alt="" onclick='framepage11()' >
							<input id="frame11" type="button" value="${framebean.frame11}" style="visibility:hidden;height:1px;width:1px"/></h4>
						</div>
					</div>
				</div>
				<div class="col-lg-4" >
					<div class="single-destination relative">
						<div class="lalaland" >
							<h4 style="color: #ff8507;">&emsp;&emsp;南投縣竹山鎮.小黃山&emsp;&emsp;&emsp;&emsp;&emsp;
							<img id="framepic12" src="images/viewlike/likeit.png" class="gray" alt="" onclick='framepage12()' >
							<input id="frame12" type="button" value="${framebean.frame12}" style="visibility:hidden;height:1px;width:1px"/></h4>
						</div>
					</div>
				</div>
			</div>
		</div>
		

		<!-- End popular-destination Area -->
	</section>
	<BR />

	<!-- start footer Area -->
	<footer class="footer-area section-gap">
		<div class="container">

			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>About Agency</h6>
						<p>The world has become so fast paced that people don’t want
							to stand by reading a page of information, they would much rather
							look at a presentation and understand the message. It has come to
							a point</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Navigation Links</h6>
						<div class="row">
							<div class="col">
								<ul>
									<li><a href="#">Home</a></li>
									<li><a href="#">Feature</a></li>
									<li><a href="#">Services</a></li>
									<li><a href="#">Portfolio</a></li>
								</ul>
							</div>
							<div class="col">
								<ul>
									<li><a href="#">Team</a></li>
									<li><a href="#">Pricing</a></li>
									<li><a href="#">Blog</a></li>
									<li><a href="#">Contact</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Newsletter</h6>
						<p>For business professionals caught between high OEM price
							and mediocre print and graphic output.</p>
						<div id="mc_embed_signup">
							<form target="_blank"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get" class="subscription relative">
								<div class="input-group d-flex flex-row">
									<input name="EMAIL" placeholder="Email Address"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Email Address '" required=""
										type="email">
									<button class="btn bb-btn">
										<span class="lnr lnr-location"></span>
									</button>
								</div>
								<div class="mt-10 info"></div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget mail-chimp">
						<h6 class="mb-20">InstaFeed</h6>
						<ul class="instafeed d-flex flex-wrap">
							<li><img src="/travelista/img/i1.jpg" alt=""></li>
							<li><img src="/travelista/img/i2.jpg" alt=""></li>
							<li><img src="/travelista/img/i3.jpg" alt=""></li>
							<li><img src="/travelista/img/i4.jpg" alt=""></li>
							<li><img src="/travelista/img/i5.jpg" alt=""></li>
							<li><img src="/travelista/img/i6.jpg" alt=""></li>
							<li><img src="/travelista/img/i7.jpg" alt=""></li>
							<li><img src="/travelista/img/i8.jpg" alt=""></li>
						</ul>
					</div>
				</div>
			</div>

			<div
				class="row footer-bottom d-flex justify-content-between align-items-center">
				<p class="col-lg-8 col-sm-12 footer-text m-0">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>document.write(new Date().getFullYear());</script>
					All rights reserved | This template is made with <i
						class="fa fa-heart-o" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
				<div class="col-lg-4 col-sm-12 footer-social">
					<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
						class="fa fa-twitter"></i></a> <a href="#"><i
						class="fa fa-dribbble"></i></a> <a href="#"><i
						class="fa fa-behance"></i></a>
				</div>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

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
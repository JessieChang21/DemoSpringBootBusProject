<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase Order</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<link rel="stylesheet" href="/css/ordersystem.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	var rid = $('#rid').val();
    	load(rid);
    });
    
    function load(rid){
    	$.ajax({
    	   type:'post',
 		   url:'/routes/findrouteinfobyid.controller/' + rid,
 		   dataType:'JSON',
 		   contentType:'application/json',
 		   success: function(data){
 			   
 			   console.log('success:' + data);
 			   var json = JSON.stringify(data,null,4);
 			   console.log('json:' + json);
 			   
 			   $('#showproduct').empty("");
 			   
 			  if(data==null){
 				 $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
 		      }else{
 		    	 var table = $('#showproduct');
 		    	 table.append("<tr id='ptitle'><th>StationSequence</th><th>Station Name</th><th>SequenceTime(s)</th></tr>");
 		    	
 		    	 $.each(data, function(i,n){
					   var tr = "<tr align='center'>" + "<td>" + n.stationSequence + "</td>" +
					            "<td>" + n.station + "</td>" + "<td>" + n.sequenceTime + "</td>"+"<td>" +"</tr>";
					   table.append(tr);
    			});
 		      }
    }
    	});
    }
    
    function backPage() {
		window.history.go(-1);
	}
    
</script>
</head>
<body>
<div id="productListTitle">PurchaseOrder</div>
<table id="showproduct" border="1"></table>
<input id="rid" type="hidden" value="${rid}">
<div id="feedback" align="center"></div>
<div><button id = "backPage" onclick='backPage()'>上一頁</button></div>
</body>
</html>
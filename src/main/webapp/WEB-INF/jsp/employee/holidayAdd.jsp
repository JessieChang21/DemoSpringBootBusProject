<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/memberssystem.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	getsubstitute();
	$('#timeperiod').empty("");
	var timeperiod = $('#timeperiod');
	timeperiod.append($("<option value='AM'>早上</option>"));
	timeperiod.append($("<option value='PM'>下午</option>"));	
});
function getsubstitute(){
	$.ajax({
		   type:'Post',
		   url:'/GetHoliday/getsubstituteid',
		   dataType:'JSON',
		   contentType:'application/json',
		   success: function(data){
			   console.log('success:' + data);
			   var json = JSON.stringify(data,null,4);
			   console.log('json:' + json);
			   var parsedObjinArray = JSON.parse(json); 
			   
			   $('#substituteid').empty("");
			   $('#substitutename').empty("");
			   var substituteid = $('#substituteid');
			   $.each(parsedObjinArray, function(i,n){
				   substituteid.append("<option value='"+n.id+"'>"+n.id +"-"+n.employeename+"</option>");
			   });
		   },error: function() {console.log("error-getJob");}
	});
}
</script>
</head>
<body>
	<form action="getholidayInsert" method ="post">
		<table border="1">
			<tr>
				<th colspan='4'><h3>員工請假</h3></th>
			</tr>
			<tr>
				<td><label>請假人員ID</label></td>
				<td><label id='employeeid' name='employeeid'>${empId}</label></td>
				<td><label>請假人員姓名</label></td>
				<td><label id='employeename' name='employeename'>${empName}</label></td>
			</tr>
			<tr>
				<td><label>剩餘假期時數</label></td>
				<td colspan='3'><label id='LaveHours' name='LaveHours'>${LaveHours} 小時(天*8時)</label></td>
			</tr>
			<tr>
				<td><label>代班人員</label></td>
				<td colspan='3'><select id="substituteid" name="substituteid"></select></td>
			</tr>
			<tr>
				<td><label>請假日期</label></td>
				<td><input id="date" name="date" type="date" value=''></td>
				<td><label>請假時段</label></td>
				<td><select id="timeperiod" name="timeperiod"></select></td>
			</tr>
			<tr>
				<td colspan='4'><button type="submit" value="GetHolidayInsert">確認送出</button></td>
			</tr>
		</table>
		<div align="center"><button><a href="<c:url value='/GetHoliday/getholidayindex'/> " >回前頁</a></button></div>
	</form>
</body>
</html>
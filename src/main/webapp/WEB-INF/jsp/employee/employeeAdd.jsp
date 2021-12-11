<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/ordersystem.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
var indexPage = 1;
	$(document).ready(function() {		
		$('#gender').empty("");
		var gender = $('#gender');
		gender.append($("<option value='M' selected='selected'>男性</option>"));
		gender.append($("<option value='F'>女性</option>"));		
		getJob();
		getRank();
	});
	function getJob(){
		$.ajax({
			   type:'Post',
			   url:'/employee/getJob',
			   dataType:'JSON',
			   contentType:'application/json',
			   success: function(data){
				   console.log('success:' + data);
				   var json = JSON.stringify(data,null,4);
				   console.log('json:' + json);
				   var parsedObjinArray = JSON.parse(json); 
				   $('#jobid').empty("");
				   var jobid = $('#jobid');
				   $.each(parsedObjinArray, function(i,n){
					   jobid.append("<option value='"+n.jobid+"'>"+n.jobname+"</option>");
				   });
			   },error: function() {console.log("error-getJob");}
		});
	}
	
	function getRank(){
		$.ajax({
			   type:'Post',
			   url:'/employee/getRank',
			   dataType:'JSON',
			   contentType:'application/json',
			   success: function(data){
				   console.log('success:' + data);
				   var json = JSON.stringify(data,null,4);
				   console.log('json:' + json);
				   var parsedObjinArray = JSON.parse(json); 
				   $('#rankid').empty("");
				   var jobid = $('#rankid');
				   $.each(parsedObjinArray, function(i,n){
					   jobid.append("<option value='"+n.rankid+"'>"+n.rankname+"</option>");
				   });
			   },error: function() {console.log("error-getJob");}
		});
	}
	
	function addemployee(){
    	var ID = $('#id').val();
    	var EmployeeName = $('#employeename').val();
    	var groupID = $('#groupID').val();
    	var gender = $('#gender').val();
    	var jobid = $('#jobid').val();
    	var rankid = $('#rankid').val();
    	//var amount = parseInt(orderQuantity)*parseInt(price);
    	
    	if($.trim(employeename)==''){
    		alert('employeename is empty');
    		return;
    	}
    	if($.trim(groupid)==''){
    		alert('groupid is empty');
    		return;
    	}
    	if($.trim(gender)==''){
    		alert('gender is empty');
    		return;
    	}
    	if($.trim(jobid)==''){
    		alert('jobid is empty');
    		return;
    	}
    	if($.trim(rankid)==''){
    		alert('rankid is empty');
    		return;
    	}
    	
    	
    	
    	var params = {
    	    "id":id,
    		"employeename":employeename,
    		"groupid":groupid,
    		"gender":gender,
    		"jobid":jobid,
    		"rankid":rankid
        }
    	
    	$.ajax({
    	   type:'post',
    	   url:'employeeinsert.controller',
    	   dataType:'JSON',
    	   contentType:'application/json',
    	   data:JSON.stringify(params),
    	   success: function(data){
    		   console.log(data);
    		   $('#feedback').html("新增成功");
    		   $(this).dialog("新增成功");
    	   }
    	});
    }
</script>
</head>
<body>
	<h3>員工資料</h3>
	<form action="employeeInsert2" method ="post">
		<table border="1">
			<tr style='display:none'>
				<td><label>員工編號</label></td>
				<td><input id='id' name="id" type='text'/></td>
			</tr>
			<tr>
				<td><label>員工姓名</label></td>
				<td><input id='employeename' name="employeename" type='text'/></td>
			</tr>
			<tr style='display:none'>
				<td><label>群組</label></td>
				<td><select id="groupid" name="groupid"></select></td>
			</tr>
			<tr>
				<td><label>性別</label></td>
				<td><select id="gender" name="gender"></select></td>
			</tr>
			<tr>
				<td><label>職稱</label></td>
				<td><select id="jobid" name="jobid"></select></td>
			</tr>
			<tr>
				<td><label>職等</label></td>
				<td><select id="rankid" name="rankid"></select></td>
			</tr>
			<tr>
				<td><button type="submit" value="employeeadd">確認送出</button></td>
				<td><button><a href="<c:url value='/employee/employeemain.controller'/> " >回前頁</a></button></td>
			</tr>
		</table>
	</form>
</body>
</html>
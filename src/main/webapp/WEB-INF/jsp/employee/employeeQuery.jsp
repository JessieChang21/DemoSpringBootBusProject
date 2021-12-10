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
		var gender_h = $('#gender_h').val();
		var jobid_h = $('#jobid_h').val();
		var rankid_h = $('#rankid_h').val();
		getgender(gender_h);
		getJob(jobid_h);
		getRank(rankid_h);
	});
	function getgender(gender_h) {
		$('#gender').empty("");
		var gender = $('#gender');
		if (gender_h == "M") {
			gender.append($("<option value='M' selected='selected'>男性</option>"));
			gender.append($("<option value='F'>女性</option>"));
		} else {
			gender.append($("<option value='M'>男性</option>"));
			gender.append($("<option value='F' selected='selected'>女性</option>"));
		}
	}
	function getJob(jobid_h){
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
					   if(jobid_h == n.jobid){
						   jobid.append("<option value='"+n.jobid+"' selected='selected'>"+n.jobname+"</option>");
					   }else{
						   jobid.append("<option value='"+n.jobid+"'>"+n.jobname+"</option>"); 
					   }
				   });
			   },error: function() {console.log("error-getJob");}
		});
	}
	function getRank(rankid_h){
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
					   if(rankid_h == n.rankid){
						   jobid.append("<option value='"+n.rankid+"' selected='selected'>"+n.rankname+"</option>");
					   }else{
						   jobid.append("<option value='"+n.rankid+"'>"+n.rankname+"</option>");
					   }
				   });
			   },error: function() {console.log("error-getJob");}
		});
	}
	function updateemployee(){
    	var id = $('#id_h').val();
    	var employeename = $('#employeename').val();
    	var password = $('#password_h').val();
    	var groupid = $('#groupid').val();
    	var gender = $('#gender').val();
    	var jobid = $('#jobid').val();
    	var rankid = $('#rankid').val();
    	var enterdate = $('#enterdate').val();
    	var seniority = $('#seniority').val();
    	console.log(id +","+ employeename +","+ groupid +","+ gender +","+ jobid +","+ rankid +","+ enterdate +","+ seniority);
    	
    	if($.trim(employeename)==''){
    		alert('employeename is empty');
    		return;
    	}
    	var params = {
    	    "id":id,
    		"employeename":employeename,
    		"password":password,
    		"groupid":groupid,
    		"gender":gender,
    		"jobid":jobid,
    		"rankid":rankid,
    		"enterdate":enterdate,
    		"seniority":seniority
        }
    	
    	$.ajax({
    	   type:'post',
    	   url:'employeeUpdate',
    	   dataType:'JSON',
    	   contentType:'application/json',
    	   data:JSON.stringify(params),
    	   success: function(data){
    		   console.log(data);
    		   $('#feedback').html("修改成功");
    	   }
    	});
    }
	
	function deleteemployee(){
    	var id = $('#id_h').val();
    	var employeename = $('#employeename').val();
    	var password = $('#password_h').val();
    	var groupid = $('#groupid').val();
    	var gender = $('#gender').val();
    	var jobid = $('#jobid').val();
    	var rankid = $('#rankid').val();
    	var enterdate = $('#enterdate').val();
    	var seniority = $('#seniority').val();
    	console.log(id +","+ employeename +","+ groupid +","+ gender +","+ jobid +","+ rankid +","+ enterdate +","+ seniority);
    	
    	if($.trim(employeename)==''){
    		alert('employeename is empty');
    		return;
    	}
    	var params = {
    	    "id":id,
    		"employeename":employeename,
    		"password":password,
    		"groupid":groupid,
    		"gender":gender,
    		"jobid":jobid,
    		"rankid":rankid,
    		"enterdate":enterdate,
    		"seniority":seniority
        }
    	
    	$.ajax({
    	   type:'post',
    	   url:'employeeDelete',
    	   dataType:'JSON',
    	   contentType:'application/json',
    	   data:JSON.stringify(params),
    	   success: function(data){
    		   console.log(data);
    		   $('#feedback').html("刪除成功");
    	   }
    	});
    }
</script>
</head>
<body>
	<form action="employeeQuery" method="post">
		<table border="1">
			<tr>
				<td colspan='2'><h3>員工基本資料</h3></td>
			</tr>
			<tr>
				<td><label>員工編號</label></td>
				<td>${pid}</td>
			</tr>
			<tr>
				<td><label>員工姓名</label></td>
				<td><input id='employeename' name='employeename' type='text'
					value='${employeename}' /></td>
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
				<td colspan='2'>
					<button id='update' type='button' onclick="updateemployee()">update</button>
					<button id='delete' type='button' onclick="deleteemployee()">delete</button>
					<button><a href="<c:url value='/employee/employeemain.controller'/> " >回前頁</a></button>
				</td>
			</tr>
		</table>
		<input id="id_h" type="hidden" value="${pid}">
		<input id="password_h" type="hidden" value="${password}">
		<input id="gender_h" type="hidden" value="${gender}">
		<input id="jobid_h" type="hidden" value="${jobid}">
		<input id="rankid_h" type="hidden" value="${rankid}">
		<input id="groupid_h" type="hidden" value="${groupid}">
		<input id="enterdate_h" type="hidden" value="${enterdate}">
		<input id="seniority_h" type="hidden" value="${seniority}">
		<div id="feedback" align="center"></div>
	</form>
</body>
</html>
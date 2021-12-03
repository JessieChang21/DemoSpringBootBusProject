<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
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
	$(document).ready(function() {
		load();
	});
	function load(pid) {
		$
				.ajax({
					type : 'post',
					url : '/employee/insert',
					dataType : 'JSON',
					contentType : 'application/json',
					success : function(data) {
						console.log('success:' + data);
						var json = JSON.stringify(data, null, 4);
						console.log('json:' + json);

						$('#showemployee').empty("");
						var table = $('#showproduct');
						var tr = "<tr align='center'>"
								+ "<td><input id='ID' type='text'/></td>"
								+ "<td><input id='EmployeeName' type='text'/></td>"
								+ "<td><input id='groupID' type='text'/></td>"
								+ "<td><input id='gender' type='text'/></td>"
								+ "<td><input id='JobID' type='text'/></td>"
								+ "<td><input id='RankID' type='text'/></td>"
								+ "<td><button id='addemploye' type='button' value='addemploye' onclick='addemployee()'>�T�{�s�W</button></td>"
								+ "</tr>";
						table.append(tr);
					}
				});
	}
	
	function addemployee(){
    	var ID = $('#ID').val();
    	var EmployeeName = $('#EmployeeName').val();
    	var groupID = $('#groupID').val();
    	var gender = $('#gender').val();
    	var JobID = $('#JobID').val();
    	var RankID = $('#RankID').val();
    	//var amount = parseInt(orderQuantity)*parseInt(price);
    	
    	if($.trim(EmployeeName)==''){
    		alert('EmployeeName is empty');
    		return;
    	}
    	if($.trim(groupID)==''){
    		alert('groupID is empty');
    		return;
    	}
    	if($.trim(gender)==''){
    		alert('gender is empty');
    		return;
    	}
    	if($.trim(JobID)==''){
    		alert('JobID is empty');
    		return;
    	}
    	if($.trim(RankID)==''){
    		alert('RankID is empty');
    		return;
    	}
    	
    	
    	
    	var params = {
    	    "ID":ID,
    		"EmployeeName":EmployeeName,
    		"groupID":groupID,
    		"gender":gender,
    		"JobID":JobID,
    		"RankID":RankID
        }
    	
    	$.ajax({
    	   type:'post',
    	   url:'employeeinsert.controller',
    	   dataType:'JSON',
    	   contentType:'application/json',
    	   data:JSON.stringify(params),
    	   success: function(data){
    		   console.log(data);
    		   $('#feedback').html("�s�W���\");
    	   }
    	});
    }
</script>
</head>
<body>
	<h3>���u���</h3>
	<form action="employeeUpdate" method ="post">
		<table>
			<tr>
				<td><label>���u�s��</label></td>
				<td>${employee.ID}</td>
			</tr>
			<tr>
				<td><label>���u�m�W</label></td>
				<td>${employee.EmployeeName}</td>
			</tr>
			<tr>
				<td><label>�s��</label></td>
				<td>${employee.groupID}</td>
			</tr>
			<tr>
				<td><label>�ʧO</label></td>
				<td>${employee.gender}</td>
			</tr>
			<tr>
				<td><label>¾��</label></td>
				<td>${employee.JobID}</td>
			</tr>
			<tr>
				<td><label>¾��</label></td>
				<td>${employee.RankID}</td>
			</tr>
			<tr>
				<td><button type="submit" value="employeedelete">�T�{�e�X</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
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
								+ "<td><button id='addemploye' type='button' value='addemploye' onclick='addemployee()'>確認新增</button></td>"
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
    		   $('#feedback').html("新增成功");
    	   }
    	});
    }
</script>
</head>
<body>
	<h3>員工資料</h3>
	<form action="employeeInsert" method ="post">
		<table>
			<tr>
				<td><label>員工編號</label></td>
				<td><input id='ID' type='text'/></td>
			</tr>
			<tr>
				<td><label>員工姓名</label></td>
				<td><input id='EmployeeName' type='text'/></td>
			</tr>
			<tr>
				<td><label>群組</label></td>
				<td><select id="groupID" name="groupIDStation"></select></td>
			</tr>
			<tr>
				<td><label>性別</label></td>
				<td><select id="gender" name="genderStation"></select></td>
			</tr>
			<tr>
				<td><label>職稱</label></td>
				<td><select id="JobID" name="JobIDStation"></select></td>
			</tr>
			<tr>
				<td><label>職等</label></td>
				<td><select id="RankID" name="RankIDStation"></select></td>
			</tr>
			<tr>
				<td><button type="submit" value="employeeadd">確認送出</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
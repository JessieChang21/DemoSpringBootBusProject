<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#gender').empty("");
	$("#gender").append($('<option value="">�п��</option>'));
	$("#gender").append($('<option value="M">�k��</option>')).attr('selected', true);
	$("#gender").append($('<option value="F">�k��</option>'));
});
</script>
</head>
<body>
	<h3>���u�򥻸��</h3>
	<input id="pid" value="${pid}">
	<form action="employeeDelete" method ="post">
		<table>
			<tr>
				<td><label>���u�s��</label></td>
				<td>${pid}</td>
			</tr>
			<tr>
				<td><label>���u�m�W</label></td>
				<td><input id='employeename' type='text' value='${employeename}'/></td>
			</tr>
			<tr>
				<td><label>�s��</label></td>
				<td><select id="groupID" name="groupIDStation"></select></td>
			</tr>
			<tr>
				<td><label>�ʧO</label></td>
				<td><select id="gender" name="genderStation"></select></td>
			</tr>
			<tr>
				<td><label>¾��</label></td>
				<td><select id="JobID" name="JobIDStation"></select></td>
			</tr>
			<tr>
				<td><label>¾��</label></td>
				<td><select id="RankID" name="RankIDStation"></select></td>
			</tr>
			<tr>
				<td><button type="submit" value="employeeadd">�T�{�e�X</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
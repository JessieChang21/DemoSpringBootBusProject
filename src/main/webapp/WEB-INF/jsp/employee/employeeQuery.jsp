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
	$("#gender").append($('<option value="">請選擇</option>'));
	$("#gender").append($('<option value="M">男性</option>')).attr('selected', true);
	$("#gender").append($('<option value="F">女性</option>'));
});
</script>
</head>
<body>
	<h3>員工基本資料</h3>
	<input id="pid" value="${pid}">
	<form action="employeeDelete" method ="post">
		<table>
			<tr>
				<td><label>員工編號</label></td>
				<td>${pid}</td>
			</tr>
			<tr>
				<td><label>員工姓名</label></td>
				<td><input id='employeename' type='text' value='${employeename}'/></td>
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
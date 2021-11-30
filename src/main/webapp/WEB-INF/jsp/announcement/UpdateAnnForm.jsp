<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// function updateAnn() {
	//     var hiddenField = document.getElementById("updateOrDelete");
	// //     hiddenField.value='PUT';
	//     document.forms[0].method="POST";
	// 	document.forms[0].submit();
	// }
</script>
<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}

.fieldset-auto-width {
	display: inline-block;
}
</style>
<script type="text/javascript">
</script>
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
 </script>
</head>


<body>
	<div align="center">
		<form:form action="updateAnnouncement" method='POST'
			modelAttribute="announcement" enctype="multipart/form-data">
			<c:if test='${announcement.id != null}'>
				<form:hidden path="id" />
				<br>&nbsp;
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend>公告資料</legend>
				<table>
					<tr>
						<td align='right'>主旨：<br>&nbsp;
						</td>
						<td><form:input path="antitle" style="width: 400px" /><br>&nbsp;
							<form:errors path="antitle" cssClass="error" /></td>
					</tr>
					<tr>
						<td align='right'>類別：<br>&nbsp;
						</td>
						<td><form:select path="ancategory">
								<option value="活動公告">活動公告</option>
								<option value="營運公告">營運公告</option>
							</form:select><br>&nbsp;</td>
					</tr>
					<tr>
						<td align='right'>內容：<br>&nbsp;
						</td>
						<td><form:textarea path="ancontent"
								style="width: 400px; height:200px" /><br>&nbsp; <form:errors
								path="ancontent" cssClass="error" /></td>
					</tr>
					<tr>
						<td width='150' align='center'><p>
								圖片:<input type="file" name="animages2" id="animages2" />
							<img id="output1" height="50" style="display: none"><BR/>
							</p></td>
					</tr>
					<tr>
						<td colspan='2' align='center'><input value="確定修改" type="submit">
					</tr>
					<td><a href="<c:url value='/showAnnouncement1'/>">上一頁</a></td>
				</table>
			</fieldset>
		</form:form>
	</div>
</body>
</html>
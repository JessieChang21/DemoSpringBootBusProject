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
function confirmDelete(id) {
	if (confirm("確定刪除(編號:${announcement.id})的公告?") ) {
		document.forms[0].action="<c:url value='/deleteAnnouncement/{id}'  />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
	}
}
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
</head>


<body>
	<div align="center">
		<form:form method='POST' modelAttribute="announcement" >
			<input type="hidden" name="noname"  id='putOrDelete'   value="" >
    		<c:if test='${announcement.id != null}'>
               <form:hidden path="id" /><br>&nbsp;
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend>公告資料</legend>
				<table>
				   <tr>
						<td align='right'>主旨：<br>&nbsp;</td>
						<td><form:input path="antitle"   /><br>&nbsp;
							<form:errors path="antitle" cssClass="error" />
						</td>
					</tr>
					<tr>
						<td align='right'>類別：<br>&nbsp;
						</td>
						<td><form:input path="ancategory" /><br>&nbsp;
						    <form:errors path="ancategory" cssClass="error" />
						</td>
						
					</tr>
					<tr>
						<td align='right'>內容：<br>&nbsp;
						</td>
						<td><form:input path="ancontent" /><br>&nbsp;
						    <form:errors path="ancontent" cssClass="error" />
						</td>
					</tr>
					
					<tr>
						<td colspan='2' align='center'>
						<input type="button" name="update" value="刪除" onclick='confirmDelete(id)'/>
					</tr>
					<td>
					<a href="<c:url value='/showAnnouncement1'/>">上一頁</a></td>
				</table>
			</fieldset>
		</form:form>
	</div>
</body>
</html>
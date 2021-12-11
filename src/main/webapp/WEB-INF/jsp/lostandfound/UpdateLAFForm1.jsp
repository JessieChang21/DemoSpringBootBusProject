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
function updatelaf() {
    var hiddenField = document.getElementById("updateOrDelete");
//     hiddenField.value='PUT';
    document.forms[0].method="POST";
	document.forms[0].submit();
}
function confirmDelete(id) {
	if (confirm("確定刪除(編號:${lostAndFound.id})的物品?") ) {
		document.forms[0].action="<c:url value='/deletelostandfound/{id}'  />" ;
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
		<form:form method='POST' modelAttribute="lostAndFound" >
			<input type="hidden" name="noname"  id='putOrDelete'   value="" >
    		<c:if test='${lostAndFound.id != null}'>
               <form:hidden path="id" /><br>&nbsp;
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend>失物招領</legend>
				<table>
				   <tr>
						<td align='right'>物品名稱：<br>&nbsp;
						</td>
						<td><form:input path="itname" /><br>&nbsp; <form:errors
								path="itname" cssClass="error" /></td>
					</tr>
					<tr>
						<td align='right'>地點：<br>&nbsp;
						</td>
						<td><form:input path="itplace" textarea="300" /><br>&nbsp;
							<form:errors path="itplace" cssClass="error" /></td>

					</tr>
					<tr>
						<td align='right'>巴士編號：<br>&nbsp;
						</td>
						<td><form:input path="itbussnumber" textarea="300" /><br>&nbsp;
							<form:errors path="itbussnumber" cssClass="error" /></td>
					</tr>
					<tr>
						<td align='right'>拾獲日期：<br>&nbsp;
						</td>
						<td><form:input path="itdate" /><br>&nbsp; <form:errors
								path="itdate" cssClass="error" /></td>
					</tr>
					
					<tr>
						<td colspan='2' align='center'>
						<input type="button" name="update" value="修改" onclick='updatelaf()'/></td>
						<td colspan='2' align='center'><input type="button"
							name="update" value="刪除" onclick='confirmDelete(id)' />
					</tr>
					<tr>
					<td>
					<a href="<c:url value='/showlostandfound'/>">上一頁</a></td></tr>
				</table>
			</fieldset>
		</form:form>
	</div>
</body>
</html>
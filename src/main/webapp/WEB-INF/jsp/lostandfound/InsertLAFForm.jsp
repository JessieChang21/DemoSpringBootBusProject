<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<form:form method='POST' modelAttribute="lostAndFound">

			<c:if test='${lostAndFound.id != null}'>
				<form:hidden path="id" />
				<br>&nbsp;
			</c:if>
			<fieldset class="fieldset-auto-width">
				<legend>遺失物</legend>
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
						<td>
							<form:input path="itbussnumber" textarea="300" /><br>&nbsp;
							<form:errors path="itbussnumber" cssClass="error" />
						</td>
					</tr>
					<tr>
						<td align='right'>拾獲日期：<br>&nbsp;
						</td>
						<td><form:input path="itdate" /><br>&nbsp; <form:errors
								path="itdate" cssClass="error" /></td>
					</tr>

					<tr>
						<td colspan='2' align='center'><input type='submit'
							value='提交'></td>
					</tr>
					<tr>
					<td colspan='2' align='center'>
						<td colspan='2' align='center'><a href="<c:url value='/' />">回首頁</a></td>
					</tr>
				</table>
			</fieldset>
		</form:form>
	</div>

</body>
</html>
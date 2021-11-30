<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
  
 </script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mytext { 
    width: 500px; 
    font-size:15pt; 
    padding:5px;
} 
table {
	border-collapse: collapse;
	background-color: #FFE384;
	 width: 600px;
            height: 700px;   
}
tr {
	border: 1px solid black;
}
span.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}

p{
font-size:15pt; 
}

</style>
</head>
<body>
	<div align="center">
		<form:form method='POST' modelAttribute="announcement" enctype="multipart/form-data">

			<c:if test='${announcement1.id != null}'>
				<form:hidden path="id" />
				<br>&nbsp;
			</c:if>
			<!-- 			<fieldset class="fieldset-auto-width"> -->

			<table border='1'>
				<tr>
					<td>
						<h1 align='center'>公告資料</h1>
					</td>
				</tr>
				<tr>
					<td width='100%'>
						<p>
							主旨：
							<form:input path="antitle" class="mytext"/>
							<form:errors path="antitle" cssClass="error" />
						</p>
					</td>
				</tr>
				<tr>
					<td width='100%'>
						<p>
							內容：<BR/>
							<form:textarea path="ancontent" style="width: 600px; height:350px" class="mytext"/>
							<form:errors path="ancontent" cssClass="error" />
						</p>
					</td>
				</tr>
				<tr>
					<td width='100%'>
						<p>
							類別：
							<form:select style="font-size:20px" path="ancategory">
								<option value="營運公告">營運公告</option>
								<option value="活動公告">異動公告</option>
								<option value="活動公告">活動公告</option>
							</form:select>
						</p>
					</td>
				</tr>
				<tr>
					<td width='100%'>
						<p>
							圖片：
							<input type="file" name="animages1" id="animages1" onchange="openFile1(event)"/>
							<img id="output1" height="50" style="display: none"><BR/>
							
						</p>
					</td>
				</tr>
				<tr>
					<td width='100%' colspan='2' align='center'>
						<p>
							<input type='submit' style="font-size:20px"  value='提交'>
						</p>
					</td>
				</tr>
				<tr>

					<td colspan='4' align='center'>
						<p>
							<a href="<c:url value='/' />">回首頁</a>
						</p>
					</td>
				</tr>
			</table>
			<!-- 			</fieldset> -->
		</form:form>
	</div>

</body>
</html>
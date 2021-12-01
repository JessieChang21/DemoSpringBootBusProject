<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Members Register</title>
<link rel="stylesheet" href="/css/memberssystem.css">
</head>
<body>
<div style = float:right>
	<div id="membersListTitle">快速註冊</div>
	<form method="POST" action="/register/insert">
	<div>
		<label for="email" data-lang="輸入帳號">登入帳號</label>
		<div >
			<input id="email" path='email' name="email" placeholder="請輸入電子信箱" type="text" value="" />
<!-- 			<form:errors path="email" cssClass="error" /> -->
		</div>    
	</div>
	<div>
		<label for="memberpwd" data-lang="輸入密碼(至少8碼)">登入密碼(至少8碼)</label>
		<div>
			<input id="memberpwd" path='memberpwd' name="memberpwd" placeholder="請輸入密碼" type="password" value="" />
<!-- 			<form:errors path="memberpwd" cssClass="error" /> -->
		</div>
	</div>
	<div>
		<label for="memberpwd2" data-lang="再次輸入密碼">再次輸入密碼</label>
		<div>
			<input id="memberpwd2" path='memberpwd2' name="memberpwd2" placeholder="請再次輸入密碼" type="password" value="" /><br>
		</div><br>
<!-- 		<div> -->
<!-- 			<form:errors path="memberpwd2" cssClass="error" /> -->
<!-- 		</div> -->
	</div>
	<div>
		<label for="membername" data-lang="輸入姓名">姓名</label>
		<div>
			<input id="membername" path='membername' name="membername" placeholder="請輸入姓名" type="text" value="" />
<!-- 			<form:errors path="membername" cssClass="error" /> -->
		</div>
	</div>
	<div>
		<input data-val="true" data-val-required="isAgree 欄位是必要項。" id="agree" name="isAgree" style="width: 18px; height: 18px;" type="checkbox" value="true" /><input name="QM.isAgree" type="hidden" value="false" />
		<label for="agree" data-lang="我同意">我同意</label><a href="#.pdf" target="_blank">XXX隱私權政策與服務條款</a>
	</div>
	<div id="btnArea" align="center">
 	 	<input type="submit" name="submit" id="submit" value="儲存"/>
  		<input type="reset" name="cancel" id="cancel" value="重填">
	</div>
	<div id="feedback" align="center"></div>
	<br><br>
	<div align="center">
		<a href="/" class="btn btn-primary" > 首頁 </a>
	</div>
</form>
</div>
</body>
</html>
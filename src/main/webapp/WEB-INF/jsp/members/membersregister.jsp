<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Members Register</title>
<link rel="stylesheet" href="/css/memberssystem.css">
<style>
span.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}

.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function(){
		load();
	});
	
	function load(){
		$('#emailcheckdiv').empty("");
		var span = $('#emailcheckdiv');
		span.append("<button id='emailcheckbut' type='button' value='emailcheckbut' onclick='emailcheckclick()'>emailcheck</button>")
 		   }
	
	function emailcheckclick(){
		
		var email = $('#email').val()
		
		var params = {"email":email}
		console.log(params);
		$.ajax({
	    	   type:'POST',
	    	   url:'sendeMail',
	    	   dataType:'JSON',
	    	   contentType:'application/json',
	    	   data:JSON.stringify(params),
	    	   success: function(data){
	    		   console.log(data);
	    		   console.log(data['random']);
	    		   $('#emailcheck2').val(data['random']);
	    	   }
	    	});
		}

</script>
</head>
<body>
<div style = float:right>
	<div id="membersListTitle">快速註冊</div>
	<form:form method="POST" modelAttribute="members">
	<div>
		<label for="email" data-lang="輸入帳號">登入帳號</label>
		<div >
			<form:input id="email" path='email' name="email" placeholder="請輸入電子信箱" type="text" value="" />
			<form:errors path="email" cssClass="error" />
		</div>    
	</div>
	<div>
		<label for="memberpwd" data-lang="輸入密碼(至少8碼)">登入密碼(至少8碼)</label>
		<div>
			<form:input id="memberpwd" path='memberpwd' name="memberpwd" placeholder="請輸入密碼" type="password" value="" />
			<form:errors path="memberpwd" cssClass="error" />
		</div>
	</div>
	<div>
		<label for="memberpwd2" data-lang="再次輸入密碼">再次輸入密碼</label>
		<div>
			<form:input id="memberpwd2" path='memberpwd2' name="memberpwd2" placeholder="請再次輸入密碼" type="password" value="" /><br>
		</div><br>
		<div>
			<form:errors path="memberpwd2" cssClass="error" />
		</div>
	</div>
	<div>
		<label for="membername" data-lang="輸入姓名">姓名</label>
		<div>
			<form:input path='membername' placeholder="請輸入姓名" type="text" value="" />
			<form:errors path="membername" cssClass="error" />
		</div>
	</div>
	<div>
		<form:checkbox path='agreecheckbox' id="agree" name="isAgree" style="width: 18px; height: 18px;" value="true" />
<!-- 		<input name="QM.isAgree" type="hidden" value="false" /> -->
		<label for="agree" data-lang="我同意">我同意</label><a href="#.pdf" target="_blank">XXX隱私權政策與服務條款</a>
		<form:errors path="agreecheckbox" cssClass="error" />
	</div>
	<div>
		<form:input id='emailcheck' path='emailcheck' type="text" value="" placeholder="請輸入驗證碼"/>
		<span id="emailcheckdiv"></span>
		<form:errors path="emailcheck" cssClass="error" /><br>
		<form:input id='emailcheck2' path='emailcheck2' type="text" value="" style="visibility:hidden"/>
	</div>
<!-- 	<div id="emailcheckdiv"></div> -->
	<div id="btnArea" align="center">
 	 	<input type="submit" name="submit" id="submit" value="儲存"/>
  		<input type="reset" name="cancel" id="cancel" value="重填">
	</div>
	<div id="feedback" align="center"></div>
	<br><br>
</form:form>
<!-- <button id="emailcheck" value="emailcheck" onclick="emailcheck()">emailcheck</button> -->
	<div align="center">
		<a href="/" class="btn btn-primary" > 首頁 </a>
	</div>

</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Members Register</title>
<link rel="stylesheet" href="/css/memberssystem.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	load();
    });
    
    function load(){   
 		    	 var table = $('#addmembers');
 		    	 table.append("<tr id='mtitle'><th>idnumber</th><th>membername</th><th>memberpwd</th><th>phone</th><th>birthday</th><th>gender</th><th>adress</th><th>email</th>");
 		    	 var tr = "<tr align='center'>" + 
 		    	 		 "<td><input id='idnumber' type='text'/></td>" +
 		    	         "<td><input id='membername' type='text'/></td>" +
 		    	         "<td><input id='memberpwd' type='password'></td>" +
 		    	         "<td><input id='phone' type='text'></td>" +
 		    	         "<td><input id='birthday' type='text'></td>" +
 		    	         "<td><input id='gender' type='text'></td>" +
 		    	         "<td><input id='adress' type='text'></td>" +
 		    	      	 "<td><input id='email' type='text'></td>" +
 		    	      	 
						 "<td><button id='quickInput' type='button' value='quickInput' onclick='quickInput()'>surprise</button></td>" +
 		    	         "<td><button id='addmember' type='button' value='addmember' onclick='sendMembers()'>save</button></td>" +
 		    	         "</tr>";
 		    	 table.append(tr);

    }
    
    function sendMembers(){
    	var idnumber = $('#idnumber').val();
    	var membername = $('#membername').val();
    	var memberpwd = $('#memberpwd').val();
    	var phone = $('#phone').val();
    	var birthday = $('#birthday').val();
    	var gender = $('#gender').val();
    	var adress = $('#adress').val();
    	var email = $('#email').val();
    	
    	var params = {
    	    "idNumber":idnumber,
    		"membername":membername,
    		"memberpwd":memberpwd,
    		"phone":phone,
    		"birthday":birthday,
    		"gender":gender,
    		"adress":adress,
    		"email":email
        }
    	
    	$.ajax({
    	   type:'post',
    	   url:'insert',
    	   dataType:'JSON',
    	   contentType:'application/json',
    	   data:JSON.stringify(params),
    	   success: function(data){
    		   console.log(data);
    		   $('#feedback').html("新增成功");
    	   }
    	});
    }
    
    let index = 0;
    var idnum= ["A274967322", 'A289262174', 'A120475611', 'A173478968', 'A118785817', 'A161615166',  'A280326855']; 
    var names= ["張君雅", '成佳英', '姜哲', '曹尚佑', '吳一男', '張德秀',  '韓美女'];
    var gender= ["女", '女', '男', '男', '男', '男',  '女'];
    
    function quickInput(){
    	document.getElementById('idnumber').value = idnum[index];
    	document.getElementById('membername').value = names[index];
    	document.getElementById('memberpwd').value = 'test123';
    	document.getElementById('phone').value = '0999-777-777';
    	document.getElementById('birthday').value = '2011-11-11';
    	document.getElementById('gender').value = gender[index];
    	document.getElementById('adress').value = '台北市大安區';
    	document.getElementById('email').value = 'abc123@gmail.com';
    	
    	index++;
        if (index >= names.length) {
        	index = 0 ;
    	}
    	
    }
</script>
</head>
<body>
<div id="membersListTitle">InserMembers</div>
<div align="center">
	<table id="addmembers" border="1"></table>
	<%-- <input id="pid" type="hidden" value="${pid}"> --%>
</div>
<div id="feedback" align="center"></div>
<br><br>
<div align="center">
	<a href="/" class="btn btn-primary" > 首頁 </a>
</div>
</body>
</html>
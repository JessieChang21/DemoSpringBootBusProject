<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Members List</title>
<link rel="stylesheet" href="/css/memberssystem.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

var indexPage=1;
$(document).ready(function(){
	   load(indexPage);
	   loadadd();
});

function change(page){
	   indexPage = page;
	   load(indexPage);
}

function load(indexPage){
	   $.ajax({
		   type:'Post',
		   url:'/members/queryByPage/' + indexPage,
		   dataType:'JSON',
		   contentType:'application/json',
		   success: function(data){
			   
			   console.log('success:' + data);
			   var json = JSON.stringify(data,null,4);
			   console.log('json:' + json);
			   
			   $('#showmembers').empty("");
			   
			   if(data==null){
				   $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");;
			   }else{
				   var table = $('#showmembers');
				   table.append("<tr id='mtitle'><th>idnumber</th><th>membername</th><th>phone</th><th>birthday</th><th>email</th></tr>");
				   $.each(data, function(i,n){
					   var tr = "<tr align='center'>" + 
							    "<td><input id='idnumber' type='text' value='" + n.idNumber + "' readonly/></td>" +
				    	        "<td><input id='membername' type='text' value='" + n.membername + "' /></td>" +
				    	        "<td style='display:none'><input id='memberpwd' type='password' value='"+ n.memberpwd +"' readonly/></td>" +
				    	        "<td><input id='phone' type='text' value='"+ n.phone +"' /></td>" +
				    	        "<td><input id='birthday' type='text' value='"+ n.birthday +"' readonly/></td>" +
				    	        "<td style='display:none'><input id='gender' type='text' value='"+ n.gender +"' readonly/></td>" +
					   	        "<td style='display:none'><input id='adress' type='text' value='"+ n.adress +"' readonly/></td>" +
				    	      	"<td><input id='email' type='text' value='"+ n.email +"' /></td>" +
					            
					            "<td><button id='update' type='button' value='update' onclick='updateMembers(" + n.id + ")'>update</button></td>" + //修改
					            "<td><button id='delete' type='button' value='delete' onclick='deleteMembers(" + n.id + ")'>delete</button></td>" + //刪除
					            "</tr>";
					   table.append(tr);
				   });			   
			   }
		   }
	   });
	}
function loadadd(){
	   var table = $('#addmembers');
   	 	table.append("<tr id='mtitle'><th>idnumber</th><th>membername</th><th>memberpwd</th><th>phone</th><th>birthday</th><th>gender</th><th>adress</th><th>email</th>");
   	 	var tr = "<tr align='center'>" + 
	   	 		 "<td><input id='idnumberI' type='text'/></td>" +
	   	         "<td><input id='membernameI' type='text'/></td>" +
	   	         "<td><input id='memberpwdI' type='password'></td>" +
	   	         "<td><input id='phoneI' type='text'></td>" +
	   	         "<td><input id='birthdayI' type='text'></td>" +
	   	         "<td><input id='genderI' type='text'></td>" +
	   	         "<td><input id='adressI' type='text'></td>" +
	   	      	 "<td><input id='emailI' type='text'></td>" +
	   	      	 
				 "<td><button id='quickInput' type='button' value='quickInput' onclick='quickInput()'>surprise</button></td>" +
	   	         "<td><button id='addmember' type='button' value='addmember' onclick='sendMembers()'>save</button></td>" +
	   	         "</tr>";
   	 	table.append(tr);
}
function deleteMembers(id){  //刪除function
	var id = id;
// 	var params = {
// 		"id":id
// 	}
	$.ajax({
		 type:'Get',
		 url:'delete/' +id,
		 dataType:'JSON',
		 contentType:'application/json',
// 		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   $('#feedbackupdate').html("刪除成功");
		 }
	});
}

function updateMembers(id){  //修改function
	var id = id;
	var idnumber = $('#idnumber').val();
	var membername = $('#membername').val();
	var memberpwd = $('#memberpwd').val();
	var phone = $('#phone').val();
	var birthday = $('#birthday').val();
	var gender = $('#gender').val();
	var adress = $('#adress').val();
	var email = $('#email').val();

	var params = {
			"id":id,
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
		 url:'update',
		 dataType:'JSON',
		 contentType:'application/json',
		 data:JSON.stringify(params),
		 success: function(data){
				   console.log(data);
				   $('#feedbackupdate').html("修改成功");
		 }
	});
}

function sendMembers(){
	var idnumber = $('#idnumberI').val();
	var membername = $('#membernameI').val();
	var memberpwd = $('#memberpwdI').val();
	var phone = $('#phoneI').val();
	var birthday = $('#birthdayI').val();
	var gender = $('#genderI').val();
	var adress = $('#adressI').val();
	var email = $('#emailI').val();

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
				   $('#feedbackadd').html("新增成功");
		 }
	});
}
//小幫手
let index = 0;
var idnum= ["A274967322", 'A289262174', 'A120475611', 'A173478968', 'A118785817', 'A161615166',  'A280326855']; 
var names= ["張君雅", '成佳英', '姜哲', '曹尚佑', '吳一男', '張德秀',  '韓美女'];
var gender= ["女", '女', '男', '男', '男', '男',  '女'];

function quickInput(){
	document.getElementById('idnumberI').value = idnum[index];
	document.getElementById('membernameI').value = names[index];
	document.getElementById('memberpwdI').value = 'test123';
	document.getElementById('phoneI').value = '0999-777-777';
	document.getElementById('birthdayI').value = '2011-11-11';
	document.getElementById('genderI').value = gender[index];
	document.getElementById('adressI').value = '台北市大安區';
	document.getElementById('emailI').value = 'abc123@gmail.com';
	
	index++;
    if (index >= names.length) {
    	index = 0 ;
	}
	
}
</script>
</head>
<body>
<div id="membersListTitle" align="center">Members Query</div><br>

<div align="center">
	<table id="showmembers" border="1"></table>
	<table id="showpage">
	   <tr>
	      <td>Total Pages:${totalPages} Total Records:${totalElements}</td>
	      <td id="feedbackupdate" align="center" />
	      <td colspan="3" align="right">Previous
	          <c:forEach var="i" begin="1" end="${totalPages}" step="1">
	              <button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
	          </c:forEach>Next
	      </td>
	   </tr>
	</table>
</div>

<hr>
<div id="membersListTitle">InserMembers</div><br>
<div align="center">
	<table id="addmembers" border="1"></table>
	<div id="feedbackadd" align="center"></div>
</div>
<div align="center">
	<a href="<c:url value='/logout'/>" class="btn btn-primary"> 登出 </a><br>
</div>
</body>
</html>
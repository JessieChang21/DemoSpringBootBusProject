<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Employee List</title>
<link rel="stylesheet" href="/css/memberssystem.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	var indexPage = 1;
	$(document).ready(function() {
		load(indexPage);
	});

	function change(page) {
		indexPage = page;
		load(indexPage);
	}
	
	function load(indexPage){
		   $.ajax({
			   type:'Post',
			   url:'/employee/queryByPage/' + indexPage,
			   dataType:'JSON',
			   contentType:'application/json',
			   success: function(data){
				   console.log('success:' + data);
				   var json = JSON.stringify(data,null,4);
				   console.log('json:' + json);
				   
				   $('#showemployees').empty("");
				   if(data==null){
					   $('table').prepend("<tr><td colspan='2'>查無員工資料</td></tr>");;
				   }else{
					   var table = $('#showemployees');
					   table.append("<tr id='etitle'><th>員工ID</th><th>員工姓名</th><th>性別</th><th>職稱</th><th>職等</th></tr>");
					   $.each(data, function(i,n){
						    table.append("<tr align='center'>");
						    table.append("<td><a href='employQuery.controller?pid=" + n.id + "'>" + n.id + "</a></td>");
							table.append("<td>" + n.employeename + "</td>");
							table.append("<td style='display:none'>"+ n.groupid +"</td>");
						    if(n.gender == "M"){
						    	table.append("<td>男</td>");
						    }else{
						    	table.append("<td>女</td>");
						    }
						    if($.trim(n.jobid) == "1"){
						    	table.append("<td>站務員</td>");
						    }else{
						    	table.append("<td>駕駛員</td>");
						    }
			    	        //table.append("<td>"+ n.jobid +"</td>");
			    	        if($.trim(n.jobid) == "1"){
						    	table.append("<td>專員</td>");
						    }else{
						    	table.append("<td>經理</td>");
						    }
			    	        //table.append("<td>"+ n.rankid +"</td>");
			    	    	table.append("<td style='display:none'>"+ n.enterdate +"</td>");
			    	    	table.append("<td style='display:none'>"+ n.seniority +"</td>");
				            
			    	    	table.append("</tr>");
					   });	
				   }
				   }
		   });
		   }
</script>
</head>
<body>
	<div align="center">
	<div id="mployeeListTitle">Employee Query</div>
		<table id="showemployees" border="1"></table>
		<table id="showpage">
			<tr>
				<td>Total Pages:${totalPages} Total Records:${totalElements}</td>
				<td id="feedbackupdate" align="center" />
				<td colspan="3" align="right">Previous <c:forEach var="i"
						begin="1" end="${totalPages}" step="1">
						<button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
					</c:forEach>Next
				</td>
			</tr>
			<tr>
				<td>
					<a href='/employee/employadd.controller'  class="btn btn-primary">新增員工</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
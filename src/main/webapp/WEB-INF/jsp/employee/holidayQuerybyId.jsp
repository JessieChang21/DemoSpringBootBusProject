<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
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
	var id = $('#id_h').val();
	   $.ajax({
		   type:'Post',
		   url:'/GetHoliday/queryByPage/' + indexPage,
		   dataType:'JSON',
		   contentType:'application/json',
		   success: function(data){
			   console.log('success:' + data[0]);
			   console.log('success:' + data[0].employeeid);
			   console.log('success:' + data[0].date);
			   console.log('success:' + data[0].employeeid);
			   console.log('success:' + data[0].substituteid);
			   console.log('success:' + data[1].employeeid);
			   console.log('success:' + data[1].date);
			   console.log('success:' + data[1].employeeid);
			   console.log('success:' + data[1].substituteid);
			   console.log('success:' + data[2].employeeid);
			   console.log('success:' + data[2].date);
			   console.log('success:' + data[2].employeeid);
			   console.log('success:' + data[2].substituteid);
			   console.log('length:' + data.length);
			   var json = JSON.stringify(data,null,4);
			   console.log('json:' + json);
			   console.log('id:'+id);
			   
			   $('#showholiday').empty("");
			   if(data==null){
				   $('table').prepend("<tr><td colspan='2'>查無請假資料</td></tr>");;
			   }else{
				   var table1 = $('#showholiday');
				   table1.append("<tr id='etitle'><th>請假日期</th><th>請假時段</td><th>代班員工</th><th>註銷</th></tr>");
				   //$.each(data, function(i,n){
					for(let i=0;i<data.length;i++){
					   //if(id == n.employeeid){
					   console.log('success:' + data[i].substituteid);
					   var tr = "<tr align='center'>" + 
					   "<td>" + data[i].date + "</td>" +
					   "<td>" + data[i].timeperiod + "</td>" +
					   "<td>" + data[i].substituteid + "</td>"
					   "</tr>";
					   if(data[i].release == "Y"){
						   tr +=   "<td><a href='delete?employeeid=" + data[i].employeeid + "&date="+data[i].date+"&timeperiod="+data[i].timeperiod+"'>註銷</a></td>"
			           }
					   tr += "</tr>";
					   table1.append(tr); 
					   //}
				   }//);
			   }
			   }
	   });
	   }

</script>
</head>
<body>
	<div align="center">
	<h3>請假查詢</h3>
	<hr>
		<table id="showholiday" border="1"></table>
		<table id="showpage">
			<tr>
				<td>Total Pages:${totalPages} Total Records:${totalElements}</td>
				<td id="feedbackupdate" align="center" />
				<td colspan="3" align="right">Previous <c:forEach var="i" begin="1" end="${totalPages}" step="1">
						<button id="myPage" value="${i}" onclick="change(${i})">${i}</button>
					</c:forEach>Next
				</td>
			</tr>
		</table>
		<button><a href="<c:url value='/GetHoliday/getholidayindex'/> " >回前頁</a></button>
	</div>
	<input id="id_h" type="hidden" value="${empid}">
</body>
</html>
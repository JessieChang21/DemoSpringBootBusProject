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
	   $.ajax({
		   type:'Post',
		   url:'/GetHoliday/QueryAllUnRelease/' + indexPage,
		   dataType:'JSON',
		   contentType:'application/json',
		   success: function(data){
			   console.log('success:' + data);
			   var json = JSON.stringify(data,null,4);
			   console.log('json:' + json);
			   
			   $('#showholiday').empty("");
			   if(data==null){
				   $('table').prepend("<tr><td colspan='5'>查無請假資料</td></tr>");;
			   }else{
				   var table = $('#showholiday');
				   table.append("<tr id='etitle'><th>請假員工</th><th>代班員工</th><th>請假日期</th><th>請假時段</th><th>放行</th></tr>");
				   $.each(data, function(i,n){
					   var tr = "<tr align='center'>" + 
					   "<td>" + n.employeeid + "</td>" +
					   "<td>" + n.substituteid + "</td>" +
					   "<td>" + n.date + "</td>" +
					   "<td>" + n.timeperiod + "</td>" +
					   "<td><a href='update?employeeid=" + n.employeeid + "&date="+n.date+"&timeperiod="+n.timeperiod+"'>放行</a></td>"
					   "</tr>";
			           table.append(tr); 
				   });	
			   }
			   }
	   });
	   }
</script>
</head>
<body>
	<div align="center">
	<div id="holidayListTitle">主管放行</div>
		<table id="showholiday" border="1"></table>
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
		</table>
		<button><a href="<c:url value='/GetHoliday/getholidayindex'/> " >回前頁</a></button>
	</div>
</body>
</html>
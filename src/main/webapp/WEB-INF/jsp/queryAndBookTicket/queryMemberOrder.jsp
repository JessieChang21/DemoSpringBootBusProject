<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員訂單資訊</title>
<style>
#ordertable {
	border-collapse: collapse;
}

#ordertable td {
	width: 150px;
	border: 1px solid black;
	text-align: center;
	font-weight: normal;
	font-size: 16px;
}
</style>

</head>
<body>
	<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
	<h3>您的訂單資訊如下:</h3>
	<div id="showOrder">訂單編號:</div>
	<div id="memberOrder"></div>


	<br>
	<a href="<c:url value='/index'/>">回首頁</a>

	<script>
	window.onload = function() {
		$("#memberOrder").empty();
		        
		$.ajax({
			url : "/members/queryMemberOrderByEmail",
			type : "GET",
			dataType : 'JSON',
			contectType : 'application.json',
			success : function(data) {
				var str = JSON.stringify(data);
				var json = JSON.parse(str);
				if(json.length==0){
					$("#showOrder").html("您暫無訂單紀錄");
				}
				for (let i = 0; i < json.length; i++) {
					$("#memberOrder").append(`<div id="` + json[i].orderid + `">`+
										`<button type="button" class="primary-btn text-uppercase" name = "orderid" id="orderid"  value="`+ json[i].orderid +`">` + json[i].orderid  + `</botton>
										</div><br>`);
				}
							
				$("button").on("click",function(){
					var orderid = $(this).val();
					$("table").remove();
					
					
					$.ajax({
						url : "/members/queryMemberOrderByOrderId/" + orderid,
						type : "GET",
						dataType : 'JSON',
						contectType : 'application.json',
						success : function(data) {
						    var str = JSON.stringify(data);
							var json = JSON.parse(str);
							$("#"+orderid+"").append(`<table id = "ordertable">
												<tr>
													<td>訂票編號</td>
													<td>車次編號</td>
													<td>起站</td>
													<td>迄站</td>
													<td>乘車日期</td>
													<td>發車時間</td>
													<td>旅程時間</td>
													<td>座位編號</td>
													<td>票種</td>
													<td>金額</td>
						        				</tr></table>`);
							for (let i = 0; i < json.length; i++) {
							$("#"+orderid+"").append(`<table id = "ordertable">
										        <tr>
										        	<td>`+ json[i].orderid + `</td>
										        	<td>`+ json[i].busnumber +`</td>
										        	<td>`+ json[i].initialstation +`</td>
										        	<td>`+ json[i].finalstation +`</td>
										        	<td>`+ json[i].traveldate +`</td>
										        	<td>`+ json[i].formatinitaltime +`</td>
										        	<td>`+ json[i].traveltime +`</td>
										        	<td>`+ json[i].seat +`</td>
										        	<td>`+ json[i].tickettype +`</td>
										        	<td>`+ json[i].price +`</td>
										        </tr>
											
												</table>`);
							}
							$("#deleteorder").remove();			
							$("#"+orderid+"").append(`<button type="button" id="deleteorder" value="`+orderid+`">刪除此筆訂單</button>`);
								$("#deleteorder").click(function(){
									var deleteorderid =$(this).val();
									$("#"+deleteorderid+"").remove();
									alert("訂單編號 "+deleteorderid+" 刪除成功!");
									if($("#memberOrder:has(button)").length == 0){
										$("#showOrder").html("您暫無訂單紀錄");
									}
									
									$.ajax({
										url : "/members/deleteMemberOrderByOrderId/" + deleteorderid,
										type : "GET",
										dataType : 'JSON',
										contectType : 'application.json',
										success : function(data) {
											console.log("delete success")
										
										
										}//ajax3 success
										
									}) // ajax3
									
									
								}) // deleteorder click
									
								
						} //ajax2 success
					}) //ajax2
				}) // botton click
								
								
			} //ajax1 success
							
		}) //ajax1

	}	//windowonload
		
		
		
		
		
	</script>
</body>
</html>
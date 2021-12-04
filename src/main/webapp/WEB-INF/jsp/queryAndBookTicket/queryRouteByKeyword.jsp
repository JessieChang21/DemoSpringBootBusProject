<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>關鍵字查詢</title>
<link rel="stylesheet" href="/webjars/jquery-ui/1.12.1/jquery-ui.css">
<!-- <link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css" /> -->


</head>
<body>
	<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
	<script src="/webjars/jquery-ui/1.12.1/jquery-ui.js"></script>


	<h5 style="font-weight: bold; margin-bottom: 5%;">-站名關鍵字查詢-</h5>
	<form action="bookTicketByTripName.controller" method="POST">
		<div id="selecttext" class="query1">
			<input id="tags" type="text" class="form-control"
				placeholder="請輸入站名關鍵字">
			<div id="showbtn"></div>
		</div>
	</form>

	<script>
		$("#tags").autocomplete({
			source : "autocomplete",
			minLength : 1
		});

		var inputname;

		$("#tags").on(
				"blur",
				function() {
					inputname = $(this).val();
					console.log(inputname)
					$("#showbtn").empty();
					$.ajax({
						url : "/queryTripNameByStation",
						type : "GET",
						dataType : 'JSON',
						contectType : 'application.json',
						success : function(data) {
							var str = JSON.stringify(data);
							var json = JSON.parse(str);

							for (let i = 0; i < json.length; i++) {
								if (json[i].station == inputname) {
									$("#showbtn").append(
											`<button type="submit" name="tripname" value="`+ json[i].tripname +`">`
													+ json[i].tripname
													+ `</botton>`);
								}
							}
						}
					})
				})
	</script>
</body>
</html>
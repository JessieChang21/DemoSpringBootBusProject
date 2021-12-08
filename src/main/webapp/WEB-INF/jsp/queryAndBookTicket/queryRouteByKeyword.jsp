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
<link rel='stylesheet'
	href='/webjars/font-awesome/5.13.0/css/all.min.css'>
<link rel='stylesheet'
	href='/webjars/bootstrap/5.1.3/css/bootstrap.min.css'>
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" />

<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700"
	rel="stylesheet">
<link rel="stylesheet" href="css/travelista-master/linearicons.css">
<link rel="stylesheet" href="css/travelista-master/font-awesome.min.css">
<link rel="stylesheet" href="css/travelista-master/bootstrap.css">
<link rel="stylesheet" href="css/travelista-master/magnific-popup.css">
<link rel="stylesheet" href="css/travelista-master/jquery-ui.css">
<link rel="stylesheet" href="css/travelista-master/nice-select.css">
<link rel="stylesheet" href="css/travelista-master/animate.min.css">
<link rel="stylesheet" href="css/travelista-master/owl.carousel.css">
<link rel="stylesheet" href="css/travelista-master/main.css">

<style type="text/css">
body {
	background-color: pink
}

#station {
	color: black;
	opacity: 100%
}

.tab-content2 {
	background-color: white;
	opacity: 85%;
	display: flex;
	border-bottom-left-radius: 3%;
	border-bottom-right-radius: 3%;
	width: 28.7vw;
	height: 450px;
}

.tab-pane {
	margin: auto;
}

.query1 {
	margin-bottom: 2%;
	align-items: center;
	height: 60px;
	opacity: 95%;
}

select.form-select {
	display: inline-block;
	width: 12.2vw;
	color: gray;
}

.input-group-text {
	background-color: white;
	height: 40px;
}

.date>input {
	color: black;
}

#datepicker>input, #timepicker>input, #datepicker2>input, #timepicker2>input,
	#datepicker3>input, #timepicker3>input {
	background-color: white;
}

#roundtrip {
	width: 24.5vw;
}

.primary-btn {
	width: 24.5vw;
	height: 35px;
	border-radius: 3%;
	background: #f8b600;
	font-weight: bold;
	opacity: 95%;
	line-height: 35px;
	border: none;
	color: #fff;
	display: inline-block;
	font-size: 16px;
	font-weight: 500;
	position: relative;
	-webkit-transition: all 0.3s ease 0s;
	-moz-transition: all 0.3s ease 0s;
	-o-transition: all 0.3s ease 0s;
	transition: all 0.3s ease 0s;
	cursor: pointer;
}

.btn-primary {
	margin-bottom: 6%;
}

.err {
	color: red;
	font-size: 0.9em;
	font-style: italic;
	padding-left: 3%;
}

#checkcodespan {
    display: flex;
    align-items: center;
}

.code {
	/*驗證碼*/
	margin-left: 2%;
	font-style: italic;
	background-color: darkslategray;
	color: #f8b600;
	font-size: 28px;
	letter-spacing: 3px;
	font-weight: bolder;
	float: right;
	cursor: pointer;
	padding: 5px;
	text-align: center;
	height: 35px;
	border-radius: 3%;
}

#selectdate, #selecttime {
	margin-bottom: 1%;
	align-items: center;
	height: 55px;
}
</style>
</head>
<body>
	<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
	<script src="/webjars/jquery-ui/1.12.1/jquery-ui.js"></script>

	<!-- 	<script src="/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script> -->
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" -->
	<!--     integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" -->
	<!--     crossorigin="anonymous"></script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
	<script src="javascripts/bootstrap-datetimepicker.min.js"></script>
	<script>
		$(function() {
			$.extend(true, $.fn.datetimepicker.defaults, {
				icons : {
					time : 'far fa-clock',
					date : 'far fa-calendar',
					up : 'fas fa-arrow-up',
					down : 'fas fa-arrow-down',
					previous : 'fas fa-chevron-left',
					next : 'fas fa-chevron-right',
					today : 'far fa-calendar-check-o',
					clear : 'far fa-trash',
					close : 'far fa-times'
				}
			});
		});
	</script>
	<!-- --------------------------------------------------------------------------- -->


	<div class="tab-content2" id="myTabContent">
		<!-- 	最外層暫時用，以vs為主-->


		<div class="tab-pane fade" id="station" role="tabpanel"
			aria-labelledby="station-tab">

			<form action="queryRoutesByTripname.controller" method="POST">

				<div id="selecttext" class="query1">
					<input id="tags" type="tags" class="form-control"
						placeholder="請輸入站名關鍵字">
					<p class="err" id="errtext2"></p>
				</div>

				<div id="selectInit" class="query1">
					<select class="form-select" id="showtripname" style="width: 24.46vw;">
						<option selected disabled="disabled">路線名稱</option>
					</select>
					<p class="err" id="errtripname2"></p>
				</div>

				<div id="selectdate">
					<div class=" input-group date" id="datepicker2">
						<input id="inputdate2" type="text" class="form-control"
							placeholder="日期" readonly>
						<div class="input-group-addon input-group-prepend">
							<span class="input-group-text"><i
								class="fas fa-calendar-alt"></i></span>
						</div>
					</div>
					<p class="err" id="errdate2"></p>

				</div>

				<div id="selecttime">
					<div class="input-group date" id="timepicker2">
						<input id="inputtime2" type="text" class="form-control"
							placeholder="時間" readonly>
						<div class="input-group-addon input-group-prepend">
							<span class="input-group-text"><i class="fas fa-clock"></i></span>
						</div>
					</div>
					<p class="err" id="errtime2"></p>

				</div>

				<div id="selectticket" class="query1">
					<span> <select class="form-select" id="adult2">
							<option selected disabled="disabled">成人</option>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
					</select> <select class="form-select" id="children2">
							<option selected disabled="disabled">孩童</option>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
					</select>
					</span>
					<p class="err" id="errqty2">${errors.qtyerr}</p>
				</div>

				<!-- 驗證碼 -->
				<div class="query1">
					<span id="checkcodespan"> 
					<input type="text" class="form-control" style="width: 12.23vw;" id="inputCode" placeholder="請輸入驗證碼" /> <span class="code" id="checkCode"></span>
					</span>
					<p class="err" id="checkCodeErr"></p>
				</div>
				<input id="inputform" name="inputform" type="hidden">
				<input id="submit2" class="primary-btn text-uppercase" style="background: darkgray" type="submit" disabled value="送出">
        </div>
			</form>
		</div>
	</div>
	<!-- --------------------------------------------------------------------------- -->
	
	<script>
		// 	站名關鍵字
		$("#tags").autocomplete({
			source : "autocomplete",
			minLength : 1
		});

		var inputname;

		$("#tags").on("blur",function() {
			inputname = $(this).val();
			$("#showtripname").empty();
			$("#showtripname").append(`<option selected disabled="disabled">路線名稱</option>`);
	
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
							$(".errtext2").html("");
							$("#showtripname").append(
											`<option value="`+ json[i].tripname+ `">`
													+ json[i].tripname
													+ `</option>`);
							}
						}
					}
				})
			})

		// 		日期時間選擇
		$('#timepicker2').datetimepicker({
			format : 'HH:mm:ss',
			ignoreReadonly : true
		});

		var minDate = new Date();
		var maxDate = new Date();

		minDate.setDate(minDate.getDate() +1); // set days - mean previous date from current date + mean future date from current date
		maxDate.setDate(maxDate.getDate() + 30);

		$('#datepicker2').datetimepicker({
			format : 'YYYY/MM/DD',
			minDate : minDate,
			maxDate : maxDate,
			ignoreReadonly : true
		});

		
		//驗證碼
		var code;
		function createCode() {
			code = "";
			var codeLength = 5; //驗證碼的長度
			var checkCode = document.getElementById("checkCode");
			var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b',
					'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
					'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z');
			for (var index = 0; index < codeLength; index++) {
				var charNum = Math.floor(Math.random() * 36); // 英文26 + 數字10
				code += codeChars[charNum];
			}
			if (checkCode) {
				checkCode.className = "code";
				checkCode.innerHTML = code;
			}
		}
		function validateCode() {
			var inputCode = document.getElementById("inputCode").value;
			var textShow = document.getElementById("checkCodeErr")
			textShow.innerHTML = " ";
			if (inputCode.length <= 0) {
				textShow.innerHTML = "請輸入驗證碼";
				textShow.style.color = "red";
				$("#submit2").prop('disabled', true);
				$("#submit2").css("background", "darkgray");
			} else if (inputCode.toUpperCase() != code.toUpperCase()) {
				textShow.innerHTML = "驗證碼有誤";
				textShow.style.color = "red";
				createCode();
				$("#submit2").prop('disabled', true);
				$("#submit2").css("background", "darkgray");
			}
		}
		
		function checkCode() {
			$("#inputCode").on("blur", function() {
				validateCode();
			});
		}
		window.onload = function() {
			checkCode();
			createCode();
			$("#checkCode").on("click", function() {
				createCode()
			});
			checkCode.onclick = function() {
				createCode()
			}
			$("#inputCode").on("blur", function() {
				validateCode();
			});
			
		}
		
		// 驗證
		$("#inputCode").on("blur",function(){
			validateCode();
			if($("#tags").val() !== "" &&
			   $("#showtripname").find("option:selected").text() !== "路線名稱" &&
			   $("#inputdate2").val() !== "" &&
			   $("#inputtime2").val() !== "" &&
			   ($("#adult2").find("option:selected").text() !== '成人' ||
			   $("#children2").find("option:selected").text() !== '孩童')
			){
				$("#submit2").prop('disabled', false);
				$("#submit2").css("background", "#f8b600");
			}else{
				$("#submit2").prop('disabled', true);
			}
		});
		
		$("#tags").on("blur",function() {
			$("#errtext2").html("");
			if ($("#tags").val() == "") {
				$("#errtext2").html("站名不得為空");
				$("#submit2").prop('disabled', true);
			}
		});
		$("#showtripname").on("blur",function() {
			$("#errtripname2").html("");
			if ($("#showtripname").find("option:selected").text() == "路線名稱") {
				$("#errtripname2").html("請選擇路線");
				$("#submit2").prop('disabled', true);
			}
		});
		$("#inputdate2").on("blur",function() {
			$("#errdate2").html("");
			if ($("#inputdate2").val() == "") {
				$("#errdate2").html("請選擇日期");
				$("#submit2").prop('disabled', true);
			}
		});
		$("#inputtime2").on("blur",function() {
			$("#errtime2").html("");
			if ($("#inputtime2").val() == "") {
				$("#errtime2").html("請選擇時間");
				$("#submit2").prop('disabled', true);
			}
		});
		$("#adult2").on("blur",function() {
			$("#errqty2").html("");
			if ($("#adult2").find("option:selected").text() == '成人') {
				$("#errqty2").html("請選擇人數");
				$("#submit2").prop('disabled', true);
			}
		});
		$("#children2").on("blur",function() {
			$("#errqty2").html("");
			if ($("#children2").find("option:selected").text() == '孩童') {
				$("#errqty2").html("請選擇人數");
				$("#submit2").prop('disabled', true);	
			}
		});
		
		
		
		// 送form表單資料給server
		
		$("#submit2").on("click",function(){
// 			var station = $("#tags").val();
			var tripname = $("#showtripname").find("option:selected").text();
			var traveldate = $("#inputdate2").val();
			
			let weekday;
			let day = new Date(traveldate);
			switch (day.getDay()) {
				case 0:	weekday = "Sunday";break;
				case 1:	weekday = "Monday";break;
				case 2:	weekday = "Tuesday";break;
				case 3:	weekday = "Wednesday";break;
				case 4:	weekday = "Thursday";break;
				case 5:	weekday = "Friday";break;
				case 6:	weekday = "Saturday";break;
			}
			
			var initialtime = $("#inputtime2").val();
			var adult = $("#adult2").find("option:selected").text();
			
			if(adult=='成人'){
				adult = 0;
			}else{
				adult = parseInt(adult);
			}
			
			var children = $("#children2").find("option:selected").text();

			if(children=='孩童'){
				children = 0;
			}else{
				children = parseInt(children);
			}
			
// 			jsonObj = [];
//             item = {}
            
//             item["tripname"] = tripname;
//             item["traveldate"] = traveldate;
//             item["weekday"] = weekday;
//             item["initialtime"] = initialtime;
//             item["adult"] = adult;
//             item["children"] = children;

//             jsonObj.push(item);//將item傳入jsonObj裡面
		    
            var params = {
            	    "tripname":tripname,
            		"traveldate":traveldate,
            		"weekday":weekday,
            		"initialtime":initialtime,
            		"adult":adult,
            		"children":children
                }
                
            $("#inputform").val(JSON.stringify(params));
            
// 		    $.ajax({
// 		    	 type:'post',
// 		    	 url:'bookticketByStationKeyword.controller',
// 		    	 dataType:'JSON',
// 		    	 contentType:'application/json',
// 		    	 data:JSON.stringify(params),
// 		    	 success: function(data){
		    		
// 		    	  }
// 		    });
			
			
		})
		
	</script>
</body>
</html>
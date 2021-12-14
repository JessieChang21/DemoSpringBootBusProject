<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
<c:if test="${empty employee}">
	<c:redirect url="/backLoginsystemMain.controller" />
</c:if>
<style type="text/css">
.mytext {
	width: 500px;
	font-size: 12pt;
	padding: 5px;
}

span.error {
	color: red;
	display: inline-block;
	font-size: 12pt;
}

p {
	font-size: 12pt;
	color: black;
	margin-left: 100px;
	margin-top: 10px;
}

.prettyborder {
	border: 1px solid #0066cc;
	padding: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

table {
	font-size:20px;
	width:100%;
	border: 0px ridge navy;
	padding: 5px;
	border-collapse: collapse; /*重要*/
	background: #E0EAFC; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #CFDEF3, #E0EAFC);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #CFDEF3, #E0EAFC);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}
.tourtable th{
	min-width: 150px;
}
.for-th th {
	border: 1px solid black;
	padding: 5px;
	color: white;
	background: #1e3c72; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #2a5298, #1e3c72);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #2a5298, #1e3c72);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}

table td {
	border: 0px solid white;
	padding: 5px;
	margin-top: 2px;
	color: navy;
	background: #E0EAFC; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #CFDEF3, #E0EAFC);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #CFDEF3, #E0EAFC);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}

.expiredtour {
	color: white;
	border: 3px ridge #FF0000;
	padding: 5px;
	margin-top: 10px;
}

.insertBox {
	border-top: 10px double navy;
	padding: 5px;
	margin-top: 10px;
}

textarea {
	height: 100px;
	width: 200px; resize : none;
	margin-top: 25px;
	resize: none;
}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>TOUR Managed Function Part</title>

<!-- Custom fonts for this template-->
<link href="/ServerSide/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/ServerSide/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<c:import url="/WEB-INF/jsp/commons/backsidebar.jsp"></c:import>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
		

			<!-- Main Content -->
			<div id="content">

				<c:import url="/WEB-INF/jsp/commons/backTopbar.jsp"></c:import>

				<!-- Begin Page Content -->


				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">套票管理</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Noted:請管理員注意紅色為過期活動</h6>
						</div>
						<div class="card-body" align="center">
							<div class="table-responsive">
								<div class="prettyborder">
									<table class="tourtable" style="text-align: center">
										<tr class="for-th">
											<th>套票ID</th>
											<th>套票名稱</th>
											<th>套票原價</th>
											<th>優惠售價</th>
											<th>適用路線</th>
											<th>套票內容</th>
											<th>販售時間</th>
											<th>使用時間</th>
											<th>縮圖</th>
											<th colspan="2">資料維護</th>
										</tr>
										<tr>
											<td colspan="11"></td>
										</tr>
										<c:forEach var='Tour' items='${TourList}'>
											<c:if test="${Tour.tourUseEnd.compareTo(crdate)<0}">
												<tr id="ExpiredData" class="expiredtour">
											</c:if>
											<c:if test="false">
												<tr id="TourData">
											</c:if>
											<td style="text-align: center">${Tour.tourId}</td>
											<td><input id="upName${Tour.tourId}"
												value="${Tour.tourName}"></td>
											<td><input id="upPrice${Tour.tourId}"
												value="${Tour.tourPrice}"
												style="text-align: center; width: 50px;"></td>
											<td><input id="updisPrice${Tour.tourId}"
												value="${Tour.discountPrice}"
												style="text-align: center; width: 50px;"></td>
											<td><select id="upRouteId${Tour.tourId}"
												style="text-align: center;">
													<c:forEach var='Routes' items='${RoutesList}'>
														<c:if test="${Tour.fk_routes_routeId == Routes.routeId}">
															<option value="${Routes.routeId}" selected="selected">${Routes.tripName}</option>
														</c:if>
														<c:if test="${Tour.fk_routes_routeId != Routes.routeId}">
															<option value="${Routes.routeId}">${Routes.tripName}</option>
														</c:if>
													</c:forEach>
											</select></td>
											<td><textarea id="upContent${Tour.tourId}">${Tour.tourContent}</textarea></td>
											<td style="text-align: center">
											<input id="upSS${Tour.tourId}" value="${Tour.tourSaleStart}" type="date" style="text-align: center; width: 150px;font-size: 15px;">
												<br>to<br> 
											<input id="upSE${Tour.tourId}" value="${Tour.tourSaleEnd}" type="date"	style="text-align: center; width: 150px;font-size: 15px;"></td>
											<td style="text-align: center">
											<input id="upUS${Tour.tourId}" value="${Tour.tourUseStart}"	type="date" style="text-align: center; width: 150px;font-size: 15px;">
												<br>to<br> 
											<input id="upUE${Tour.tourId}" value="${Tour.tourUseEnd}" type="date" 	style="text-align: center; width: 150px;font-size: 15px;"></td>
											<td><img width='120' height='80'
												src="/images/tour/${Tour.tourId}.jpg" /><br>
												<select id="upIMGURL${Tour.tourId}" style="width: 120px;font-size: 15px">
												<option>/tour/tourimages${Tour.tourId}</option>
												</select>
											</td>
											<td><button onclick="update(${Tour.tourId})"
													class="button3">修改</button></td>
											<td><button onclick="deleteData(${Tour.tourId})"
													class="button3">刪除</button></td>
											</tr>
											<tr>
												<td colspan="10"></td>
											</tr>
										</c:forEach>
										<tr id="InsertTourData" class="insertBox">
											<td colspan="11" style="text-align: left;">Insert New
												Data Here</td>
										</tr>
										<tr>
											<td></td>
											<td><textarea id="insertName"
													style="text-align: left;resize: none"></textarea></td>
											<td><input id="insertPrice" value=""
												style="text-align: center; width: 50px;"></td>
											<td><input id="insertdPrice" value=""
												style="text-align: center; width: 50px;"></td>
											<td>
												<!--<input    id="insertRouteId" value=""  style="text-align:center ; width: 45px;"> -->
												<select id="insertRouteId" style="text-align: center;">
													<c:forEach var='Routes' items='${RoutesList}'>
														<option value="${Routes.routeId}">${Routes.tripName}</option>
													</c:forEach>
											</select>
											</td>
											<td><textarea id="insertContent"
													style="height: 100px; width: 200px;"></textarea></td>
											<td style="text-align: center">開始時間<br> <input
												id="insertSaleS" type="date" value="" 
												style="text-align: center; width: 150px;font-size: 15px;"> <br>結束時間<br>
												<input id="insertSaleE" type="date" value="" 
												style="text-align: center; width: 150px;font-size: 15px;">
											</td>
											<td style="text-align: center">開始時間<br> <input
												id="insertUseS" type="date" value="" 
												style="text-align: center; width: 150px;font-size: 15px;"> <br>結束時間<br>
												<input id="insertUseE" type="date" value="" 
												style="text-align: center; width: 150px;font-size: 15px;">
											</td>
											<td><select id="insertIMGURL" style = "width:120px; font-size: 15px">
											<option>/tour/tourimages10001</option>
											<option>/tour/tourimages10002</option>
											<option>/tour/tourimages10003</option>
											<option>/tour/tourimages10004</option>
											<option>/tour/tourimages10005</option>
											<option>/tour/tourimages10006</option>
											<option>/tour/tourimages10007</option>
											<option>/tour/tourimages10008</option>
											<option>/tour/tourimages10009</option>
											<option>/tour/tourimages10010</option>
											</select></td>
											<td colspan="2"><button onclick="insertNewData()"
													class="button3">新增</button></td>
										</tr>
										<tr>
											<td id = "errorLog" colspan="11" style="text-align: right;">Show Date
												Check Info</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/backlogout.controller">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/ServerSide/vendor/jquery/jquery.min.js"></script>
    <script src="/ServerSide/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/ServerSide/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/ServerSide/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/ServerSide/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/ServerSide/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/ServerSide/js/demo/datatables-demo.js"></script>

</body>
<script>
	function update(tourId){
		console.log(tourId)
		var formData = document.createElement('form');
		var dataArray = [
			//"tourId",
			"tourName",
			"tourPrice",
			"discountPrice",
			"fk_routes_routeId",
			"tourContent",
			"tourSaleStart",
			"tourSaleEnd",
			"tourUseStart",
			"tourUseEnd",
			"tourURL",

		];
		var keyArray = [
			'upName',
			'upPrice',
			'updisPrice',
			'upRouteId',
			'upContent',
			'upSS',
			'upSE',
			'upUS',
			'upUE',
			'upIMGURL',
		]
		var errorArray = [
			'活動名稱',
			'原價',
			'特價',
			'適用路線',
			'活動內容',
			'販賣開始時間',
			'販賣結束時間',
			'使用開始時間',
			'使用結束時間',
			'縮圖URL'
			
		]
		    formData.setAttribute("method", "post");
			formData.setAttribute("action", "/tourInsert");
			  //for(var key in dataArray){
			  var hidden1 = document.createElement("input");
			  hidden1.setAttribute("type", "hidden");
			  hidden1.setAttribute("name", 'tourId');
			  hidden1.setAttribute("value", tourId);
			    formData.appendChild(hidden1);
			    var iserror = false;
			    var errorText = '' ;
			  dataArray.forEach(function (key,i) { 
				  if (!$('#'+keyArray[i]+tourId).val()){
					  //WRG
					  iserror =true ;
					  errorText += errorArray[i]+" ";
				  }
				  if (keyArray[i] == 'upSS' ){
					if($('#upSS'+tourId).val() > $('#upSE'+tourId).val() ) {
						 iserror =true
						 errorText += '販賣時間 ' ;
					}
				  }
				  if (keyArray[i] == 'upUS' ){
						if($('#upUS'+tourId).val() > $('#upUE'+tourId).val() ) {
							 iserror =true
							 errorText += '販賣時間 ' ;
						}
					  }
				  console.log(key)
				  var hiddenField = document.createElement("input");
				    hiddenField.setAttribute("type", "hidden");
				    hiddenField.setAttribute("name", key);
				    hiddenField.setAttribute("value", $('#'+keyArray[i]+tourId).val());
				    formData.appendChild(hiddenField);
			  });
			  if(iserror){
				  $('#errorLog').html(errorText+'有誤請確認');
				  alert(errorText+'有誤請確認');
				  return ;
			  }
			  console.log(formData)
			  document.body.appendChild(formData); 
			 formData.submit();
	}
	
	function insertNewData (){
		var formData = document.createElement('form');
		var dataArray = [
			"tourName",
			"tourPrice",
			"discountPrice",
			"fk_routes_routeId",
			"tourContent",
			"tourSaleStart",
			"tourSaleEnd",
			"tourUseStart",
			"tourUseEnd",
			"tourURL",
		];
		var keyArray = [
			'insertName',
			'insertPrice',
			'insertdPrice',
			'insertRouteId',
			'insertContent',
			'insertSaleS',
			'insertSaleE',
			'insertUseS',
			'insertUseE',
			'insertIMGURL',
		]
		var errorArray = [
			'活動名稱',
			'原價',
			'特價',
			'適用路線',
			'活動內容',
			'販賣開始時間',
			'販賣結束時間',
			'使用開始時間',
			'使用結束時間',
			'縮圖URL'
		]
	    formData.setAttribute("method", "post");
		formData.setAttribute("action", "/tourInsert");
		  //for(var key in dataArray){
		  var hidden1 = document.createElement("input");
		  hidden1.setAttribute("type", "hidden");
		  hidden1.setAttribute("name", 'tourId');
		  hidden1.setAttribute("value", 0);
		  formData.appendChild(hidden1);
		    var iserror = false;
		    var errorText = '' ;
		  dataArray.forEach(function (key,i) { 
			  if (!$('#'+keyArray[i]).val()){
				  //WRG
				  iserror =true ;
				  errorText += errorArray[i]+" ";
			  }
			  if (keyArray[i] == 'insertSaleS' ){
				if($('#insertSaleS').val() > $('#insertSaleE').val() ) {
					 iserror =true ;
					 errorText += '販賣時間 ' ;
				}
			  }
			  if (keyArray[i] == 'insertUseS' ){
					if($('#insertUseS').val() > $('#insertUseE').val() ) {
						 iserror =true
						 errorText += '販賣時間 ' ;
					}
				  }
			  console.log(key)
			  var hiddenField = document.createElement("input");
			    hiddenField.setAttribute("type", "hidden");
			    hiddenField.setAttribute("name", key);
			    hiddenField.setAttribute("value", $('#'+keyArray[i]).val());
			    formData.appendChild(hiddenField);
		 		 });
			  if(iserror){
				  $('#errorLog').html(errorText+'有誤請確認');
				  //$('#errorLog')
				  alert(errorText+'有誤請確認');
				  return ;
			  }
		  console.log(formData)
		  document.body.appendChild(formData); 
		  formData.submit();
	}
	function deleteData(tourId){
		var formData = document.createElement('form');
	    formData.setAttribute("method", "post");
		formData.setAttribute("action", "/tourDelete");
		  //for(var key in dataArray){
		  var hidden1 = document.createElement("input");
		  hidden1.setAttribute("type", "hidden");
		  hidden1.setAttribute("name", 'editId');
		  hidden1.setAttribute("value", tourId);
		  formData.appendChild(hidden1);
		  document.body.appendChild(formData); 
		  formData.submit();
	}
	
</script>
</html>
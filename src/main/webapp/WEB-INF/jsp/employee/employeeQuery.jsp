<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Insert title here</title>
    <!-- Custom fonts for this template-->
    <link href="/ServerSide/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/ServerSide/css/sb-admin-2.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var gender_h = $('#gender_h').val();
		var jobid_h = $('#jobid_h').val();
		var rankid_h = $('#rankid_h').val();
		getgender(gender_h);
		getJob(jobid_h);
		getRank(rankid_h);
	});
	function getgender(gender_h) {
		$('#gender').empty("");
		var gender = $('#gender');
		if (gender_h == "M") {
			gender.append($("<option value='M' selected='selected'>男性</option>"));
			gender.append($("<option value='F'>女性</option>"));
		} else {
			gender.append($("<option value='M'>男性</option>"));
			gender.append($("<option value='F' selected='selected'>女性</option>"));
		}
	}
	function getJob(jobid_h){
		$.ajax({
			   type:'Post',
			   url:'/employee/getJob',
			   dataType:'JSON',
			   contentType:'application/json',
			   success: function(data){
				   console.log('success:' + data);
				   var json = JSON.stringify(data,null,4);
				   console.log('json:' + json);
				   var parsedObjinArray = JSON.parse(json); 
				   $('#jobid').empty("");
				   var jobid = $('#jobid');
				   $.each(parsedObjinArray, function(i,n){
					   if(jobid_h == n.jobid){
						   jobid.append("<option value='"+n.jobid+"' selected='selected'>"+n.jobname+"</option>");
					   }else{
						   jobid.append("<option value='"+n.jobid+"'>"+n.jobname+"</option>"); 
					   }
				   });
			   },error: function() {console.log("error-getJob");}
		});
	}
	function getRank(rankid_h){
		$.ajax({
			   type:'Post',
			   url:'/employee/getRank',
			   dataType:'JSON',
			   contentType:'application/json',
			   success: function(data){
				   console.log('success:' + data);
				   var json = JSON.stringify(data,null,4);
				   console.log('json:' + json);
				   var parsedObjinArray = JSON.parse(json); 
				   $('#rankid').empty("");
				   var jobid = $('#rankid');
				   $.each(parsedObjinArray, function(i,n){
					   if(rankid_h == n.rankid){
						   jobid.append("<option value='"+n.rankid+"' selected='selected'>"+n.rankname+"</option>");
					   }else{
						   jobid.append("<option value='"+n.rankid+"'>"+n.rankname+"</option>");
					   }
				   });
			   },error: function() {console.log("error-getJob");}
		});
	}
	function updateemployee(){
    	var id = $('#id_h').val();
    	var employeename = $('#employeename').val();
    	var password = $('#password_h').val();
    	var groupid = $('#groupid').val();
    	var gender = $('#gender').val();
    	var jobid = $('#jobid').val();
    	var rankid = $('#rankid').val();
    	var enterdate = $('#enterdate').val();
    	var seniority = $('#seniority').val();
    	console.log(id +","+ employeename +","+ groupid +","+ gender +","+ jobid +","+ rankid +","+ enterdate +","+ seniority);
    	
    	if($.trim(employeename)==''){
    		alert('employeename is empty');
    		return;
    	}
    	var params = {
    	    "id":id,
    		"employeename":employeename,
    		"password":password,
    		"groupid":groupid,
    		"gender":gender,
    		"jobid":jobid,
    		"rankid":rankid,
    		"enterdate":enterdate,
    		"seniority":seniority
        }
    	
    	$.ajax({
    	   type:'post',
    	   url:'employeeUpdate',
    	   dataType:'JSON',
    	   contentType:'application/json',
    	   data:JSON.stringify(params),
    	   success: function(data){
    		   console.log(data);
    		   //$('#feedback').html("修改成功");
    		   
    	   }
    	});
    	alert("修改成功!");
    	window.location.href="employeemain.controller"; 
    }
	
	function deleteemployee(){
    	var id = $('#id_h').val();
    	var employeename = $('#employeename').val();
    	var password = $('#password_h').val();
    	var groupid = $('#groupid').val();
    	var gender = $('#gender').val();
    	var jobid = $('#jobid').val();
    	var rankid = $('#rankid').val();
    	var enterdate = $('#enterdate').val();
    	var seniority = $('#seniority').val();
    	console.log(id +","+ employeename +","+ groupid +","+ gender +","+ jobid +","+ rankid +","+ enterdate +","+ seniority);

    	var params = {
    	    "id":id,
    		"employeename":employeename,
    		"password":password,
    		"groupid":groupid,
    		"gender":gender,
    		"jobid":jobid,
    		"rankid":rankid,
    		"enterdate":enterdate,
    		"seniority":seniority
        }
    	var flag = confirm("確認刪除");
    	if(flag){
    	$.ajax({
    	   type:"POST",
    	   url:"/employee/employeeDelete/" + id,
    	   dataType:'JSON',
    	   contentType:'application/json',
    	   //data:JSON.stringify(params),
    	   success: function(data){
    		   console.log(data);
    		   console.log("delete success")
    		   alert("刪除成功!");
    	   }
    	});
    	}
    	
    	window.location.href="employeemain.controller"; 
    }
</script>
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
					<h1 class="h3 mb-2 text-gray-800">Tables</h1>
					<p class="mb-4">
						DataTables is a third party plugin that is used to generate the
						demo table below. For more information about DataTables, please
						visit the <a target="_blank" href="https://datatables.net">official
							DataTables documentation</a>.
					</p>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">DataTables
								Example</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
	<form action="employeeDelete2" method="post">
		<table class="table table-bordered" id="showemployees"width="100%" cellspacing="0">
			<tr>
				<td colspan='2'><h3>員工基本資料</h3></td>
			</tr>
			<tr>
				<td><label>員工編號</label></td>
				<td>${pid}</td>
			</tr>
			<tr>
				<td><label>員工姓名</label></td>
				<td><input id='employeename' name='employeename' type='text'
					value='${employeename}' /></td>
			</tr>
			<tr>
				<td><label>性別</label></td>
				<td><select id="gender" name="gender"></select></td>
			</tr>
			<tr>
				<td><label>職稱</label></td>
				<td><select id="jobid" name="jobid"></select></td>
			</tr>
			<tr>
				<td><label>職等</label></td>
				<td><select id="rankid" name="rankid"></select></td>
			</tr>
			<tr>
				<td colspan='2'>
					<button id='update' type='button' onclick="updateemployee()">update</button>
					<button id='delete' type='button' onclick="deleteemployee()">delete</button>
					<button><a href="<c:url value='/employee/employeemain.controller'/> " >回前頁</a></button>
				</td>
			</tr>
		</table>
		<input id="id_h" name="id_h" type="hidden" value="${pid}">
		<input id="password_h" type="hidden" value="${password}">
		<input id="gender_h" type="hidden" value="${gender}">
		<input id="jobid_h" type="hidden" value="${jobid}">
		<input id="rankid_h" type="hidden" value="${rankid}">
		<input id="groupid_h" type="hidden" value="${groupid}">
		<input id="enterdate_h" type="hidden" value="${enterdate}">
		<input id="seniority_h" type="hidden" value="${seniority}">
		<div id="feedback" align="center"></div>
	</form>
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
						<span>Copyright &copy; Your Website 2020</span>
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
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
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
	<script src="/ServerSide/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/ServerSide/js/demo/chart-area-demo.js"></script>
	<script src="/ServerSide/js/demo/chart-pie-demo.js"></script>

</body>
</html>
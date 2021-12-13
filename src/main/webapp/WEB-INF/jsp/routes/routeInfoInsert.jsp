<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<c:if test="${empty employee}">
 <c:redirect url="/backLoginsystemMain.controller" />
</c:if>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<title>新增路線</title>
<link rel="icon" href="/images/bus.svg" type="/image/x-icon" />

    <!-- Custom fonts for this template -->
    <link href="/ServerSide/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/ServerSide/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/ServerSide/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    <style>

        tr.even {
            background-color: #ECECFF !important;
        }
        
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#showroutes tr:even").addClass('even');
});

var count = 2;
var routeId= $('#routeId').val;
var tripName= $('#tripName').val;
var area= $('#area').val;
var direction= $('#direction').val;

	$(function(){
    $("#btn_addtr").click(function(){
    	count+=1;
    $("#dynamicTable").append("<tr><td><input type='hidden' value='"+ count +"' name='stationSequence'/><span>"+ count +"</span></td>"+
            "<td><input type='text' name='station' /></td>" +
    		"<td><input type='text' name='sequenceTime' /></td>"+
    		"<td align='center'><button type='button' id='btn_deltr' onclick='deltr()' class='btn btn-danger btn-circle'><i class='fas fa-trash'></i></button></td></tr>");   
    });
    });
   
    function deltr(){
    var length=$("#dynamicTable tr").length;
    if(length<=3){
    alert("請最少輸入2站");
    }else{
    $("#dynamicTable tr:last").remove();
    count-=1;
    }
    }

    function go(){
    	if(confirm("確定進行新增路線?")){
        rInfo=$("#rInfo").serializeArray();
        r= $("#routes").serializeArray();
        var dataR = r.concat(rInfo);
        
//         $.each(dataR, function(i, field){
//         $("#results").append(field.name + ":" + field.value + "<br>");
//         });
        
        var json = JSON.stringify(dataR,null,4);
		   console.log('json:' + json);
		   
		   $.ajax({
	    	   type:'post',
	 		   url:'/routes/insertRouteInfoGo.controller',
	 		   dataType:'JSON',
	 		   data:JSON.stringify(dataR),
	 		   contentType:'application/json',
	 		   async:false,
	 		   success: function(data){
	 			  console.log('success:' + data);
				   var json = JSON.stringify(data,null,4);
				   console.log('json:' + json);
				   
	 			  if(data != null){
	 				 console.log("Ok!");
	 			　　　　window.location.href="http://localhost:8081/routes/insertRouteInfoSuccess.controller?rid="+data.routeId;//需要跳轉的地址
	 				//window.location.replace("http://localhost:8081/routes/routeInsertSuccess");
	 			　} else {
	 				console.log("No!");
	 			　}
	 		   }
		   });
    	}
    }
    
    function setKey(){
    	$("#dynamicTable").append("<tr><td><input type='hidden' value='3' name='stationSequence'/><span>3</span></td>"+
                "<td><input type='text' name='station' value='示範站3'/></td>" +
        		"<td><input type='text' name='sequenceTime' value='420'/></td>"+
        		"<td align='center'><button type='button' id='btn_deltr' onclick='deltr()' class='btn btn-danger btn-circle'><i class='fas fa-trash'></i></button></td></tr>");   
    	$("#dynamicTable").append("<tr><td><input type='hidden' value='4' name='stationSequence'/><span>4</span></td>"+
                "<td><input type='text' name='station' value='示範站4'/></td>" +
        		"<td><input type='text' name='sequenceTime' value='420'/></td>"+
        		"<td align='center'><button type='button' id='btn_deltr' onclick='deltr()' class='btn btn-danger btn-circle'><i class='fas fa-trash'></i></button></td></tr>");   
        $("#station1").attr("value","示範站1");
        $("#sequenceTime1").attr("value","420");
        $("#station2").attr("value","示範站2");
        $("#sequenceTime2").attr("value","420");
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
                    <h1 class="h3 mb-2 text-gray-800">申請新增班次</h1>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">
									
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <form id="routes">          
                                <table class="table table-bordered" id="showroutes" width="100%" cellspacing="0">
                                    <tr>
										<td>路線編號:</td>
										<td>${newRoute.routeId}</td>
									</tr>
									<tr>
										<td>路線名稱:</td>
										<td>${newRoute.tripName}</td>
									</tr>
									<tr>
										<td>地區:</td>
										<td>${newRoute.area}</td>
									</tr>
									<tr>
										<td>方向:</td>
										<td>
										<c:if test="${newRoute.direction==0}">去程 </c:if>
										<c:if test="${newRoute.direction==1}">返程 </c:if>
										</td>
									</tr>
                                </table>
                                
								<input type="hidden" name="routeId" value="${newRoute.routeId}">
								<input type="hidden" name="tripName" value="${newRoute.tripName}">
								<input type="hidden" name="area" value="${newRoute.area}">
								<input type="hidden" name="direction" value="${newRoute.direction}">
	
                            </form>
                                
                                <form id="rInfo">
									<table id="dynamicTable" class="table table-bordered"  width="100%" cellspacing="0">
										<tr class='even'><td>順序</td><td>車站名稱</td><td>行經時間(s)</td><td></td></tr>
										<tr>
										<td><input type="hidden" value="1" name="stationSequence" /><span>1</span></td>
								        <td><input type="text" name="station" id='station1' /></td>
										<td><input type="text" name="sequenceTime" id='sequenceTime1' /></td>
										<td align='center'><button type="button" id="btn_deltr" onclick="deltr()" class='btn btn-danger btn-circle'><i class='fas fa-trash'></i></button></td>
										</tr>
										<tr>
										<td><input type="hidden" value="2" name="stationSequence" /><span>2</span></td>
								        <td><input type="text" name="station" id='station2'  /></td>
										<td><input type="text" name="sequenceTime" id='sequenceTime2'/></td>
										<td align='center'><button type="button" id="btn_deltr" onclick="deltr()" class='btn btn-danger btn-circle'><i class='fas fa-trash'></i></button></td>
										</tr>
									</table>
									<div align='center'>
									<input type="button" id="btn_addtr" value="+增加車站" class='btn btn-info'>
									</div>
								</form>
                                <div>
								<div id = "tempinput" align='center'>
								<br>
								<button type='button' id='abutton' onclick="go()" class='btn btn-primary'>送出</button>
        						<button type='button' id='newnew' onclick="setKey()" class='btn btn-warning'>一鍵輸入</button>
        
								<a href='<c:url value='http://localhost:8081/routes/insertRoutes.controller' />' class='btn btn-primary'>取消</a>
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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
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
</html>
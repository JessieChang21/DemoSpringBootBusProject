<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
  
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

<title>Bus List</title>
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
    var indexPage=1;
    
 $(document).ready(function(){
// 	 var Ename = $('#Ename').val();
// 	 console.log(Ename=='Dog');
// 	 console.log(Ename);
// 	 console.log(typeof (Ename));
	   var tEx = $('#tEx').val();
// 	   var rank = $('#rankId').val();
// 	   console.log(rank);
// 	   console.log(rank==01);
	   $.when(load(tEx, indexPage))
	   .then(pageIn());
});
 

 function pageIn() {
	   var totalPages = $('#totalPages').val();
	   var totalElements = $('#totalElements').val();
	   console.log(totalPages);
	   console.log(totalElements);
	   $('#showpage').empty("");
	   var divpagetol = document.getElementById('dataTable_info');
	   var divpage = document.getElementById('showpage');
	   tr1 ="Total Pages:"+ totalPages +" "+ "Total Records:"+totalElements;
	   divpagetol.innerHTML =tr1;
	   tr2="<button id='myPage' class='btn btn-light' color='blue' value='pre' onclick='changepre()'>Previous</button>";
	   for(var i=1; i<=totalPages; i++){
		   tr2 += "<button id='myPage"+i+"' class='btn btn-light pages' color='blue' value='"+i+"' onclick='change("+i+")'>"+i+"</button>";
	   }
	   tr2+="<button id='myPage' class='btn btn-light' color='blue' value='next' onclick='changeNext()'>Next</button>";
	   
	   divpage.innerHTML =tr2;
	   var p ="myPage"+indexPage;
	   $(".pages").removeClass('btn-primary');
	   $(".pages").removeClass('btn-light');
	   $(".pages").addClass('btn-light');
	   $("#"+p).removeClass('btn-light');
	   $("#"+p).addClass('btn-primary');
 }
 
function change(page){
	var tEx = $('#tEx').val();
	 indexPage = page;
	 load(tEx, indexPage);
	   var p ="myPage"+indexPage;
	   $(".pages").removeClass('btn-primary');
	   $(".pages").removeClass('btn-light');
	   $(".pages").addClass('btn-light');
	   $("#"+p).removeClass('btn-light');
	   $("#"+p).addClass('btn-primary');
}


function changepre(){
	var tEx = $('#tEx').val();
	   if(indexPage>1){
	   indexPage = indexPage-1;
	   load(tEx, indexPage);
	   var p ="myPage"+indexPage;
	   $(".pages").removeClass('btn-primary');
	   $(".pages").removeClass('btn-light');
	   $(".pages").addClass('btn-light');
	   $("#"+p).removeClass('btn-light');
	   $("#"+p).addClass('btn-primary');}
}
function changeNext(){
	var tEx = $('#tEx').val();
	   if(indexPage<$('#totalPages').val()){
	   indexPage = indexPage+1;
	   load(tEx, indexPage);
	   var p ="myPage"+indexPage;
	   $(".pages").removeClass('btn-primary');
	   $(".pages").removeClass('btn-light');
	   $(".pages").addClass('btn-light');
	   $("#"+p).removeClass('btn-light');
	   $("#"+p).addClass('btn-primary');}
}


function load(tEx, indexPage){
	
	console.log(tEx);
	
	if(tEx==1){
		tEx="1&4&5";
		ajaxExc = $.ajax({
			   //送出要求
			   type:'post',
			   url:'/busTimes/TempBusTimeByThreeToExamine/' + tEx + '/' + indexPage,
			   dataType:'JSON',  //網頁預期從Server接收的資料型態
			   contentType:'application.json',  //網頁要送到Server的資料型態
			   async:false,
			   //以下為資料data送回來後要做的事
			   success: function(data){
				   
// 				   console.log('success:' + data);
// 				   var json = JSON.stringify(data,null,4);
// 				   console.log('json:' + json);
				   
				   $('#showroutes').empty("");
				   
				   if(data.list==null){
					   $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");;
				   }else{
					   var table = $('#showroutes');
					   table.append("<tr align='center' id='ptitle'><th>班次編號</th><th>路線編號</th><th>路線名稱</th><th>地區</th><th>起始站</th><th>終點站</th><th>發車時間</th>"+
							   "<th>總座位數</th><th>註記</th><th>申請者</th><th>申請類別</th><th></th><th></th></tr>");
					   
					   
					   $.each(data.list, function(i,n){
						   var Ename = $('#Ename').val();
						   if(i%2==0){
							   if(n.toExamine==1){
								   var stat = "新增";
								   var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
								            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
								            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
								            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
								            "<td>" + stat + "</td>" +
								            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
								            "<td><a href='<c:url value='/busTimes/tempBusExamine.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-danger check' >審查</a></td>"+ "</tr>";
								   table.append(tr);
							   } else if(n.toExamine==4){
								   var stat = "刪除";
									var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
							            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
							            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
							            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
							            "<td>" + stat + "</td>" +
							            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
							            "<td><a href='<c:url value='/busTimes/tempBusExamineDelete.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-danger check' >審查</a></td>"+ "</tr>";
							   		table.append(tr);
							   } else {
								   var stat = "變更";
								   var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
						            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
						            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
						            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
						            "<td>" + stat + "</td>" +
						            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
						            "<td><a href='<c:url value='/busTimes/tempBusExamineUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-danger check' >審查</a></td>"+ "</tr>";
						   			table.append(tr);
							   } 
						   } else {
							   if(n.toExamine==1){
								   var stat = "新增";
								   var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
								            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
								            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
								            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
								            "<td>" + stat + "</td>" +
								            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
								            "<td><a href='<c:url value='/busTimes/tempBusExamine.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-danger check' >審查</a></td>"+ "</tr>";
								   table.append(tr);
							   } else if(n.toExamine==4){
								   var stat = "刪除";
									var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
							            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
							            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
							            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
							            "<td>" + stat + "</td>" +
							            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
							            "<td><a href='<c:url value='/busTimes/tempBusExamineDelete.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-danger check' >審查</a></td>"+ "</tr>";
							   		table.append(tr);
							   } else {
								   var stat = "變更";
								   var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
						            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
						            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
						            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
						            "<td>" + stat + "</td>" +
						            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
						            "<td><a href='<c:url value='/busTimes/tempBusExamineUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-danger check' >審查</a></td>"+ "</tr>";
						   			table.append(tr);
							   } 
						   }
					   });
					   
		 			   var div = document.getElementById('tempinput');
		 			   div.innerHTML += "<input id='totalPages' type='hidden' value='"+data.tolpages+"'>"+
		 					   "<input id='totalElements' type='hidden' value='"+data.pageEles+"'>";
						
				   }
				   
				   var div = document.getElementById('chooseEx');
				   div.innerHTML = "";
	 			   div.innerHTML += "<a href='/busTimes/tempbustimemain.controller?tEx=9'  class='btn btn-info'>所有案件</a>"+
	 				   				"<a href='/busTimes/tempbustimemain.controller?tEx=2&42&52'  class='btn btn-primary'>待修改</a>"+
						 			"<a href='/busTimes/tempbustimemain.controller?tEx="+ "3&43&45"+"'  class='btn btn-success'>已通過</a>";
					var rank = $('#rankId').val();
					if(rank==01){
	 			    	$(".check").addClass('disabled');
	 			    } else {
	 			    	$(".write").addClass('disabled');
	 			    }
					
			   }
		
		 });
		
	} else if (tEx==2){
		tEx="2&42&52";
 ajaxExc = $.ajax({
	   //送出要求
	   type:'post',
	   url:'/busTimes/TempBusTimeByThreeToExamine/' + tEx + '/' + indexPage,
	   dataType:'JSON',  //網頁預期從Server接收的資料型態
	   contentType:'application.json',  //網頁要送到Server的資料型態
	   async:false,
	   //以下為資料data送回來後要做的事
	   success: function(data){
		   
		   console.log('success:' + data);
		   var json = JSON.stringify(data,null,4);
		   console.log('json:' + json);
		   
		   $('#showroutes').empty("");
		   
		   if(data.list==null){
			   $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");;
		   }else{
			   var table = $('#showroutes');
			   table.append("<tr align='center' id='ptitle'><th>班次編號</th><th>路線編號</th><th>路線名稱</th><th>地區</th><th>起始站</th><th>終點站</th><th>發車時間</th>"+
			   "<th>總座位數</th><th>註記</th><th>申請者</th><th>申請類別</th><th></th><th></th></tr>");
	   
	   
		   $.each(data.list, function(i,n){
	        	 var Ename = $('#Ename').val();
			   if(i%2==0){
				   if(n.toExamine==2){
					   var stat = "新增";
				   var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
				            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
				            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
				            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
				            "<td>" + stat + "</td>" +
				            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>";

				            if(Ename!=n.empolyeeName){
				            tr+="<td><a href='<c:url value='/busTimes/tempBusUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write disabled' >修改</a></td>"+ "</tr>";
				     } else {
				    	 tr+="<td><a href='<c:url value='/busTimes/tempBusUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write' >修改</a></td>"+ "</tr>";
				     }
				   table.append(tr);
				   } else if(n.toExamine==42){
					   var stat = "刪除";
					   var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
			            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
			            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
			            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
			            "<td>" + stat + "</td>" +
			            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>";

			            if(Ename!=n.empolyeeName){
				            tr+="<td><a href='<c:url value='/busTimes/tempBusUpdateDelete.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write disabled' >修改</a></td>"+ "</tr>";
				     	} else {
				    	 tr+="<td><a href='<c:url value='/busTimes/tempBusUpdateDelete.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write' >修改</a></td>"+ "</tr>";
				     	}
			   			table.append(tr);
				   } else {
					   var stat = "變更";
					   var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
			            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
			            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
			            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
			            "<td>" + stat + "</td>" +
			            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>";
					   if(Ename!=n.empolyeeName){
				            tr+="<td><a href='<c:url value='/busTimes/tempBusUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write disabled' >修改</a></td>"+ "</tr>";
				     } else {
				    	 tr+="<td><a href='<c:url value='/busTimes/tempBusUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write' >修改</a></td>"+ "</tr>";
				     }
			            table.append(tr);
				   }
			   } else{
				   if(n.toExamine==2){
					   var stat = "新增";
				   var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
				            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
				            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
				            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
				            "<td>" + stat + "</td>" +
				            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>";
				   if(Ename!=n.empolyeeName){
			            tr+="<td><a href='<c:url value='/busTimes/tempBusUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write disabled' >修改</a></td>"+ "</tr>";
			     } else {
			    	 tr+="<td><a href='<c:url value='/busTimes/tempBusUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write' >修改</a></td>"+ "</tr>";
			     }
				   table.append(tr);
				   } else if(n.toExamine==42){
					   var stat = "刪除";
					   var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
			            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
			            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
			            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
			            "<td>" + stat + "</td>" +
			            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>";
			            if(Ename!=n.empolyeeName){
				            tr+="<td><a href='<c:url value='/busTimes/tempBusUpdateDelete.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write disabled' >修改</a></td>"+ "</tr>";
					     } else {
					    	 tr+="<td><a href='<c:url value='/busTimes/tempBusUpdateDelete.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write' >修改</a></td>"+ "</tr>";
					     }
			            table.append(tr);
				   } else {
					   var stat = "變更";
					   var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
			            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
			            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
			            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
			            "<td>" + stat + "</td>" +
			            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>";
			            if(Ename!=n.empolyeeName){
				            tr+="<td><a href='<c:url value='/busTimes/tempBusUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write disabled' >修改</a></td>"+ "</tr>";
					     } else {
					    	 tr+="<td><a href='<c:url value='/busTimes/tempBusUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write' >修改</a></td>"+ "</tr>";
					     }
			   			table.append(tr);
				   }
			   }
		   });
			   var div = document.getElementById('tempinput');
			   div.innerHTML += "<input id='totalPages' type='hidden' value='"+data.tolpages+"'>"+
					   "<input id='totalElements' type='hidden' value='"+data.pageEles+"'>";
				
		   }
		   
		   var div = document.getElementById('chooseEx');
		   div.innerHTML = "";
			   div.innerHTML += "<a href='/busTimes/tempbustimemain.controller?tEx=9'  class='btn btn-info'>所有申請</a>"+
				 			"<a href='/busTimes/tempbustimemain.controller?tEx="+"1&4&5"+"'  class='btn btn-danger' >審查中</a>"+
				 			"<a href='/busTimes/tempbustimemain.controller?tEx="+"3&43&53"+"'  class='btn btn-success'>已通過</a>";
				 var rank = $('#rankId').val();
				 if(rank==01){
			    	$(".check").addClass('disabled');
			    } else {
			    	$(".write").addClass('disabled');
			    }
	   }
 });
	}  else if (tEx==3){
		tEx="3&43&53";
		 ajaxExc = $.ajax({
			   //送出要求
			   type:'post',
			   url:'/busTimes/TempBusTimeByThreeToExamine/' + tEx + '/' + indexPage,
			   dataType:'JSON',  //網頁預期從Server接收的資料型態
			   contentType:'application.json',  //網頁要送到Server的資料型態
			   async:false,
			   //以下為資料data送回來後要做的事
			   success: function(data){
				   
				   console.log('success:' + data);
				   var json = JSON.stringify(data,null,4);
				   console.log('json:' + json);
				   
				   $('#showroutes').empty("");
				   
				   if(data.list==null){
					   $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");;
				   }else{
					   var table = $('#showroutes');
					   table.append("<tr align='center' id='ptitle'><th>班次編號</th><th>路線編號</th><th>路線名稱</th><th>地區</th><th>起始站</th><th>終點站</th><th>發車時間</th>"+
					   "<th>總座位數</th><th>註記</th><th>申請者</th><th>申請類別</th><th></th><th></th></tr>");
			   
			   
				   $.each(data.list, function(i,n){
					   var Ename = $('#Ename').val();
					   if(n.toExamine==3){
						   var stat = "新增";
					   } else if(n.toExamine==43){
						   var stat = "刪除";
					   } else {
						   var stat = "變更";
					   }
					   if(i%2==0){
						   var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
						            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
						            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
						            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
						            "<td>" + stat + "</td>" +
						            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
						            "<td><p class='btn btn-success active'>已通過</p></td>"+ "</tr>";
						   table.append(tr);
					   } else {
						   var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
				            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
				            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
				            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
				            "<td>" + stat + "</td>" +
				            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
				            "<td><p class='btn btn-success active'>已通過</p></td>"+ "</tr>";
				   			table.append(tr);
					   }
				   });
		 			   var div = document.getElementById('tempinput');
		 			   div.innerHTML += "<input id='totalPages' type='hidden' value='"+data.tolpages+"'>"+
		 					   "<input id='totalElements' type='hidden' value='"+data.pageEles+"'>";
						
				   }
				   
				   var div = document.getElementById('chooseEx');
				   div.innerHTML = "";
					   div.innerHTML += "<a href='/busTimes/tempbustimemain.controller?tEx=9'  class='btn btn-info'>所有申請</a>"+
							  		"<a href='/busTimes/tempbustimemain.controller?tEx=2&42&52'  class='btn btn-primary'>待修改</a>"+
						 			"<a href='/busTimes/tempbustimemain.controller?tEx="+"1&4&5"+"'  class='btn btn-danger'>審查中</a>";
						 			var rank = $('#rankId').val();
						 			if(rank==01){
								    	$(".check").addClass('disabled');
								    } else {
								    	$(".write").addClass('disabled');
								    }
					   
			   }
		 });
			} else {
		ajaxExc = $.ajax({
			   //送出要求
			   type:'post',
			   url:'/busTimes/tempBustimeByPage/' + indexPage,
			   dataType:'JSON',  //網頁預期從Server接收的資料型態
			   contentType:'application.json',  //網頁要送到Server的資料型態
			   async:false,
			   //以下為資料data送回來後要做的事
			   success: function(data){
				   
				   console.log('success:' + data);
				   var json = JSON.stringify(data,null,4);
				   console.log('json:' + json);
				   
				   $('#showroutes').empty("");
				   
				   if(data.list==null){
					   $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");;
				   }else{
					   var table = $('#showroutes');
					   table.append("<tr align='center' id='ptitle'><th>班次編號</th><th>路線編號</th><th>路線名稱</th><th>地區</th><th>起始站</th><th>終點站</th><th>發車時間</th>"+
							   "<th>總座位數</th><th>註記</th><th>申請者</th><th>申請類別</th><th></th><th></th></tr>");
					   
					   
					   $.each(data.list, function(i,n){
						   var Ename = $('#Ename').val();
						   if(i%2==0){
							   if (n.toExamine==2||n.toExamine==42||n.toExamine==52){
								   if(n.toExamine==2){
									   var stat = "新增";
									   var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
									            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
									            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
									            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
									            "<td>" + stat + "</td>" +
									            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>";
									            if(Ename!=n.empolyeeName){
										            tr+="<td><a href='<c:url value='/busTimes/tempBusUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write disabled' >修改</a></td>"+ "</tr>";
											     } else {
											    	 tr+="<td><a href='<c:url value='/busTimes/tempBusUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write' >修改</a></td>"+ "</tr>";
											     }
									   table.append(tr);
									   } else if(n.toExamine==42){
										   var stat = "刪除";
										   var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
								            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
								            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
								            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
								            "<td>" + stat + "</td>" +
								            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>";
								            if(Ename!=n.empolyeeName){
									            tr+="<td><a href='<c:url value='/busTimes/tempBusUpdateDelete.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write disabled' >修改</a></td>"+ "</tr>";
										     } else {
										    	 tr+="<td><a href='<c:url value='/busTimes/tempBusUpdateDelete.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write' >修改</a></td>"+ "</tr>";
										     }
								   			table.append(tr);
									   } else {
										   var stat = "變更";
										   var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
								            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
								            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
								            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
								            "<td>" + stat + "</td>" +
								            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>";
								            if(Ename!=n.empolyeeName){
									            tr+="<td><a href='<c:url value='/busTimes/tempBusUpdateUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write disabled' >修改</a></td>"+ "</tr>";
										     } else {
										    	 tr+="<td><a href='<c:url value='/busTimes/tempBusUpdateUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write' >修改</a></td>"+ "</tr>";
										     }
								   			table.append(tr);
									   }
							   	} else if(n.toExamine==1||n.toExamine==4||n.toExamine==5){
							   		if(n.toExamine==1){
							   			var stat = "新增";
										   var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
										            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
										            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
										            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
										            "<td>" + stat + "</td>" +
										            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
										            "<td><a href='<c:url value='/busTimes/tempBusExamine.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-danger check' >審查</a></td>"+ "</tr>";
										   table.append(tr);
									   } else if(n.toExamine==4){
										   var stat = "刪除";
											var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
									            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
									            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
									            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
									            "<td>" + stat + "</td>" +
									            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
									            "<td><a href='<c:url value='/busTimes/tempBusExamineDelete.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-danger check' >審查</a></td>"+ "</tr>";
									   		table.append(tr);
									   } else {
										   var stat = "變更";
										   var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
								            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
								            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
								            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
								            "<td>" + stat + "</td>" +
								            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
								            "<td><a href='<c:url value='/busTimes/tempBusExamineUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-danger check' >審查</a></td>"+ "</tr>";
								   			table.append(tr);
									   }	
							   	} else if(n.toExamine==0){
							   		var stat = "撤回";
							   		var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
						            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
						            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
						            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
						            "<td>" + stat + "</td>" +
						            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
						            "<td><p class='btn btn-warning'>已撤回</p></td>"+ "</tr>";
					   				table.append(tr);	
							   	}else {
							   		if(n.toExamine==3){
										   var stat = "新增";
									   } else if(n.toExamine==43){
										   var stat = "刪除";
									   } else {
										   var stat = "變更";
									   }
							   		var tr = "<tr align='center' class='even'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
						            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
						            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
						            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
						            "<td>" + stat + "</td>" +
						            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
						            "<td><p class='btn btn-success active'>已通過</p></td>"+ "</tr>";
					   				table.append(tr);	
							   	}
						   } else {
							   if (n.toExamine==2||n.toExamine==42||n.toExamine==52){
								   if(n.toExamine==2){
									   var stat = "新增";
									   var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
									            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
									            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
									            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
									            "<td>" + stat + "</td>" +
									            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>";
									            if(Ename!=n.empolyeeName){
										            tr+="<td><a href='<c:url value='/busTimes/tempBusUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write disabled' >修改</a></td>"+ "</tr>";
											     } else {
											    	 tr+="<td><a href='<c:url value='/busTimes/tempBusUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write' >修改</a></td>"+ "</tr>";
											     }
									   table.append(tr);
									   } else if(n.toExamine==42){
										   var stat = "刪除";
										   var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
								            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
								            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
								            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
								            "<td>" + stat + "</td>" +
								            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>";
								            if(Ename!=n.empolyeeName){
									            tr+="<td><a href='<c:url value='/busTimes/tempBusUpdateDelete.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write disabled' >修改</a></td>"+ "</tr>";
										     } else {
										    	 tr+="<td><a href='<c:url value='/busTimes/tempBusUpdateDelete.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write' >修改</a></td>"+ "</tr>";
										     }
								   			table.append(tr);
									   } else {
										   var stat = "變更";
										   var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
								            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
								            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
								            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
								            "<td>" + stat + "</td>" +
								            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>";
								            if(Ename!=n.empolyeeName){
									            tr+="<td><a href='<c:url value='/busTimes/tempBusUpdateUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write disabled' >修改</a></td>"+ "</tr>";
										     } else {
										    	 tr+="<td><a href='<c:url value='/busTimes/tempBusUpdateUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-primary write' >修改</a></td>"+ "</tr>";
										     }
								   			table.append(tr);
									   }
							   	} else if(n.toExamine==1||n.toExamine==4||n.toExamine==5){
							   		if(n.toExamine==1){
							   			var stat = "新增";
										   var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
										            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
										            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
										            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
										            "<td>" + stat + "</td>" +
										            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
										            "<td><a href='<c:url value='/busTimes/tempBusExamine.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-danger check' >審查</a></td>"+ "</tr>";
										   table.append(tr);
									   } else if(n.toExamine==4){
										   var stat = "刪除";
											var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
									            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
									            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
									            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
									            "<td>" + stat + "</td>" +
									            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
									            "<td><a href='<c:url value='/busTimes/tempBusExamineDelete.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-danger check' >審查</a></td>"+ "</tr>";
									   		table.append(tr);
									   } else {
										   var stat = "變更";
										   var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
								            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
								            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
								            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
								            "<td>" + stat + "</td>" +
								            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
								            "<td><a href='<c:url value='/busTimes/tempBusExamineUpdate.controller?tbNo="+ n.testBusNumber +"' />' class='btn btn-danger check' >審查</a></td>"+ "</tr>";
								   			table.append(tr);
									   }	
							   	} else if(n.toExamine==0){
							   		var stat = "撤回";
							   		var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
						            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
						            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
						            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
						            "<td>" + stat + "</td>" +
						            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
						            "<td><p class='btn btn-warning'>已撤回</p></td>"+ "</tr>";
					   				table.append(tr);	
							   	}else {
							   		if(n.toExamine==3){
										   var stat = "新增";
									   } else if(n.toExamine==43){
										   var stat = "刪除";
									   } else {
										   var stat = "變更";
									   }
							   		var tr = "<tr align='center' class='odd'>"+ "<td>"+ n.testBusNumber + "</td>"  + "<td>" + n.routeId + "</td>" +
						            "<td>" + n.tripName + "</td>" + "<td>" + n.area + "</td>" + "<td>" + n.initialStation + "</td>"+
						            "<td>" + n.finalStation + "</td>" + "<td>" + n.initialTime + "</td>" + "<td>" + n.totalSeats + "</td>"+
						            "<td>" + n.note + "</td>"+"<td>" + n.empolyeeName + "</td>"+
						            "<td>" + stat + "</td>" +
						            "<td><a href='<c:url value='/busTimes/findTempbustimeDetailShow.controller?testBusNumber="+ n.testBusNumber +"' />' class='btn btn-primary'>檢視</a></td>"+
						            "<td><p class='btn btn-success active'>已通過</p></td>"+ "</tr>";
					   				table.append(tr);	
							   	}
						   }
					   
					   });
					   
		 			   var div = document.getElementById('tempinput');
		 			   div.innerHTML += "<input id='totalPages' type='hidden' value='"+data.tolpages+"'>"+
		 					   "<input id='totalElements' type='hidden' value='"+data.pageEles+"'>";
						
				   }
				   
				   var div = document.getElementById('chooseEx');
				   div.innerHTML = "";
	 			   div.innerHTML += "<a href='/busTimes/tempbustimemain.controller?tEx=2&42&52'  class='btn btn-primary'>待修改</a>"+
						 			"<a href='/busTimes/tempbustimemain.controller?tEx=1&4&5'  class='btn btn-danger'>審查中</a>"+
						 			"<a href='/busTimes/tempbustimemain.controller?tEx=3&43&53'  class='btn btn-success'>已通過</a>";
						 			var rank = $('#rankId').val();
						 			if(rank==01){
						 			    	$(".check").addClass('disabled');
						 			    } else {
						 			    	$(".write").addClass('disabled');
						 			    }
						 			
			   }
		
		 });
		
	}
 
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
                    <h1 class="h3 mb-2 text-gray-800">申請案件列表</h1>
                    
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">
									<div class="btn-group" id = "chooseEx"></div>
                                	
                            </h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="showroutes" width="100%" cellspacing="0">
                                    
                                </table>
                                <div>
                                	<div>
                                		<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
                                		</div>
                                	</div>
                                	<div align='right'>
                                	<div class="btn-group" id="showpage"></div>
                                	</div>
                                		
								<div id = "tempinput">
									<input id="tEx" type="hidden" value="${tEx}">
									<input id="rankId" type="hidden" value="${employee.rankId}">
									<input id="Ename" type="hidden" value="${employee.employeeName}">
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
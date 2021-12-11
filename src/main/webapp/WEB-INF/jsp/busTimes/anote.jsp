<body>
<h3>申請變更班次</h3>
<form:form action="toChangeBus.controller" method="post" modelAttribute="tempBus">
   <table>
      <tr>
         <td><form:label path="testBusNumber">申請編號:</form:label></td>
         <td><form:hidden path="testBusNumber"/>${tempBus.testBusNumber}</td>
      </tr>
      <tr>
         <td><form:label path="routeId">路線編號:</form:label></td>
         <td><form:hidden path="routeId"/>${tempBus.routeId}</td>
      </tr>
      <tr>
         <td><form:label path="tripName">路線名稱:</form:label></td>
         <td><form:hidden path="tripName"/>${tempBus.tripName}</td>
      </tr>
      <tr>
         <td><form:label path="area">地區:</form:label></td>
         <td><form:hidden path="area"/>${tempBus.area}</td>
      </tr>
      <tr>
        <td><form:label path="initialTime">發車時間:</form:label></td>
        <td id="initialTimech"><input id='initialTimeBefore' type='hidden' value='${tempBus.initialTime}'>
		<select id = "idSelectHour"></select>:
        <select id = "idSelectMin"></select>
        <span id="timeError" style='color:red; font-size:8px;'><input type='hidden' name='initialTime' value='${tempBus.initialTime}'/>${errors.initialTimeE}</span>
        </td>
     </tr>
      <tr>
         <td><form:label path="totalSeats">總座位數:</form:label></td>
         <td><form:input path="totalSeats"/></td>
      </tr>
      <tr>
         <td><form:label path="note">班次備註:</form:label></td>
         <td><form:textarea path = "note" rows = "3" cols = "30" /></td>
      </tr>
      <tr>
         <td><form:label path="note">運行日:</form:label></td>
         <td><form:checkbox path="sunday" value="1"/>星期日  <form:checkbox path="monday" value="1"/>星期一  
         <form:checkbox path="tuesday" value="1"/>星期二  <form:checkbox path="wednesday" value="1"/>星期三  
         <form:checkbox path="thursday" value="1"/>星期四  <form:checkbox path="friday" value="1"/>星期五  
         <form:checkbox path="saturday" value="1"/>星期六</td>
      </tr>
      <tr>
         <td><label>審查員:</label>
         <form:hidden path="managerName"/></td>
         <td>${tempBus.managerName} </td>
      </tr>
      
      <tr>
         <td><label>審查評語:</label>
         <form:hidden path="examineNote" rows = "5" cols = "30"/></td>
         <td>${tempBus.examineNote} </td>
      </tr>
      <tr>
         <td><form:label path="empolyeeName">申請者:</form:label></td>
         <td><form:hidden path="empolyeeName"/>${tempBus.empolyeeName}</td>
      </tr>
      <tr>
         <td><form:label path="toExamineNote">申請說明:</form:label></td>
         <td><form:textarea path="toExamineNote" rows = "5" cols = "30"/></td>
      </tr>
      
      <tr align='center'>
      	 <td colspan="2">
      	 <input type="submit"  name="update" value="申請變更" class="btn btn-primary" onclick="return(confirm('是否確認要送出變更申請？'))">
      	 &emsp;&emsp;&emsp;
      	 <input type="submit"  name="noWant" value="撤回申請" class="btn btn-warning" onclick="return(confirm('是否確認要撤回申請？'))"></td>
      </tr>
   </table>
</form:form>
<div>

<a href="<c:url value='http://localhost:8081/busTimes/tempbustimemain.controller?tEx=9' />" class='btn btn-primary'>回上一頁</a>
</div>

</body>
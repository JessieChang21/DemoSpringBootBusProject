<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>地圖查詢</title>
<!-- 暫時測試用 -->
<style>
#imgMap {
	float: right;
}
</style>
</head>
<body>
	<script src="/webjars/jquery/3.1.1/jquery.min.js"></script>
	<div id="queryMap"></div>

	<div id="outsidemap">
		<!-- 測試form在div內用 -->

		<!-- 地圖查詢 -->
		<div class="tab-pane fade" id="map" role="tabpanel"
			aria-labelledby="map-tab">
			<br>
			<h5 style="font-weight: bold;">-路線選擇-</h5>
			<p>(請點選左側圖示)</p>
			<form action="bookTicketByTripName.controller" method="POST">
				<div id="selectInit" class="query1">
					<span> <select class="form-select" id="initCity">
							<option selected disabled="disabled">縣市</option>
					</select>
					</span>
					<div id="showbtn"></div>
					<div id="showtext" class="primary-btn text-uppercase">暫無資料</div>
				</div>
			</form>
		</div>

	</div>

	<script>
	// 顯示地圖
//     $("#route-tab, #station-tab").on("click", function () {
//       $("#queryMap>img").remove();
//       $("#leftslogn").empty().append(`<h6 class="text-white">Away from monotonous life</h6>
//                               <h1 class="text-white">Getting around Taiwan</h1>
//                               <p class="text-white">
//                                   Getting around in Taiwan can be ultra-convenient with our bus.
//                               </p>
//                               <p class="primary-btn text-uppercase">Get Started</p>`);
//       $("#leftslogn").addClass("leftslogn");
//       $("#queryMap").removeClass("addMap");
//     })

//     $("#map-tab").on("click", function () {
//       $("#leftslogn").empty();
//       $("#leftslogn").removeClass("leftslogn");
      $("#queryMap").empty().append(`
                    <img id="imgMap" alt="" src="images/queryRoutes/map00.png" usemap="#image-map" />
                    <map id="FPMap0" name="image-map">
                    
                    <area id="idKeelung" class="imgbut" value="基隆市" coords="242,23,251,25,248,32,242,33,236,26" shape="poly">
                    
                    <area id="idTaipei" class="imgbut" value="臺北市" coords="224,20,214,28,218,43,227,48,233,39,228,26"
                        shape="poly">
                    
                    <area id="idNewTaipei" class="imgbut" value="新北市"
                        coords="239,21,230,24,226,15,212,28,219,35,218,40,223,46,210,64,201,61,201,49,208,39,197,26,210,19,219,9,229,9"
                        shape="poly">
                    <area id="idNewTaipei" class="imgbut" value="新北市"
                        coords="236,33,250,37,252,30,262,29,265,35,273,44,261,47,257,53,250,58,239,65,229,73,219,81,211,73,211,63,223,46,231,49,236,41"
                        shape="poly">
                    
                    <area id="idTaoyuan" class="imgbut" value="桃園市"
                        coords="190,30,203,41,196,45,196,55,198,63,208,67,212,85,206,93,199,79,187,66,178,57,168,48,168,39"
                        shape="poly">
                    
                    <area id="idHsinchuCou" class="imgbut" value="新竹縣"
                        coords="161,54,172,58,177,63,186,69,192,78,198,86,207,99,200,107,194,114,185,103,172,105,168,91,155,79,164,74,157,63"
                        shape="poly">
                    
                    <area id="idHsinchu" class="imgbut" value="新竹市" coords="150,73,158,69,150,64" shape="poly">
                    
                    <area id="idMiaolicou" class="imgbut" value="苗栗縣"
                        coords="146,80,141,85,132,89,129,97,125,106,118,112,124,120,133,128,141,131,148,129,156,126,164,128,174,125,185,119,191,115,182,107,168,104,165,93,153,81"
                        shape="poly">
                    
                    <area id="idTaichung" class="imgbut" value="臺中市"
                        coords="116,117,100,143,106,153,115,155,118,162,128,169,133,165,141,155,152,154,161,150,172,144,187,139,197,139,203,133,208,126,198,120,189,117,180,125,172,128,167,133,154,127,150,134,137,133"
                        shape="poly">
                    
                    <area id="idChanghuacou" class="imgbut" value="彰化縣"
                        coords="95,146,86,165,79,180,72,186,79,190,90,190,107,195,116,195,115,183,113,166,103,151" shape="poly">
                    
                    <area id="idNantoucou" class="imgbut" value="南投縣"
                        coords="120,171,117,185,121,191,122,198,120,210,122,216,131,218,139,221,141,233,161,238,167,232,173,230,175,222,185,218,183,201,191,180,191,169,195,157,193,146,198,143,178,146,166,155,154,161,143,160,138,170"
                        shape="poly">
                    
                    <area id="idYunlincou" class="imgbut" value="雲林縣"
                        coords="71,192,90,194,115,199,116,216,108,218,96,215,87,218,76,226,65,230,63,219,65,201,61,208"
                        shape="poly">
                    
                    <area id="idChiayi" class="imgbut" value="嘉義市" coords="97,238,92,234,103,235" shape="poly">
                    
                    <area id="idChiayicou" class="imgbut" value="嘉義縣"
                        coords="62,235,62,243,59,251,66,257,79,247,92,244,87,235,92,220,75,232" shape="poly">
                    <area id="idChiayicou" class="imgbut" value="嘉義縣"
                        coords="93,219,104,219,110,225,125,224,132,222,138,225,137,235,147,240,139,245,131,253,122,258,116,264,109,267,106,249,92,244,100,239,104,233,89,232"
                        shape="poly">
                    
                    <area id="idTainan" class="imgbut" value="臺南市"
                        coords="57,259,47,288,59,296,64,306,79,306,90,306,104,290,116,272,103,269,103,255,94,246,79,249,71,260"
                        shape="poly">
                    
                    <area id="idKaohsiung" class="imgbut" value="高雄市"
                        coords="65,309,74,330,74,342,77,350,91,364,91,348,96,322,106,317,116,312,132,313,139,311,140,298,145,280,150,264,162,257,159,244,149,242,138,254,124,262,122,270,116,281,109,289,99,299,91,308,81,310"
                        shape="poly">
                    
                    <area id="idPingtungcou" class="imgbut" value="屏東縣"
                        coords="96,364,95,352,95,334,100,323,112,316,122,316,132,319,141,317,147,324,143,334,130,342,127,355,131,369,131,380,132,388,138,397,146,398,147,417,143,423,140,428,129,431,125,419,126,409,122,396,111,379,100,372"
                        shape="poly">
                    
                    <area id="idYilancou" class="imgbut" value="宜蘭縣"
                        coords="202,118,213,122,225,128,235,124,248,128,254,111,260,104,258,93,255,77,254,65,259,55,247,60,234,70,229,75,231,83,219,88,211,94,210,105,207,109"
                        shape="poly">
                    
                    <area id="idHualiencou" class="imgbut" value="花蓮縣"
                        coords="215,128,232,128,245,130,244,140,236,146,238,152,232,159,233,169,231,177,228,184,225,203,221,224,217,239,207,243,206,251,202,259,198,272,194,281,181,272,169,263,166,253,168,239,175,234,180,231,186,225,191,217,189,205,193,193,194,179,195,168,200,160,196,150,202,144,211,135"
                        shape="poly">
                    
                    <area id="idTaitungcou" class="imgbut" value="臺東縣"
                        coords="147,392,154,365,159,345,165,338,179,325,183,317,188,315,200,292,206,284,208,268,216,252,210,246,205,259,202,273,193,288,187,283,175,274,168,264,157,264,151,271,148,285,145,298,143,303,146,315,150,329,146,335,134,342,132,350,134,368,135,377,140,384"
                        shape="poly">
                </map>`);

//       $("#queryMap").addClass("addMap");
//    })
// {END OF DEMO01.html}

// {queryMap2.html}
	var areaArr = new Array();
 	areaArr = ["基隆市","臺北市","新北市","桃園市","新竹縣","新竹市","苗栗縣","臺中市","彰化縣","南投縣","雲林縣","嘉義市","嘉義縣","臺南市","高雄市","屏東縣","宜蘭縣","花蓮縣","臺東縣"];
    for(let i = 0; i < areaArr.length; i++) {
        $("#initCity").append(`<option value="` + areaArr[i] + `">` + areaArr[i] + `</option>`);
    }
    
	// 地圖變 選單變
	var selectname;
	var areaArrempty = new Array();
	areaArrempty = ["基隆市","新竹縣","新竹市","苗栗縣","臺中市","彰化縣","南投縣","高雄市","屏東縣","臺東縣"];
	
	
	$(".imgbut").on("click",function(){
		document.images[0].src = "images/queryRoutes/map" + this.id.substr(2) + ".png";
        selectname = $(this).attr('value');
        $("#initCity").val(selectname);
        
        $("#showtext").html(" ");
        for(let i = 0; i < areaArrempty.length; i++){
        	if( selectname == areaArrempty[i] ){
        		$("#showtext").html("暫無資料");
        	}
        }
        
        
        $("#showbtn").empty();
        $.ajax({
				url : "/queryRoutes",
				type : "GET",
				dataType : 'JSON',
				contectType : 'application.json',
				success : function(data) {
					var str = JSON.stringify(data);
					var json = JSON.parse(str);
					
					for (let i = 0; i < json.length; i++) {
						if(json[i].area == selectname && json[i].direction == 0){
							$("#showbtn").append(`<button type="submit" name="tripname" value="`+ json[i].tripname +`">` + json[i].tripname  + `</botton>`);
						} 
					}
					
					
				}
			})
        
        
	});
	
    // 選單變 地圖變
    $("#initCity").on("change",function(){
        selectname = $(this).val();
        
        $("#showtext").html(" ");
        for(let i = 0; i < areaArrempty.length; i++){
        	if(selectname == areaArrempty[i] ){
        		$("#showtext").html("暫無資料");
        	}
        }
        
 		$("#showbtn").empty();
        
        $.ajax({
				url : "/queryRoutes",
				type : "GET",
				dataType : 'JSON',
				contectType : 'application.json',
				success : function(data) {
					var str = JSON.stringify(data);
					var json = JSON.parse(str);
					
					
					for (let i = 0; i < json.length; i++) {
						if(json[i].area == selectname && json[i].direction == 0){
							$("#showbtn").append(`<button class="primary-btn text-uppercase" type="submit" name="tripname" value="`+ json[i].tripname +`">` + json[i].tripname  + `</botton>`);
						} 
					}
					
					
				}
			})
        
        var changename;
        switch(selectname){
            case "基隆市": changename = "Keelung"; break;
            case "臺北市": changename = "Taipei"; break;
            case "新北市": changename = "NewTaipei"; break;
            case "桃園市": changename = "Taoyuan"; break;
            case "新竹縣": changename = "HsinchuCou"; break;
            case "新竹市": changename = "Hsinchu"; break;
            case "苗栗縣": changename = "Miaolicou"; break;
            case "臺中市": changename = "Taichung"; break;
            case "彰化縣": changename = "Changhuacou"; break;
            case "南投縣": changename = "Nantoucou"; break;
            case "雲林縣": changename = "Yunlincou"; break;
            case "嘉義市": changename = "Chiayi"; break;
            case "嘉義縣": changename = "Chiayicou"; break;
            case "臺南市": changename = "Tainan"; break;
            case "高雄市": changename = "Kaohsiung"; break;
            case "屏東縣": changename = "Pingtungcou"; break;
            case "宜蘭縣": changename = "Yilancou"; break;
            case "花蓮縣": changename = "Hualiencou"; break;
            case "臺東縣": changename = "Taitungcou"; break;
        }
        document.images[0].src = "images/queryRoutes/map" + changename + ".png";
        
        
        
       
    })
	
	
	</script>



	<br>
	<a href="<c:url value='/index'/>">回首頁</a>
</body>
</html>
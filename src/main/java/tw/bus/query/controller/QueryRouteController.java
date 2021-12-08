package tw.bus.query.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.bus.query.model.RouteInfoMap;
import tw.bus.query.model.RouteInfoMapService;
import tw.bus.query.model.RoutesWithStation;
import tw.bus.query.model.RoutesWithStationService;
import tw.bus.query.model.Totalbus2;
import tw.bus.query.model.Totalbus2Service;
import tw.bus.ticket.model.ByTripname;

@Controller
public class QueryRouteController {
	ObjectMapper mapper = new ObjectMapper();

	private RoutesWithStationService rService;
	private RouteInfoMapService rInfoMapService;
	private Totalbus2Service totalService;

	@Autowired
	public QueryRouteController(RoutesWithStationService rService, RouteInfoMapService rInfoMapService,
			Totalbus2Service totalService) {
		this.rService = rService;
		this.rInfoMapService = rInfoMapService;
		this.totalService = totalService;
	}
	
	// 1. 起迄站查詢

	// 2. 站名關鍵字查詢
	@GetMapping(path = "/queryRouteByKeyword")
	public String processMainPageAction3() {
		return "/queryAndBookTicket/queryRouteByKeyword";
	}

	@GetMapping("/autocomplete")
	@ResponseBody
	public List<String> autoName(@RequestParam(value = "term", required = false, defaultValue = "") String term) {
		List<String> station = rInfoMapService.getStation(term);
		return station;
	}

	@GetMapping("/queryTripNameByStation")
	@ResponseBody
	public List<RouteInfoMap> processqueryTripNameByStation() {
		return rInfoMapService.findAll();
	}

	// 關鍵字查詢=>查詢車次
	@PostMapping(path = "/queryRoutesByTripname.controller")
	public String processQueryAction(@RequestParam("inputform") String inputdata, Model m)
			throws JsonParseException, JsonMappingException, IOException, ParseException {

		// 轉為java物件(全部為string)
		ByTripname inputdataObj = mapper.readValue(inputdata, ByTripname.class);
//		userinput = ByTripname [tripname=北投竹子湖線, traveldate=2021/12/06, weekday=Monday, initialtime=10:23:23, adult=2, children=0]


		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		int qtyall = inputdataObj.getAdult() + inputdataObj.getChildren();
		if (qtyall < 1) {
			errors.put("qtyerr", "輸入人數錯誤");
			return "/queryAndBookTicket/queryRouteByKeyword";
		}

		List<Totalbus2> result = totalService.queryRoutesByTripname(inputdataObj.getTripname(), inputdataObj.getWeekday(),
				inputdataObj.getInitialtime(), inputdataObj.getAdult(), inputdataObj.getChildren());

		// 分順向 逆向
		List<Totalbus2> result0 = new ArrayList<Totalbus2>();
		List<Totalbus2> result1 = new ArrayList<Totalbus2>();
		for (Totalbus2 bean : result) {
			if (bean.getDirection() == 0) {
				result0.add(bean);
			} else if (bean.getDirection() == 1) {
				result1.add(bean);
			}
		}
		
		m.addAttribute("inputdataObj", inputdataObj);
		m.addAttribute("result", result);
		m.addAttribute("byTripnameResult0", result0);
		m.addAttribute("byTripnameResult1", result1);
		return "/queryAndBookTicket/queryRouteByKeyword2";
	}

	// 3. 導向地圖查詢，之後要導到全部導到首頁
	@GetMapping(path = "/queryRouteByMap")
	public String processMainPageAction4() {
		return "/queryAndBookTicket/queryRouteByMap";
	}

	// 3. 地圖查詢
	@GetMapping("/queryRoutes")
	@ResponseBody
	public List<RoutesWithStation> processMainMap() {
		return rService.findAll();
	}

//	@PostMapping(path = "/queryRoute.controller")
//	public String processAction(@RequestParam("initStation") String initStation, @RequestParam("finalStation") String finalStation, Model m) {
//		Map<String, String> errors = new HashMap<String, String>();
//		m.addAttribute("errors", errors);
//		
//		
//		initStation = initStation.substring(4);
//		finalStation = finalStation.substring(4);
//		
//		if (initStation == null || initStation.equals("請選擇...")) {
//			errors.put("initStation", "請選擇起站");
//		}
//
//		if (finalStation == null || finalStation.equals("請選擇...")) {
//			errors.put("finalStation", "請選擇訖站");
//		}
//		
//		if(initStation.equals(finalStation) && !initStation.equals("請選擇...") && !finalStation.equals("請選擇...")) {
//			errors.put("sameStation", "起訖站相同，請重新選擇");
//		}
//
//		if (errors != null && !errors.isEmpty()) {
//			return "/queryAndBookTicket/queryRoute";
//		}
//		
//		List<tw.bus.query.model.Routes> searchInitStation = rService.findByStation(initStation);
//		
//		List<tw.bus.query.model.Routes> searchFinalStation = rService.findByStation(finalStation);
//		
//		List<String> allRouteId = new ArrayList<String>();
//		List<Totalbus> resultTotalBus = new ArrayList<Totalbus>();
//		List<Totalbus> result = new ArrayList<Totalbus>();
//		
//		for(tw.bus.query.model.Routes initBean : searchInitStation) {
//			for(tw.bus.query.model.Routes finalBean : searchFinalStation) {
//				String initRouteId =initBean.getRouteId();
//				String finalRouteId = finalBean.getRouteId();
//				if(initRouteId.equals(finalRouteId)) {
//					System.out.println("initRouteId = " + initRouteId);
//					allRouteId.add(initRouteId);
//				}
//			}
//		}		
//		
//		if(!allRouteId.isEmpty()) {
//			m.addAttribute("initStation", initStation);
//			m.addAttribute("finalStation", finalStation);
//			m.addAttribute("routeId",allRouteId);
//			
//			for(String s : allRouteId) {
//				resultTotalBus = tbService.findByRouteid(s);
//				System.out.println("resultTotalBus = "+resultTotalBus);
//			}
//			if(!resultTotalBus.isEmpty()) {
//				for(Totalbus a : resultTotalBus) {
//					SimpleDateFormat myFmt =new SimpleDateFormat("HH:mm:ss");
//					a.setFormatinitaltime(myFmt.format(a.getInitialtime()));
//					result.add(a);	
//				}
//			}
//			System.out.println("result = " + result);
//			m.addAttribute("resultTotalBus",result);
//			return "/queryAndBookTicket/querySuccess";
//			
//		}
//		
//
//		errors.put("msg", "起站或訖站輸入錯誤");
//		return "/queryAndBookTicket/queryRoute";
//	}

}

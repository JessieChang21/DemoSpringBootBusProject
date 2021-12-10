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
	@GetMapping(path = "/queryRouteByStation")
	public String processMainStationAction() {
		return "/queryAndBookTicket/queryRouteByStation";
	}
	
	@GetMapping("/queryByCity")
	@ResponseBody
	public List<RoutesWithStation> processqueryCity() {
		return rService.findAll();
	}
	
	

	// 2. 站名關鍵字查詢主頁
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
	
	// 3. 導向地圖查詢主頁，之後要導到全部導到首頁
	@GetMapping(path = "/queryRouteByMap")
	public String processMainPageAction4() {
		return "/queryAndBookTicket/queryRouteByMap";
	}

	// 1. 3. 站名查詢、地圖查詢
	@GetMapping("/queryRoutes")
	@ResponseBody
	public List<RoutesWithStation> processMainMap() {
		return rService.findAll();
	}
	// ==============================================================================
	// 1. 站名查詢
	@PostMapping(path = "/queryRoutesByStation.controller")
	public String processQueryByStationAction(@RequestParam("inputform") String inputdata, Model m)
			throws JsonParseException, JsonMappingException, IOException, ParseException {

		// 轉為java物件(全部為string)
		ByTripname inputdataObj = mapper.readValue(inputdata, ByTripname.class);
		System.out.println(inputdataObj);
//ByTripname [tripname=北投竹子湖線, initstation=北投站, finalstation=頂湖入口(竹子湖), traveldate=2021/12/10, weekday=Friday, initialtime=18:01:11, adult=1, children=0]
		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		int qtyall = inputdataObj.getAdult() + inputdataObj.getChildren();
		if (qtyall < 1) {
			errors.put("qtyerr", "輸入人數錯誤");
			return "/queryAndBookTicket/queryRouteByKeyword";
		}

		List<Totalbus2> result = totalService.queryRoutesByTripname(inputdataObj.getTripname(), inputdataObj.getWeekday(),
				inputdataObj.getInitialtime(), inputdataObj.getAdult(), inputdataObj.getChildren());

		List<Totalbus2> result0 = new ArrayList<Totalbus2>();
		Integer resultdirection = 0;
		for(Totalbus2 bean : result) {
			if(bean.getInitialstation().equals(inputdataObj.getInitstation()) &&
			   bean.getFinalstation().equals(inputdataObj.getFinalstation()) ) {
				result0.add(bean);
				resultdirection = bean.getDirection();
			} 		
		}
		
		// 分順向 逆向
//		List<Totalbus2> result0 = new ArrayList<Totalbus2>();
//		List<Totalbus2> result1 = new ArrayList<Totalbus2>();
//		for (Totalbus2 bean : result) {
//			if (bean.getDirection() == 0) {
//				result0.add(bean);
//			} else if (bean.getDirection() == 1) {
//				result1.add(bean);
//			}
//		}
		
		m.addAttribute("inputdataObj", inputdataObj);
		m.addAttribute("resultdirection", resultdirection);
		m.addAttribute("byTripnameResult0", result0);
		return "/queryAndBookTicket/queryRouteResult2";
	}

	// 2  3. 關鍵字查詢、地圖查詢=>查詢車次
	@PostMapping(path = "/queryRoutesByTripname.controller")
	public String processQueryAction(@RequestParam("inputform") String inputdata, Model m)
			throws JsonParseException, JsonMappingException, IOException, ParseException {

		// 轉為java物件(全部為string)
		ByTripname inputdataObj = mapper.readValue(inputdata, ByTripname.class);
		System.out.println(inputdataObj);
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
		return "/queryAndBookTicket/queryRouteResult";
	}



}

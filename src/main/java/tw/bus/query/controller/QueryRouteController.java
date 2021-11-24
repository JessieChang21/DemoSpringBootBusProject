package tw.bus.query.controller;

import java.text.SimpleDateFormat;
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

import tw.bus.query.model.RouteService;
import tw.bus.query.model.Totalbus;
import tw.bus.query.model.TotalbusService;


@Controller
public class QueryRouteController {
	
	private RouteService rService;
	private TotalbusService tbService;
	
	@Autowired
	public QueryRouteController(RouteService rService, TotalbusService tbService) {
		this.rService = rService;
		this.tbService = tbService;
	}

	@GetMapping(path = "/queryRoutemain.controller")
	public String processMainPageAction() {
		return "/queryAndBookTicket/queryRoute";
	}

	@PostMapping(path = "/queryRoute.controller")
	public String processAction(@RequestParam("initStation") String initStation, @RequestParam("finalStation") String finalStation, Model m) {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		
		initStation = initStation.substring(4);
		finalStation = finalStation.substring(4);
		
		if (initStation == null || initStation.equals("請選擇...")) {
			errors.put("initStation", "請選擇起站");
		}

		if (finalStation == null || finalStation.equals("請選擇...")) {
			errors.put("finalStation", "請選擇訖站");
		}
		
		if(initStation.equals(finalStation) && !initStation.equals("請選擇...") && !finalStation.equals("請選擇...")) {
			errors.put("sameStation", "起訖站相同，請重新選擇");
		}

		if (errors != null && !errors.isEmpty()) {
			return "/queryAndBookTicket/queryRoute";
		}
		
		List<tw.bus.query.model.Route> searchInitStation = rService.findByStation(initStation);
		
		List<tw.bus.query.model.Route> searchFinalStation = rService.findByStation(finalStation);
		
		List<String> allRouteId = new ArrayList<String>();
		List<Totalbus> resultTotalBus = new ArrayList<Totalbus>();
		List<Totalbus> result = new ArrayList<Totalbus>();
		
		for(tw.bus.query.model.Route initBean : searchInitStation) {
			for(tw.bus.query.model.Route finalBean : searchFinalStation) {
				String initRouteId =initBean.getRouteId();
				String finalRouteId = finalBean.getRouteId();
				if(initRouteId.equals(finalRouteId)) {
					System.out.println("initRouteId = " + initRouteId);
					allRouteId.add(initRouteId);
				}
			}
		}		
		
		if(!allRouteId.isEmpty()) {
			m.addAttribute("initStation", initStation);
			m.addAttribute("finalStation", finalStation);
			m.addAttribute("routeId",allRouteId);
			
			for(String s : allRouteId) {
				resultTotalBus = tbService.findByRouteid(s);
				System.out.println("resultTotalBus = "+resultTotalBus);
			}
			if(!resultTotalBus.isEmpty()) {
				for(Totalbus a : resultTotalBus) {
					SimpleDateFormat myFmt =new SimpleDateFormat("HH:mm:ss");
					a.setFormatinitaltime(myFmt.format(a.getInitialtime()));
					result.add(a);	
				}
			}
			System.out.println("result = " + result);
			m.addAttribute("resultTotalBus",result);
			return "/queryAndBookTicket/querySuccess";
			
		}
		

		errors.put("msg", "起站或訖站輸入錯誤");
		return "/queryAndBookTicket/queryRoute";
	}

}

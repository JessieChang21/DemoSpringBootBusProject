package tw.bus.route.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.bus.route.model.RouteInfo;
import tw.bus.route.model.RouteInfoAssist;
import tw.bus.route.model.RouteInfoService;
import tw.bus.route.model.RouteService;
import tw.bus.route.model.Routes;

@Controller
@RequestMapping("/routes")
public class RouteInfoController {
	
	private RouteInfoService routeInfoServ;
	private RouteService rouServ;
	
	@Autowired
	public RouteInfoController(RouteInfoService routeInfoServ, RouteService rouServ) {
		this.rouServ = rouServ;
		this.routeInfoServ = routeInfoServ;
	}
	

	@GetMapping("/findrouteinfoShow.controller")
	public String processPoProductAction(@RequestParam("rid") String rid, Model m) {
		m.addAttribute("rid", rid);
		return "routes/showRouteInfo";
	}
	
	@PostMapping("/findrouteinfobyid.controller/{rid}")
	@ResponseBody
	public List<RouteInfo> findRouteInfoByIdAction(@PathVariable("rid") String rid) {
		return routeInfoServ.findRouteInfoById(rid);
	}
	
	@PostMapping("/insertRouteInfoGo.controller")
	@ResponseBody
	public Routes insertRouteInfoGo(@RequestBody List<RouteInfoAssist> rInfos, Model m) {
		System.out.println(rInfos.get(0).getName());
		
		Routes r = new Routes(
				rInfos.get(0).getValue(), 
				rInfos.get(1).getValue(),
				rInfos.get(2).getValue(),
				Integer.valueOf(rInfos.get(3).getValue())
				);
		
		List<RouteInfo> rInfoAll = new ArrayList<RouteInfo>();
		for(int i = 4; i<rInfos.size(); i+=3) {
			RouteInfo rInfoDetail = new RouteInfo();
			rInfoDetail.setRouteId(rInfos.get(0).getValue());
			rInfoDetail.setTripName(rInfos.get(1).getValue());
			rInfoDetail.setArea(rInfos.get(2).getValue());
			rInfoDetail.setStationSequence(Integer.valueOf(rInfos.get(i).getValue()));
			rInfoDetail.setStation(rInfos.get(i+1).getValue());
			rInfoDetail.setSequenceTime(Integer.valueOf(rInfos.get(i+2).getValue()));
			
			rInfoAll.add(rInfoDetail);
		}
		System.out.println(r.getRouteId());
		
		r.setInitialStation(rInfoAll.get(0).getStation());
		r.setFinalStation(rInfoAll.get(rInfoAll.size()-1).getStation());
		
		rouServ.insertRoute(r);
		for (int i =0; i<rInfoAll.size(); i++) {
			routeInfoServ.insertRouteInfo(rInfoAll.get(i));
		}
		
		return r;
	}
	
	@GetMapping("/insertRouteInfoSuccess.controller")
	public String routeInsertSuccess(@RequestParam("rid") String rid, Model m) {
		
		Routes r = rouServ.findById(rid).get();
		m.addAttribute("routes", r);
		m.addAttribute("rid", rid);
		
		return "routes/routeInsertSuccess";
		
	}
	

}

package tw.bus.route.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.bus.route.model.PageAssistR;
import tw.bus.route.model.RouteService;
import tw.bus.route.model.Routes;

@Controller
@RequestMapping("/routes")
//@SessionAttributes(names = {"totalPages", "totalElements"})
public class RouteController {
	@Autowired
	private RouteService routeServ;
	
	@GetMapping("/routemain.controller")
	public String processRouteMainAction() {
		return "routes/showAllRoutes";
	}
	
	@PostMapping("/routeByPage/{pageNo}")
	@ResponseBody
	public PageAssistR processRouteByPage(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 20;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Routes> page = routeServ.findAllRouteByPage(pageable);
		
		PageAssistR routePage = new PageAssistR();
		
		routePage.setList(page.getContent());
		routePage.setPageEles(page.getTotalElements());
		routePage.setTolpages(page.getTotalPages());
		
		return routePage;
	}
	
	@PostMapping("/routeByTripname/{tripName}/{pageNo}")
	@ResponseBody
	public PageAssistR processFindByTripName(@PathVariable("tripName") String tripName, @PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 20;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Routes> page = routeServ.findRouteByTripName(tripName, pageable);
		
		PageAssistR routePage = new PageAssistR();
		
		routePage.setList(page.getContent());
		routePage.setPageEles(page.getTotalElements());
		routePage.setTolpages(page.getTotalPages());
		
		return routePage;
	}
	
	@PostMapping("/routeByArea/{area}/{pageNo}")
	@ResponseBody
	public PageAssistR processFindByArea(@PathVariable("area") String area, @PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 20;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Routes> page = routeServ.findRouteByArea(area, pageable);
		
		PageAssistR routePage = new PageAssistR();
		
		routePage.setList(page.getContent());
		routePage.setPageEles(page.getTotalElements());
		routePage.setTolpages(page.getTotalPages());
		
		return routePage;
	}
	
	@PostMapping("/routeAreaAll")
	@ResponseBody
	public List<String> findDisArea(){
		return routeServ.findDisArea();
	}
	
	@PostMapping("/routeTripNameAll")
	@ResponseBody
	public List<String> findDisTripName(){
		return routeServ.findDisTripName();
	}
	
	@PostMapping("/findDisTripNameByArea/{area}")
	@ResponseBody
	public List<String> findDisTripNameByArea(@PathVariable("area")String area){
		return routeServ.findDisTripNameByArea(area);
	}
	
	/// 新增路線
	@GetMapping("/insertRoutes.controller")
	public String processinsertRoutes(Model m) {
		Routes lastR = routeServ.findLastRoute();
		Integer num = Integer.valueOf(lastR.getRouteId().substring(1));
		System.out.println(num);
		Routes newRoute = new Routes();
		newRoute.setRouteId("R"+(num+1));
		m.addAttribute("newRoute", newRoute);
		return "routes/routeInsert";
	}
	
	@RequestMapping(value="/insertRoutesInfo.controller", method = RequestMethod.POST)
	public String InsertRouteInfo(@RequestParam("routeId") String routeId, @RequestParam("tripName") String tripName, @RequestParam("area") String area,@RequestParam("direction") Integer direction, Model m) {
		Routes newRoute=new Routes();
		
		newRoute.setRouteId(routeId);
		newRoute.setTripName(tripName);
		newRoute.setArea(area);
		newRoute.setDirection(direction);
		Map<String, String> errors = new HashMap<String, String>(); 
		m.addAttribute("errors", errors);
		
		System.out.println(newRoute.getTripName());
		if(newRoute.getTripName()=="") {
			errors.put("tripNameE", "請輸入路線名稱");
		}
		
		System.out.println(newRoute.getArea());
		if(newRoute.getArea()==""||newRoute.getArea()=="請選擇") {
			errors.put("areaE", "請選擇地區");
		}
		
		System.out.println(newRoute.getDirection());
		if(newRoute.getDirection()==9||newRoute.getDirection()==null) {
			errors.put("dirE", "請選擇方向");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			m.addAttribute("newRoute", newRoute);
			return "routes/routeInsert";
		}
		m.addAttribute("newRoute", newRoute);
		return "routes/routeInfoInsert";
		
	}

}

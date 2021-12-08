package tw.bus.route.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	

}

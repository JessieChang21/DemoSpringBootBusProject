package tw.bus.route.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.bus.route.model.RouteInfo;
import tw.bus.route.model.RouteInfoService;


@Controller
@RequestMapping("/routes")
public class RouteInfoController {
	
	@Autowired
	private RouteInfoService routeInfoServ;
	

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
	
	

}

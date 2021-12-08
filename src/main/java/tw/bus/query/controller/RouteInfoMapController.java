package tw.bus.query.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.bus.query.model.RouteInfoMap;
import tw.bus.query.model.RouteInfoMapService;

@Controller
public class RouteInfoMapController {
	
	private RouteInfoMapService mapService;
	@Autowired
	public RouteInfoMapController(RouteInfoMapService mapService) {
		this.mapService = mapService;
	}
	
	@GetMapping(path = "/showmap")
	public String processMapMainAction() {
		return "/queryAndBookTicket/showMap";
	}
	
	@GetMapping("/queryMap")
	@ResponseBody
	public List<RouteInfoMap> processMainMap() {
		return mapService.findAll();
	}

}

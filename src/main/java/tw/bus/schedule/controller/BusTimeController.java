package tw.bus.schedule.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.bus.route.model.RouteService;
import tw.bus.route.model.Routes;
import tw.bus.schedule.model.BusTimeService;
import tw.bus.schedule.model.BusTimes;
import tw.bus.schedule.model.PageAssist;
import tw.bus.ticketback.model.MemberorderService;


@Controller
@RequestMapping("/busTimes")
//@SessionAttributes(names = {"totalBusPages", "totalBusElements"})
public class BusTimeController {
	
	private BusTimeService busTimeServ;
	private RouteService routeServ;
	private MemberorderService moServ;
	
	@Autowired
	public BusTimeController(BusTimeService busTimeServ, MemberorderService moServ, RouteService routeServ) {
		this.busTimeServ = busTimeServ;
		this.moServ = moServ;
		this.routeServ = routeServ;
	}
	
//	@GetMapping("/bustimemain.controller")
//	public String processBusTimeMainAction() {
//		return "busTimes/showAllBusTimes";
//	}
//	
//	@PostMapping("/bustimeByPage/{pageNo}")
//	@ResponseBody
//	public List<BusTimes> processBusTimeByPage(@PathVariable("pageNo") int pageNo, Model m){
//		int pageSize = 20;
//		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
//		Page<BusTimes> page = busTimeServ.findAllBusTimesByPage(pageable);
//		m.addAttribute("totalPages", page.getTotalPages());
//		m.addAttribute("totalElements", page.getTotalElements());
//		return page.getContent();
//	}
	
	
	@GetMapping("/findbustimeShow.controller")
	public String processBusTimeShowAction(@RequestParam("rid") String rid, Model m) {
		Optional<Routes> op1 = routeServ.findById(rid);
		if(op1.isPresent()) {
			m.addAttribute("rid", rid);
			return "busTimes/showAllBusTimes";
		} else {
			return "/routes/showAllRoutes";
		}
		
	}
	
	@GetMapping("/findbustimeDetailShow.controller")
	public String processBusTimeShowDetailAction(@RequestParam("busNumber") Integer busNumber, Model m) {
		BusTimes bus = busTimeServ.findBusById(busNumber);
		if(bus!=null) {
			m.addAttribute("bus", bus);
			return "busTimes/showBusTimesDetail";
		} else {
			return "/routes/showAllRoutes";
		}
		
	} 
	
//	@PostMapping("/bustimeByPageAndRouteId/{routeId}/{pageNo}")
//	@ResponseBody
//	public List<BusTimes> processBusTimeByPageAndRouteId(@PathVariable("pageNo") int pageNo, Model m, @PathVariable("routeId") String routeId){
//		int pageSize = 20;
//		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
//		Page<BusTimes> page = busTimeServ.findBusTimesByPageAndRouteId(routeId, pageable);
//		m.addAttribute("totalBusPages", page.getTotalPages());
//		m.addAttribute("totalBusElements", page.getTotalElements());
//		
//		System.out.println(page.getTotalPages());
//		System.out.println(page.getTotalElements());
//		
//		return page.getContent();
//	}
	
	
	@PostMapping("/bustimeByPageAndRouteId/{routeId}/{pageNo}")
	@ResponseBody
	public PageAssist processBusTimeByPageAndRouteId(@PathVariable("pageNo") int pageNo, Model m, @PathVariable("routeId") String routeId){
		int pageSize = 20;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<BusTimes> page = busTimeServ.findBusTimesByPageAndRouteId(routeId, pageable);
		m.addAttribute("totalBusPages", page.getTotalPages());
		m.addAttribute("totalBusElements", page.getTotalElements());
		
		System.out.println(page.getTotalPages());
		System.out.println(page.getTotalElements());
		PageAssist pagesEleBus = new PageAssist();
		pagesEleBus.setList(page.getContent());
		pagesEleBus.setTolpages(page.getTotalPages());
		pagesEleBus.setPageEles(page.getTotalElements());
		
		return pagesEleBus;
	}
	
	
	
	public BusTimes processBusTimeUpdate(BusTimes bustime) {
		return busTimeServ.updateBusTime(bustime);
	}
	
	public BusTimes processBusTimeDelete(BusTimes bustime) {
		return busTimeServ.deleteBusTime(bustime);
	}
	
//	@PostMapping("/bustimedeletebybusno.controller")
//	@ResponseBody
//	public BusTimes processBusTimeDeleteByBusNo(@RequestBody Integer busNumber) {
//		seatServ.deleteSeatByBusNumber(busNumber);
//		return busTimeServ.deleteByBusNo(busNumber);
//	}
	
	

}

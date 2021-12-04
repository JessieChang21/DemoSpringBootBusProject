package tw.bus.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.bus.tour.model.Tour;
import tw.bus.tour.model.TourService;

@Controller
public class TourController {

	@Autowired
	private TourService tService;

	@GetMapping(path="/tourfindall")
	public String processFindAllAction( Model m) {
		m.addAttribute("TourList", tService.findAll());
//		m.addAllAttributes(tService.findAll());
		return "/tourFunction/tourManagedFunction";
	}
	@GetMapping(path="/tourEdit")
	public String processSelectById(String editId , Model m) {
		System.out.println(editId);
//		tService.findById(editId);
		System.out.println(tService.findById(editId));
		Tour aaa =tService.findById(editId);
		System.out.println(aaa.getTourSaleEnd());
		m.addAttribute("Tour", aaa);
		return "/tourFunction/tourEditFunction";
	}
	
}

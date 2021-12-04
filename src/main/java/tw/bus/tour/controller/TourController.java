package tw.bus.tour.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
//		System.out.println(tService.findById(editId));
		Tour aaa =tService.findById(editId);
		System.out.println(aaa.getTourSaleEnd());
//		m.addAttribute("Tour", aaa);
//		return "/tourFunction/tourEditFunction";
		return processFindAllAction(m);
	}
	@GetMapping(path="/tourDelete")
	public String processDeleteById(Integer editId , Model m) {
		
		System.out.println(editId);
		tService.deleteById(editId);
//		System.out.println(tService.findById(editId));
//		Tour aaa =tService.findById(editId);
//		System.out.println(aaa.getTourSaleEnd());
//		m.addAttribute("Tour", aaa);
//		return "/tourFunction/tourEditFunction";
		return processFindAllAction(m);
	}
	@GetMapping(path="/tourInsert")
	public String processInsertAction(
			@RequestParam("tourId") Integer tourId,
			@RequestParam("tourName") String tourName,
			@RequestParam("tourPrice") Integer tourPrice,
			@RequestParam("discountPrice") Integer discountPrice,
			@RequestParam("fk_tour_routeId") String fk_tour_routeId,
			@RequestParam("tourContent") String tourContent,
			@RequestParam("tourSaleStart") String tourSaleStart,
			@RequestParam("tourSaleEnd") String tourSaleEnd,
			@RequestParam("tourUseStart") String tourUseStart,
			@RequestParam("tourUseEnd") String tourUseEnd,
			@RequestParam("tourURL") String tourURL,
			Model m
			) {
		Tour insertData = new Tour();
//		Date test11= new Date(1345648789);
		if(tourId!=0) {
			insertData.setTourId(tourId);			
		}
		insertData.setTourName(tourName);
		insertData.setTourPrice(tourPrice);
		insertData.setDiscountPrice(discountPrice);
		insertData.setFk_tour_routeId(fk_tour_routeId);
		insertData.setTourContent(tourContent);
		insertData.setTourSaleStart(tourSaleStart);
		insertData.setTourSaleEnd(tourSaleEnd);
		insertData.setTourUseStart(tourUseStart);
		insertData.setTourUseEnd(tourUseEnd);
		insertData.setTourURL(tourURL);
		tService.insertData(insertData);
		return processFindAllAction(m);
	}
	
}

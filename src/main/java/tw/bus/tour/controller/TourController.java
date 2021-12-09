package tw.bus.tour.controller;

import java.security.Timestamp;
import java.util.Date;
import java.util.List;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import tw.bus.tour.model.RoutesForToursRepository;
import tw.bus.tour.model.RoutesForToursService;
import tw.bus.tour.model.Tour;
import tw.bus.tour.model.TourService;

@Controller
public class TourController {

	@Autowired
	private TourService tService;
	@Autowired
	private RoutesForToursService rService;

	@GetMapping(path="/tourfindall")
	public String processFindAllAction( Model m) {
		Date date = new Date();
		System.out.println(date);
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateStr = sdf.format(date).substring(0,10);
		System.out.println(dateStr);
		m.addAttribute("crdate",dateStr);
		m.addAttribute("TourList", tService.findAll());
		m.addAttribute("RoutesList",tService.findRoutes());
		return "/tourFunction/tourManagedCSSTest";
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
			@RequestParam("fk_routes_routeId") String fk_routes_routeId,
			@RequestParam("tourContent") String tourContent,
			@RequestParam("tourSaleStart") String tourSaleStart,
			@RequestParam("tourSaleEnd") String tourSaleEnd,
			@RequestParam("tourUseStart") String tourUseStart,
			@RequestParam("tourUseEnd") String tourUseEnd,
			@RequestParam("tourURL") String tourURL,
			Model m
			) {
		Tour insertData = new Tour();
		if(tourId!=0) {
			insertData.setTourId(tourId);			
		}
		insertData.setTourName(tourName);
		insertData.setTourPrice(tourPrice);
		insertData.setDiscountPrice(discountPrice);
		insertData.setFk_routes_routeId(fk_routes_routeId);
		insertData.setTourContent(tourContent);
		insertData.setTourSaleStart(tourSaleStart);
		insertData.setTourSaleEnd(tourSaleEnd);
		insertData.setTourUseStart(tourUseStart);
		insertData.setTourUseEnd(tourUseEnd);
		insertData.setTourURL(tourURL);
		tService.insertData(insertData);
		return processFindAllAction(m);
	}

	@GetMapping("/tourpackages")
	public String processTourShowed(Model m) {
		m.addAttribute("TourList", tService.findAll());
		m.addAttribute("RoutesList",tService.findRoutes());
		m.addAttribute("AreaList",rService.findByArea());
		return "/tourFunction/tourShowedFunction";
	}
}

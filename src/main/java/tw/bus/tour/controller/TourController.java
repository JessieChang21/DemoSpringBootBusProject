package tw.bus.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.bus.tour.model.Tour;
import tw.bus.tour.model.TourService;

@RestController
public class TourController {

	@Autowired
	private TourService tService;

	@GetMapping(path="/tourfindall")
	public List<Tour> processFinadAll() {
		return tService.findAll();
	}
}

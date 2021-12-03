package tw.bus.employee.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.bus.employee.model.Holiday;
import tw.bus.employee.model.HolidayService;

@Controller
@RequestMapping("/Holiday")
@SessionAttributes(names = {"totalPages", "totalElements"})
public class HolidayController {
	@Autowired
    private HolidayService hService;
	
	@GetMapping("/holidaymain.controller")
	public String processHolidayMainAction() {
		return "Holiday/HolidayQueryAll";
	}
	
	@PostMapping("/add") 
	@ResponseBody
	public Holiday processInsertAction(@RequestBody Holiday h) {
		//p.setPdate(new Date());
		return hService.insertHoliday(h);
	}
	
	@PostMapping("/update") 
	@ResponseBody
	public Holiday processUpdateAction(@RequestBody Holiday h) {
		//p.setPdate(new Date());
		return hService.updateHoliday(h);
	}
	
	@PostMapping("/delete") 
	public void processDeleteAction(@RequestBody Holiday h) {
		//p.setPdate(new Date());
		hService.deleteHoliday(h);
	}
	
	@PostMapping("/querybyid/{pid}")
	@ResponseBody
	public Holiday processFindByIdAction(@PathVariable("pid") String eid) {
		return hService.findById(eid);
	}
	
	@PostMapping("/queryByPage/{pageNo}")
	@ResponseBody
	public List<Holiday> processQueryByPage(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 2;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Holiday> page = hService.findAllByPage(pageable);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}

}

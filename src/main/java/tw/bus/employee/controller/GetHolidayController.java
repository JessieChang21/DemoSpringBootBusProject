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

import tw.bus.employee.model.GetHoliday;
import tw.bus.employee.model.GetHolidayService;

@Controller
@RequestMapping("/GetHoliday")
@SessionAttributes(names = {"totalPages", "totalElements"})
public class GetHolidayController {
	@Autowired
    private GetHolidayService ghService;
	
	@GetMapping("/getholidaymain.controller")
	public String processgetholidayMainAction() {
		return "GetHoliday/getholidayQueryAll";
	}
	
	@PostMapping("/add") 
	@ResponseBody
	public GetHoliday processInsertAction(@RequestBody GetHoliday gh) {
		//p.setPdate(new Date());
		return ghService.insertGetHoliday(gh);
	}
	
	@PostMapping("/update") 
	@ResponseBody
	public GetHoliday processUpdateAction(@RequestBody GetHoliday gh) {
		//p.setPdate(new Date());
		return ghService.updateGetHoliday(gh);
	}
	
	@PostMapping("/delete") 
	public void processDeleteAction(@RequestBody GetHoliday gh) {
		//p.setPdate(new Date());
		ghService.deleteGetHoliday(gh);
	}
	
	@PostMapping("/querybyid/{pid}")
	@ResponseBody
	public GetHoliday processFindByIdAction(@PathVariable("pid") String eid) {
		return ghService.findById(eid);
	}
	
	@PostMapping("/queryByPage/{pageNo}")
	@ResponseBody
	public List<GetHoliday> processQueryByPage(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 2;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<GetHoliday> page = ghService.findAllByPage(pageable);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}
}

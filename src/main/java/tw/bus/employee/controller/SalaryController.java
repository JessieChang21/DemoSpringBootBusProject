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

import tw.bus.employee.model.Salary;
import tw.bus.employee.model.SalaryService;

@Controller
@RequestMapping("/Salary")
@SessionAttributes(names = {"totalPages", "totalElements"})
public class SalaryController {
	@Autowired
    private SalaryService sService;
	
	@GetMapping("/salarymain.controller")
	public String processSalaryMainAction() {
		return "Salary/SalaryQueryAll";
	}
	
	@PostMapping("/add") 
	@ResponseBody
	public Salary processInsertAction(@RequestBody Salary s) {
		//p.setPdate(new Date());
		return sService.insertSalary(s);
	}
	
	@PostMapping("/update") 
	@ResponseBody
	public Salary processUpdateAction(@RequestBody Salary s) {
		//p.setPdate(new Date());
		return sService.updateSalary(s);
	}
	
	@PostMapping("/delete") 
	public void processDeleteAction(@RequestBody Salary s) {
		//p.setPdate(new Date());
		sService.deleteSalary(s);
	}
	
	@PostMapping("/querybyid/{pid}")
	@ResponseBody
	public Salary processFindByIdAction(@PathVariable("pid") String eid) {
		return sService.findById(eid);
	}
	
	@PostMapping("/queryByPage/{pageNo}")
	@ResponseBody
	public List<Salary> processQueryByPage(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 2;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Salary> page = sService.findAllByPage(pageable);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}

}

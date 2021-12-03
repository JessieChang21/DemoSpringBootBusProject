package tw.bus.employee.controller;

import java.sql.Date;
import java.util.List;

import javax.swing.JComboBox;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.bus.employee.model.Employee;
import tw.bus.employee.model.EmployeeService;
@Controller
@RequestMapping("/employee")
@SessionAttributes(names = {"totalPages", "totalElements"})
public class EmployeeController {
	@Autowired
    private EmployeeService eService;
	
	@GetMapping("/employeemain.controller")
	public String processEmployeeMainAction() {
		return "employee/employeeQueryAll";
	}
	
	@GetMapping("/employQuery.controller")
	public String processEmployeeAction(@RequestParam("pid") String pid, Model m) {
		m.addAttribute("pid", pid);
		Employee e = eService.findById(pid);
		m.addAttribute("employeename",e.getEmployeename().toString());
		return "employee/employeeQuery";
	}
	
	@GetMapping("/employadd.controller")
	public String processAddAction() {
		return "employee/employeeAdd";
	}
	
	@PostMapping("/employeeInsert") 
	@ResponseBody
	public Employee processInsertAction(@RequestBody Employee e) {
		e.setEnterdate(new Date(0));
		e.setSeniority(0);
		return eService.insertEmployee(e);
	}
	
	@PostMapping("employeeUpdate") 
	@ResponseBody
	public Employee processUpdateAction(@RequestBody Employee e) {
		//p.setPdate(new Date());
		return eService.updateEmployee(e);
	}
	
	@PostMapping("/employeeDelete") 
	public void processDeleteAction(@RequestBody Employee e) {
		eService.deleteEmployee(e);
	}
	
	@PostMapping("/querybyid/{pid}")
	@ResponseBody
	public Employee processFindByIdAction(@PathVariable("pid") String pid) {
		return eService.findById(pid);
	}
	
	@PostMapping("/queryByPage/{pageNo}")
	@ResponseBody
	public List<Employee> processQueryByPage(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Employee> page = eService.findAllByPage(pageable);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}
}

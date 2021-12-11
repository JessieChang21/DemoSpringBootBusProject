package tw.bus.employee.controller;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

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

import org.w3c.dom.Document;

import tw.bus.employee.model.Employee;
import tw.bus.employee.model.EmployeeService;
import tw.bus.employee.model.Holiday;
import tw.bus.employee.model.HolidayRepository;
import tw.bus.employee.model.HolidayService;
import tw.bus.employee.model.Job;
import tw.bus.employee.model.JobService;
import tw.bus.employee.model.Rank;
import tw.bus.employee.model.RankService;
@Controller
@RequestMapping("/employee")
@SessionAttributes(names = {"totalPages", "totalElements"})
public class EmployeeController {
	
    private EmployeeService eService;
	private JobService jService;
	private RankService rService;
	private HolidayService hService;
	
	@Autowired
	public EmployeeController(EmployeeService eService, JobService jService, RankService rService,HolidayService hService) {
		this.eService = eService;
		this.jService = jService;
		this.rService = rService;
		this.hService = hService;
	}
	
	@GetMapping("/employeemain.controller")
	public String processEmployeeMainAction() {
		return "employee/employeeQueryAll";
	}
	
	@GetMapping("/employQuery.controller")
	public String processEmployeeAction(@RequestParam("pid") String pid, Model m) {
		m.addAttribute("pid", pid);
		Employee e = eService.findById(pid);
		m.addAttribute("employeename",e.getEmployeename().toString());
		m.addAttribute("password",e.getPassword().toString());
		m.addAttribute("groupid",e.getGroupid().toString());
		m.addAttribute("gender",e.getGender().toString());
		m.addAttribute("jobid",e.getJobid().toString());
		m.addAttribute("rankid",e.getRankid().toString());
		m.addAttribute("enterdate",e.getEnterdate().toString());
		m.addAttribute("seniority",e.getSeniority());
		return "employee/employeeQuery";
	}
	
	@GetMapping("/employadd.controller")
	public String processAddAction() {
		return "employee/employeeAdd";
	}
	
	@PostMapping("/employeeInsert") 
	@ResponseBody
	public Employee processInsertAction(@RequestBody Employee e) {
		e.setGroupid("A");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		//Date date = new Date(0);
		LocalDate todaysDate = LocalDate.now();
		System.out.println(formatter.format(todaysDate));
		e.setEnterdate(formatter.format(todaysDate));
		e.setSeniority(0);
		return eService.insertEmployee(e);
	}
	
	@PostMapping("/employeeInsert2") 
	public String processInsertAction2(@RequestParam("id") String id,
			@RequestParam("employeename") String employeename,
			@RequestParam("gender") String gender,
			@RequestParam("jobid") String jobid,
			@RequestParam("rankid") String rankid) {
		Employee e = new Employee();
		//e.setId(id);
		String empid = eService.findMaxId();
		e.setId(empid);
		e.setEmployeename(employeename);
		e.setPassword("0000");
		e.setGroupid("1");
		e.setGender(gender);
		e.setJobid(jobid);
		e.setRankid(rankid);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		//LocalDate todaysDate = LocalDate.now();
		System.out.println(formatter.format(date));
		e.setEnterdate(formatter.format(date));
		e.setSeniority(0);
		eService.insertEmployee(e);
		//新增員工資料的同時新增該員工的假期統計
		Holiday h = new Holiday();
		h.setEmployeeid(empid);
		h.setTotalhours(56);
		h.setLavehours(0);
		hService.insertHoliday(h);
		return "employee/employeeQueryAll";
	}
	
	@PostMapping("employeeUpdate") 
	//@ResponseBody
	public String processUpdateAction(@RequestBody Employee e) {

		e.setPassword("0000");
		e.setGroupid("1");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		//LocalDate todaysDate = LocalDate.now();
		System.out.println(formatter.format(date));
		e.setEnterdate(formatter.format(date));
		e.setSeniority(0);
		eService.updateEmployee(e);
		return "employee/employeeQueryAll";
	}
	
	@PostMapping("employeeDelete") 
	public String processDeleteAction(@RequestBody Employee e) {
		eService.deleteEmployee(e);
		//刪除員工資料的同時刪除員工的假期統計
		Holiday h = new Holiday();
		String empid = e.getId().toString();
		h.setEmployeeid(empid);
		h.setTotalhours(56);
		h.setLavehours(0);
		hService.deleteHoliday(h);
		return "employee/employeeQueryAll";
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
	
	@PostMapping("/getJob")
	@ResponseBody
	public List<Job>  getJob() {
		return jService.findAll();
	}
	
	@PostMapping("/getRank")
	@ResponseBody
	public List<Rank>  getRank() {
		return rService.findAll();
	}
	
	@PostMapping("/getJobbyid/{jobid}")
	@ResponseBody
	public Job  getJobbyid(@PathVariable("jobid") String jobid) {
		return jService.findById(jobid);
	}
	
	
}

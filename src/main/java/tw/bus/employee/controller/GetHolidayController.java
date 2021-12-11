package tw.bus.employee.controller;

import java.io.Console;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import tw.bus.employee.model.GetHoliday;
import tw.bus.employee.model.GetHolidayService;
import tw.bus.employee.model.HolidayService;
import tw.bus.query.model.RoutesWithStation;

@Controller
@RequestMapping("/GetHoliday")
@SessionAttributes(names = {"totalPages", "totalElements","employee"})
public class GetHolidayController {
	
    private GetHolidayService ghService;
    private HolidayService hService;
    private EmployeeService eService;
    //測試用員工編號
    private String empid = "5";
	
	@Autowired
	public GetHolidayController(GetHolidayService ghService, HolidayService hService,EmployeeService eService) {
		this.ghService = ghService;
		this.hService = hService;
		this.eService = eService;
	}
	
	@GetMapping("/getholidayindex")
	public String processgetholidayIndex() {
		return "employee/holidayindex";
	}
	
	@GetMapping("/getholidayQuery")
	public String processgetholidayMainAction() {
		return "employee/getholidayQueryAll";
	}
	@GetMapping("/getholidayadd")
	public String processAddAction(Model m) {
		m.addAttribute("empId", empid);
		m.addAttribute("empName", eService.getNamebyId(empid).toString());
		m.addAttribute("LaveHours",hService.getLaveHoursbyID(empid));
		return "employee/holidayAdd";
	}
	//員工請假
	@PostMapping("/getholidayInsert") 
	public String processInsertAction(@RequestParam("substituteid") String substituteid,
			@RequestParam("date") String date,
			@RequestParam("timeperiod") String timeperiod, Model m) {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		if (empid == substituteid) {
			errors.put("msg", "代班人員不可為請假員工本人");
			return "employee/holidayAdd";
		}
		if(ghService.hasData(empid, date, timeperiod) >= 1) {
			errors.put("msg", "不可重複請假");
			return "employee/holidayAdd";
		}
		/**GetHolidaypk pk = new GetHolidaypk();
		pk.setEmployeeid(empid);
		pk.setDate(date);
		pk.setTimeperiod(timeperiod);**/
		GetHoliday gh = new GetHoliday();		
		//gh.setGetHolidayPK(pk);
		gh.setEmployeeid(empid);
		gh.setSubstituteid(substituteid);
		gh.setDate(date);
		gh.setTimeperiod(timeperiod);
		gh.setTotalhours(4);
		gh.setRelease("N");
		//ghService.insertGetHoliday(gh);
		ghService.InsertGetHoliday(empid, substituteid, date, timeperiod, 4, "N");
		//同步修改員工假期統計
		var h = hService.findById(empid);
		h.setEmployeeid(empid);
		h.setTotalhours(hService.getTotalHoursbyID(empid));
		h.setLavehours(hService.getLaveHoursbyID(empid)-4);
		hService.updateHoliday(h);
		return "employee/holidayindex";
	}
	//主管放行
	@GetMapping("/getholidayRelease")
	public String processgetholidayRelease() {
		return "employee/holidayUpdate";
	}
	
	@GetMapping("/update") 
	//@ResponseBody
	public String processUpdateAction(
	@RequestParam("employeeid") String employeeid,
	@RequestParam("date") String date,
	@RequestParam("timeperiod") String timeperiod) {
		ghService.Updaterelease(employeeid,date,timeperiod);
		return "employee/holidayUpdate";
	}
	//假期查詢
	@GetMapping("/getholidayQuerybyId")
	public String processgetholidayQuery(Model m) {
		m.addAttribute("empId", empid);
		return "employee/holidayQuerybyId";
	}
	@GetMapping("/delete") 
	public String processDeleteAction(
	@RequestParam("employeeid") String employeeid,
	@RequestParam("date") String date,
	@RequestParam("timeperiod") String timeperiod) {
		ghService.DeleteGetHoliday(employeeid,date,timeperiod);
		return "employee/holidayQuerybyId";
	}
	
	@PostMapping("/querybyid/{pid}")
	@ResponseBody
	public GetHoliday processFindByIdAction(@PathVariable("pid") String eid) {
		return ghService.findById(eid);
	}
	
	@PostMapping("/queryByPage/{pageNo}")
	@ResponseBody
	public List<GetHoliday> processQueryByPage(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<GetHoliday> page = ghService.findAllByPage(pageable);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}
	
	@PostMapping("/test/{pageNo}")
	@ResponseBody
	public List<GetHoliday> test(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<GetHoliday> page = ghService.findAllByPage(pageable);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}
	
	@PostMapping("/QueryAllUnRelease/{pageNo}")
	@ResponseBody
	public List<GetHoliday> processQueryAllUnRelease(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<GetHoliday> page = ghService.QueryAllUnRelease(pageable);
		System.out.println(page.getContent());
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}
	
	@PostMapping("/QueryAllbyId/{pageNo}")
	@ResponseBody
	public List<GetHoliday> processQueryAllbyId(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 5;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<GetHoliday> page = ghService.QueryAllbyId(pageable,empid);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}
	
	@GetMapping("/findList")
	@ResponseBody
	public List<GetHoliday> finAllUnRelease() {
		List<GetHoliday> result = ghService.finAllUnRelease();
		for(GetHoliday bean : result) {
			System.out.println("Employeeid:"+bean.getEmployeeid());
			System.out.println("Substituteid:"+bean.getSubstituteid());
			System.out.println("Date:"+bean.getDate());
			System.out.println("Timeperiod:"+bean.getTimeperiod());
		}
		return ghService.finAllUnRelease();
	}
	
	@PostMapping("/getsubstituteid")
	@ResponseBody
	public List<Employee>  getSubstituteId() {
		return eService.findAllById(empid);
	}
}

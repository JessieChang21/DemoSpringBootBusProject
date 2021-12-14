package tw.bus.employee.controller;

import java.io.Console;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.bus.employee.model.Employee;
import tw.bus.employee.model.EmployeeService;
import tw.bus.employee.model.GetHoliday;
import tw.bus.employee.model.GetHolidayService;
import tw.bus.employee.model.GetHolidaypk;
import tw.bus.employee.model.HolidayService;
import tw.bus.memberslogin.model.UpdateMembers;
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
	public String processAddAction(@SessionAttribute("employee") Employee emp,Model m) {
		String eid = emp.getId().toString();
		System.out.println("empid="+eid);
		String EMP_ID = "";
		if(eid.isEmpty()) {
			EMP_ID = empid;
		}else {
			EMP_ID = eid;
		}
		m.addAttribute("empId", EMP_ID);
		m.addAttribute("empName", eService.getNamebyId(EMP_ID).toString());
		m.addAttribute("LaveHours",hService.getLaveHoursbyID(EMP_ID));
		return "employee/holidayAdd";
	}
	//員工請假
	@PostMapping("/getholidayInsert") 
	public String processInsertAction(@SessionAttribute("employee") Employee emp,
			@RequestParam("substituteid") String substituteid,
			@RequestParam("date") String date,
			@RequestParam("timeperiod") String timeperiod, Model m) {
		String eid = emp.getId().toString();
		System.out.println("empid="+eid);
		String EMP_ID = "";
		if(eid.isEmpty()) {
			EMP_ID = empid;
		}else {
			EMP_ID = eid;
		}
		m.addAttribute("empId", EMP_ID);
		m.addAttribute("empName", eService.getNamebyId(EMP_ID).toString());
		m.addAttribute("LaveHours",hService.getLaveHoursbyID(EMP_ID));
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		if(date == "") {
			errors.put("errors", "尚未選擇請假日期");
			return "employee/holidayAdd";
		}
		if(ghService.hasData(substituteid, date, timeperiod) >= 1) {
			errors.put("errors", "該員工已請假,不可代班");
			return "employee/holidayAdd";
		}
		if(ghService.hasData(EMP_ID, date, timeperiod) >= 1) {
			errors.put("errors", "不可重複請假");
			return "employee/holidayAdd";
		}
		GetHolidaypk pk = new GetHolidaypk();
		pk.setEmployeeid(EMP_ID);
		pk.setDate(date);
		pk.setTimeperiod(timeperiod);
		GetHoliday gh = new GetHoliday();		
		gh.setPk(pk);
		gh.setSubstituteid(substituteid);
		gh.setTotalhours(4);
		gh.setRelease("N");
		//ghService.InsertGetHoliday(EMP_ID, substituteid, date, timeperiod, 4, "N");
		ghService.insertGetHoliday(gh);
		//同步修改員工假期統計
		var h = hService.findById(EMP_ID);
		h.setEmployeeid(EMP_ID);
		h.setTotalhours(hService.getTotalHoursbyID(EMP_ID));
		h.setLavehours(hService.getLaveHoursbyID(EMP_ID)-4);
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
		System.out.println(employeeid.substring(0, 6)+"-"+date+"-"+timeperiod);
		ghService.Updaterelease(employeeid.substring(0, 6),date,timeperiod);
		return "employee/holidayUpdate";
	}
	//假期查詢
	@GetMapping("/getholidayQuerybyId")
	public String processgetholidayQuery(@SessionAttribute("employee") Employee emp,Model m) {
		String eid = emp.getId().toString();
		System.out.println("empid="+eid);
		String EMP_ID = "";
		if(eid.isEmpty()) {
			EMP_ID = empid;
		}else {
			EMP_ID = eid;
		}
		m.addAttribute("empId", EMP_ID);
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
		
	@GetMapping("/queryByPage/{pageNo}")
	@ResponseBody
	public List<GetHoliday> processQueryByPage(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<GetHoliday> page = ghService.finAllUnRelease(pageable);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}
	
	@GetMapping("/QueryAllUnRelease/{pageNo}")
	@ResponseBody
	public List<GetHoliday> processQueryAllUnRelease(@PathVariable("pageNo") int pageNo, Model m){
		System.out.println("開始查詢");
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<GetHoliday> page = ghService.QueryAllUnRelease(pageable);
		System.out.println("查詢完成");
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}
	
	@PostMapping("/QueryAllbyId_Y/{pageNo}")
	@ResponseBody
	public List<GetHoliday> processQueryAllbyId_Y(@SessionAttribute("employee") Employee emp,
			@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		String eid = emp.getId().toString();
		System.out.println("empid="+eid);
		String EMP_ID = "";
		if(eid.isEmpty()) {
			EMP_ID = empid;
		}else {
			EMP_ID = eid;
		}
		Page<GetHoliday> page = ghService.QueryAllbyId_Y(pageable,EMP_ID);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}
	
	@PostMapping("/QueryAllbyId_N/{pageNo}")
	@ResponseBody
	public List<GetHoliday> processQueryAllbyId_N(@SessionAttribute("employee") Employee emp,
			@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		String eid = emp.getId().toString();
		System.out.println("empid="+eid);
		String EMP_ID = "";
		if(eid.isEmpty()) {
			EMP_ID = empid;
		}else {
			EMP_ID = eid;
		}
		Page<GetHoliday> page = ghService.QueryAllbyId_N(pageable,EMP_ID);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}
	
	@PostMapping("/getsubstituteid")
	@ResponseBody
	public List<Employee>  getSubstituteId(@SessionAttribute("employee") Employee emp) {
		String eid = emp.getId().toString();
		System.out.println("empid="+eid);
		String EMP_ID = "";
		if(eid.isEmpty()) {
			EMP_ID = empid;
		}else {
			EMP_ID = eid;
		}
		return eService.findAllById(EMP_ID);
	}
	
}

package tw.bus.employeeLog.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.bus.employeeLog.model.EmployeeL;
import tw.bus.employeeLog.model.EmployeeLService;

@Controller
@SessionAttributes({"employee"}) 
public class LoginEmpController {
	
	@Autowired
	private EmployeeLService eService;
	
	@GetMapping(path = "/backLoginsystemMain.controller")
	public String processMainPageAction() {
		return "backLogin";
	}
	
	@PostMapping(path = "/EmployeeLogin.controller")
	public String processAction(@RequestParam("id") String id, 
								@RequestParam("pwd") String pwd,Model m) {
		Map<String, String> errors = new HashMap<String, String>(); 
		m.addAttribute("errors", errors);
		
		if(id==null || id.length()==0) {
			errors.put("name", "請輸入帳號");
		}
		
		if(pwd==null || pwd.length()==0) {
			errors.put("pwd", "請輸入密碼");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			return "backLogin";
		}
		
		boolean result = eService.checkLogin(id, pwd);
		
		if(result) {
			
			EmployeeL e = eService.findEmployeeById(id);
		
			m.addAttribute("employee", e);
			
			return "serverindex";
		}
		
		errors.put("msg", "輸入錯誤");
		return "backLogin";
	}
}

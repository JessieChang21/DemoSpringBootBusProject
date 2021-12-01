package tw.bus.members.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.bus.members.model.Members;
import tw.bus.members.model.MembersService;



@Controller
@RequestMapping("/register")
//@SessionAttributes(names = {"totalPages", "totalElememnts"})
public class Registercontroller {

	@Autowired
	private MembersService mService;
	
	@GetMapping("/membersregister.controller")
	public String processMembersAddAction() {
		return "members/membersregister";
	}
	//http://localhost:8081/members/membersregister.controller
	
	@PostMapping("/insert1") 
	@ResponseBody
	public Members processInsertAction(@RequestBody Members m) {
		String encodePwd = new BCryptPasswordEncoder().encode(m.getMemberpwd());
		m.setMemberpwd(encodePwd);
		return mService.insertMembers(m);
	}
	
//	@PostMapping("/insert") 
//	public String processInsertAction(@RequestParam Members m) {
//		String encodePwd = new BCryptPasswordEncoder().encode(m.getMemberpwd());
//		m.setMemberpwd(encodePwd);
//		mService.insertMembers(m);
//		return "members/membersQueryAll";
//	}
	@PostMapping("/insert") 
	public String processInsertAction(@RequestParam("email") String email,
									@RequestParam("membername") String membername, 
									@RequestParam("memberpwd2") String memberpwd2,
									@RequestParam("memberpwd") String memberpwd, Model m) {
		System.out.println("email = "+ email);
		System.out.println("membername = "+ membername);
		System.out.println("memberpwd = "+ memberpwd);
		System.out.println("memberpwd2 = "+ memberpwd2);
		Map<String, String> errors = new HashMap<String, String>(); 
		m.addAttribute("errors", errors);
		
		if(email ==null || email.length()==0) {
			errors.put("email", "請輸入密碼");
		}
		
		if(memberpwd ==null || memberpwd.length()==0) {
			errors.put("pwd", "請輸入密碼");
		}
		
		if(memberpwd2 ==null || memberpwd2.length()==0) {
			errors.put("pwd2", "請輸入密碼");
		}
		
		if(! memberpwd2.equals(memberpwd)) {
			errors.put("pwd2", "請確認密碼");
		}
		
		if(membername ==null ||membername.length()==0) {
			errors.put("name", "請輸入註冊姓名");
		}
		if(errors!=null && !errors.isEmpty()) {
			System.out.println("errors = "+ errors);
			return "/members/membersregister";
		}
		String encodePwd = new BCryptPasswordEncoder().encode(memberpwd);
		Members members = new Members();
		members.setEmail(email);
		members.setMemberpwd(encodePwd);
		members.setMembername(membername);
		Members result = mService.insertMembers(members);
		System.out.println("result = "+ result);
		m.addAttribute(members);
		if(result == null) {
			
			errors.put("msg", "輸入錯誤");
			return "/members/membersregister";
		}
		
		return "index2";
	}
}


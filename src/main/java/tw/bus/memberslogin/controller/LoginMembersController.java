package tw.bus.memberslogin.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import tw.bus.memberslogin.model.LoginMembers;
import tw.bus.memberslogin.model.LoginMembersService;

@Controller
public class LoginMembersController {
	@Autowired
	private LoginMembersService uService;

	// 加密密碼
//	@PostMapping("/createempolyees.controller")
//	public LoginMembers processCreateUserProfilesAction(@RequestBody LoginMembers uProfiles) {
//		String encodePwd = new BCryptPasswordEncoder().encode(uProfiles.getPassword());
//		uProfiles.setPassword(encodePwd);
//		return uService.createUserProfile(uProfiles);
//	}

//	@PostMapping("/empolyeesQueryByName.controller")
//	public UserProfiles processQueryByName() {
//		UserProfiles uProfiles = uService.findByName("louis");
//		boolean result = new BCryptPasswordEncoder().matches("test123", uProfiles.getPassword());
//		System.out.println("result:" + result);
//		return uProfiles;
//	}

//	// 取得登入成功後使用者名稱
//	@GetMapping("/empolyeesPrincipalQuery.controller")
//	public String processPrincipalQuery(Principal p) {
//		String userName = p.getName();
//		System.out.println("result:" + userName);
//		return userName;
//	}
	
	@PostMapping("/welcome")   //post跳轉
	public String emailGetMembersName() {
		System.out.println("hi~/welcome");
		return "index2" ;		
	}

}

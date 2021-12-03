package tw.bus.memberslogin.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import tw.bus.announcemen.model.Announcement;
import tw.bus.announcemen.model.AnnouncementService;
import tw.bus.members.model.Members;
import tw.bus.members.model.MembersService;
import tw.bus.memberslogin.model.LoginMembers;
import tw.bus.memberslogin.model.LoginMembersService;

@Controller
public class LoginMembersController {
	@Autowired
	private LoginMembersService uService;
	
	@Autowired
	private MembersService mService;
	
	@Autowired
	private AnnouncementService announcementService;
	

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
	
//	@PostMapping("/welcome")   //post跳轉
//	public String emailGetMembersName() {
//		System.out.println("hi~/welcome");
//		return "example2" ;		
//	}
	
	@GetMapping("/logoutResult")   //post跳轉
	public String emailGetMembersName() {
		System.out.println("hi~/welcome");
		return "logoutResult" ;		
		}

	@GetMapping("/web")
	public String emailGetMembersName(Authentication authentication ,HttpSession session,Model m) {
		
		System.out.println(authentication.getName());
		System.out.println("hi~/web");
		Members members = mService.findByEmail(authentication.getName());
		System.out.println("member = " + members);
		session.setAttribute("members",members);
		
		List<Announcement> list = announcementService.findtop3();
		m.addAttribute("list",list);
		return "index2";		
	}
}

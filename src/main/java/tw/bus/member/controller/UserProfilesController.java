package tw.bus.member.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import tw.bus.member.model.UserProfiles;
import tw.bus.member.model.UserProfilesService;

@RestController
public class UserProfilesController {
	@Autowired
	private UserProfilesService uService;

	// 加密密碼
	@PostMapping("/createuserprofiles.controller")
	public UserProfiles processCreateUserProfilesAction(@RequestBody UserProfiles uProfiles) {
		String encodePwd = new BCryptPasswordEncoder().encode(uProfiles.getPassword());
		uProfiles.setPassword(encodePwd);
		return uService.createUserProfile(uProfiles);
	}

	@PostMapping("/userprofilesQueryByName.controller")
	public UserProfiles processQueryByName() {
		UserProfiles uProfiles = uService.findByName("louis");
		boolean result = new BCryptPasswordEncoder().matches("test123", uProfiles.getPassword());
		System.out.println("result:" + result);
		return uProfiles;
	}

	// 取得登入成功後使用者名稱
	@GetMapping("/userprofilesPrincipalQuery.controller")
	public String processPrincipalQuery(Principal p) {
		String userName = p.getName();
		System.out.println("result:" + userName);
		return userName;
	}

}

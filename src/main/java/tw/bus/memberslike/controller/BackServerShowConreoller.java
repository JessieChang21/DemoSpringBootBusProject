package tw.bus.memberslike.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BackServerShowConreoller {

	
	@GetMapping("/testbackserver")
	public String processtestnameAction() {
		return "serverindex";
	}
}

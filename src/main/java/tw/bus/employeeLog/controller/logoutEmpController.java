package tw.bus.employeeLog.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@SessionAttributes({"employee"}) 
public class logoutEmpController {

	@GetMapping("/backlogout.controller")
	public String logout(HttpSession session,  Model model, SessionStatus status,
			RedirectAttributes redirectAtt
			) {
//		String name = "";
//		String membername = (String) model.getAttribute("employee");
//		if (membername != null) {
//			name = membername;
//		} else {
//			name = "訪客";
//		}
		String farewellMessage = "您已登出，期待您再次蒞臨本網站";
		redirectAtt.addFlashAttribute("logoutMessage", farewellMessage);
		// 登出時執行下列兩敘述
		status.setComplete();		
		session.invalidate();		
		return "redirect:backLoginsystemMain.controller";		
	}
	

}

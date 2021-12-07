package tw.bus.memberslogin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class LogoutMembersController {

	@GetMapping("/logingout")
	public String logout(HttpSession session,  Model model, SessionStatus status
//			RedirectAttributes redirectAtt
			) {
//		String name = "";
//		Members members = (Members) model.getAttribute("members");
//		if (members != null) {
//			name = members.getMembername();
//		} else {
//			name = "訪客";
//		}
//		log.info(name + "已登出");
//		String farewellMessage = name + "您已登出，期待您再次蒞臨本網站";
//		redirectAtt.addFlashAttribute("logoutMessage", farewellMessage);
		// 登出時執行下列兩敘述
//		status.setComplete();		// 移除@SessionAttributes({"LoginOK"}) 標示的屬性物件
		session.removeAttribute("members");
		session.invalidate();		// 此敘述不能省略		
		return "index2";		// 跳轉回http://localhost:8080/Context_Path/
		
//		return "redirect: /";		// 跳轉回http://localhost:8080/
	}

}

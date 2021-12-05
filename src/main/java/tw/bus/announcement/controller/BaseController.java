package tw.bus.announcement.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;




@Controller
public class BaseController {
	
	
	
	@GetMapping("/3")
	public String index2() {
		return "/announcement/index3";
	}
	@GetMapping("/example")
	public String example() {
		return "example";
	}
	@GetMapping("/serverexample")
	public String example2() {
		return "serverexample";
	}
	
	@GetMapping("/insertOK")
	public String insertOK() {
		return "success";
	}
	@GetMapping("/server")
	public String serverindex() {
		return "serverindex";
	}
	
	
	

	
	
}

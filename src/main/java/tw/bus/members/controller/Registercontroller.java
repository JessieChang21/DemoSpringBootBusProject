package tw.bus.members.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	
	@PostMapping("/insert") 
	@ResponseBody
	public Members processInsertAction(@RequestBody Members m) {
		return mService.insertMembers(m);
	}
}


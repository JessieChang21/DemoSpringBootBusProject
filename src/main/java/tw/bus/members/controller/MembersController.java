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
@RequestMapping("/members")
@SessionAttributes(names = {"totalPages", "totalElememnts"})
public class MembersController {

	@Autowired
	private MembersService mService;
	
	@GetMapping("/membersmain.controller")
	public String processMembersMainAction() {
		return "members/membersQueryAll";
	}
//http://localhost:8081/members/membersmain.controller
	
	
//	@GetMapping("/membersregister.controller")
//	public String processMembersAddAction() {
//		return "members/membersregister";
//	}
//	//http://localhost:8081/members/membersregister.controller
	
	
	@PostMapping("/insert") 
	@ResponseBody
	public Members processInsertAction(@RequestBody Members m) {
		return mService.insertMembers(m);
	}
	
	@PostMapping("/update") 
	@ResponseBody
	public Members processUpdateAction(@RequestBody Members m) {
		return mService.updateMembers(m);
	}
	
	@GetMapping("/delete/{id}") 
	public void processDeleteAction(@PathVariable Long id) {
		mService.deleteMembersById(id);
	}
	
	@PostMapping("/queryByPage/{pageNo}")
	@ResponseBody
	public List<Members> processQueryByPage(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 2;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Members> page = mService.findAllByPage(pageable);
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return page.getContent();
	}
}
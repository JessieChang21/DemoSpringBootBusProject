package tw.bus.announcement.controller;



import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.bus.announcemen.model.LostAndFound;
import tw.bus.announcemen.model.LostAndFoundService;
import tw.bus.announcemen.model.PageAL2;
import tw.bus.announcemen.validators.LostAndFoundValidator;

@SessionAttributes(names = {"totalPages", "totalElements"})
@Controller
public class LostAndFoundController {

	LostAndFoundService lostAndFoundService;

	@Autowired
	public LostAndFoundController(LostAndFoundService lostAndFoundService) {
		this.lostAndFoundService = lostAndFoundService;
	}
	
	@GetMapping("/savelostandfound")
	public String sendEmptyForm(Model m) {
		LostAndFound lostAndFound = new LostAndFound();
		m.addAttribute("lostAndFound",lostAndFound);
		return "/lostandfound/InsertLAFForm";
	}
	
	@PostMapping("/savelostandfound")
	public String insertlaf(LostAndFound lostAndFound, BindingResult bindingResult, Model m) {
		LostAndFoundValidator lostAndFoundValidator = new LostAndFoundValidator();
		lostAndFoundValidator.validate(lostAndFound, bindingResult);
		if(bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors());
			return "/lostandfound/InsertLAFForm";
		}
		lostAndFoundService.insert(lostAndFound);
		return "redirect:/insertOK";
	}
	
	@GetMapping("/showlostandfound")
	public String findAll(Model m) {
		List<LostAndFound> list = lostAndFoundService.findAll();
		m.addAttribute("list", list);
		return "/lostandfound/showLAF";
	}
	@GetMapping("/showlostandfound2")
	public String findAll1(Model m) {
		List<LostAndFound> list = lostAndFoundService.findAll();
		m.addAttribute("list", list);
		return "/lostandfound/showLAF1";
	}
	
	@PostMapping("/selectLAFbyid")
	public String selectbyid(Integer id,Model m,LostAndFound lostAndFound) {
		List<LostAndFound> list2 = new ArrayList<>();
		lostAndFound = lostAndFoundService.findById(id);
		list2.add(lostAndFound);
		m.addAttribute("list2",list2);
		
		List<LostAndFound> list = lostAndFoundService.findAll();
		m.addAttribute("list", list);
		return "/lostandfound/showLAF1";
		
	}
	
	
	@GetMapping("/updatelostandfound/{id}")
	public String updateForm(@PathVariable Integer id,Model m) {
		LostAndFound lostAndFound = lostAndFoundService.findById(id);
		m.addAttribute(lostAndFound);
		return "/lostandfound/UpdateLAFForm";
	}
	
	@PostMapping("/updatelostandfound/{id}")
	public String update(LostAndFound lostAndFound,Model m,BindingResult bindingResult) {
		LostAndFoundValidator lostAndFoundValidator = new LostAndFoundValidator();
		lostAndFoundValidator.validate(lostAndFound, bindingResult);
		
		
		lostAndFoundService.update(lostAndFound);
		return "redirect:/insertOK";
	}
	
	@GetMapping("/deletelostandfound/{id}")
	public String deletebyid(@PathVariable Integer id,Model m,LostAndFound lostAndFound) {
		
		lostAndFound = lostAndFoundService.findById(id);
		m.addAttribute(lostAndFound);
		return "/lostandfound/DeleteLAFForm";
	}
	
	@PostMapping("/deletelostandfound")
	public String delete(Integer id, Model m,LostAndFound lostAndFound) {
		lostAndFoundService.deleteById(id);
		return "redirect:/insertOK";
	}
	
	@PostMapping("/showlafbydate")
	public String findByitdate(@RequestParam("itdate") String itdate,Model m){
		List<LostAndFound> list1 = lostAndFoundService.findByItdateLike("%"+itdate+"%");
		m.addAttribute("list1",list1);
		return "/lostandfound/showLafByDate";
		
	}
	
	@PostMapping("/queryByPage2/{pageNo}")
	@ResponseBody
	public PageAL2 processQueryByPage(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 6;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<LostAndFound> page = lostAndFoundService.findAllByPage(pageable);
		
		PageAL2 pageAL2 = new PageAL2();
		
		pageAL2.setList(page.getContent());
		pageAL2.setPageEles(page.getTotalElements());
		pageAL2.setTolpages(page.getTotalPages());
		
		return pageAL2;
	}
}

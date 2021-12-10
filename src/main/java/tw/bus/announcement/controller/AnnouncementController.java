package tw.bus.announcement.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.bus.announcemen.model.Announcement;
import tw.bus.announcemen.model.AnnouncementService;
import tw.bus.announcemen.model.PageAL;
import tw.bus.announcemen.validators.AnnouncementValidator;

//@SessionAttributes(names = {"totalPages", "totalElements"})
@Controller
public class AnnouncementController {
	
	AnnouncementService announcementService;
	
	@Autowired
	public AnnouncementController(AnnouncementService announcementService) {
		this.announcementService = announcementService;
		
	}
	
	@GetMapping("/saveAnnouncement")
	public String snedEmptyForm(Model m) {
		Announcement announcement = new Announcement();
		m.addAttribute("announcement",announcement);
		return "/announcement/InsertAnnForm";
	}
	
	@PostMapping("/saveAnnouncement")
	public String save(@RequestParam("animages1") MultipartFile mf, Announcement announcement,
						BindingResult bindingResult,Model m,HttpServletRequest request
						) throws IllegalStateException, IOException {
		AnnouncementValidator announcementValidator = new AnnouncementValidator();
		announcementValidator.validate(announcement, bindingResult);
		if(bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors());
			return "/announcement/InsertAnnForm";
		}
		String animages_file = mf.getOriginalFilename();
		
		if(mf.getOriginalFilename().length() ==0) {
			animages_file = announcement.getAnimages();
		}
		
		String realPath = request.getServletContext().getRealPath(".");
		
		String saveDirPath1 = realPath+"\\animages\\";
		
		File saveDirPathFile1 = new File(realPath);
		
		saveDirPathFile1.mkdirs();
		
		String savePath1 = saveDirPath1 + animages_file;
		
		File savePathFile1 = new File(savePath1);
		
		mf.transferTo(savePathFile1);
		
		announcement.setAnimages(animages_file);
		 
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		announcement.setRegisterdate(ts);
		announcementService.insert(announcement);
		return "redirect:/insertOK";
	}
	
	@GetMapping("/showAnnouncement")
	public String findAll(Model m) {
		List<Announcement> list = announcementService.findAll();
		m.addAttribute("list",list);
		return "/announcement/showAnn";
	}
	
	@GetMapping("/mainpage")
	public String findtop3(Model m) {
		List<Announcement> list = announcementService.findtop3();
		m.addAttribute("list",list);
		return "/index2";
	}
	
	@GetMapping("/login/page")
	public String findtop3_2(Model m) {
		List<Announcement> list = announcementService.findtop3();
		m.addAttribute("list",list);
		return "/login";
	}
	
	@GetMapping("/showAnnouncement1")
	public String showAll(Model m) {
		List<Announcement> list = announcementService.findAll();
		m.addAttribute("list",list);
		return "/announcement/showAll";
	}
	
	@GetMapping("/selectAnnouncement")
	public String selectidForm(Model m) {
		Announcement announcement = new Announcement();
		m.addAttribute("announcement",announcement);
		return "/selectAnnidForm";
	}
	
	
	@PostMapping("/selectAnnouncement")
	public String findById(Integer id,Model m,Model m1,Announcement announcement) {
		announcement = announcementService.findById(id);
		List<Announcement> list = new ArrayList<>();
		list.add(announcement);
		m.addAttribute("announcement" , list);
		
		Map<String, String> errors = new HashMap<String, String>();
		m1.addAttribute("errors", errors);
		
		String id1 = Integer.toString(id);
		
		if(announcement == null) {
			return "fail";
		}
		else 
			return "selectAnnid";
	}
	
	@PostMapping("/showannbycate")
	public String findBycategory(@RequestParam("ancategory") String ancategory,Model m){
		List<Announcement> list1 = announcementService.findbyclassify("%"+ancategory+"%");
		m.addAttribute("list1",list1);
		return "/announcement/showAnnBycategory";
		
	}
	
	@GetMapping("/ann01/{id}")
	public String ann(@PathVariable Integer id,Model m,Announcement announcement) {
		announcement = announcementService.findById(id);
		List<Announcement> list = new ArrayList<>();
		list.add(announcement);
		m.addAttribute("ann01" , list);
		return "/announcement/ann01";
	}
	
	@GetMapping("/updateAnnouncement/{id}")
	public String updateForm(@PathVariable Integer id,Model m) {
		Announcement announcement = announcementService.findById(id);
		m.addAttribute(announcement);
		return "/announcement/UpdateAnnForm";
	}
	
	
	@PostMapping("/updateAnnouncement/{id}")
	public String update(
			Integer id,
			@RequestParam("animages2") MultipartFile mf2,
			Announcement announcement,Model m,String animages,
			BindingResult bindingResult,HttpServletRequest request)
			throws IllegalStateException, IOException{
		
		AnnouncementValidator announcementValidator = new AnnouncementValidator();
		announcementValidator.validate(announcement, bindingResult);
		if(bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors());
			return "/announcement/UpdateAnnForm";
		}
		
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		announcement.setRegisterdate(ts);
		
		String animages_file1 = mf2.getOriginalFilename();
		String realPath = request.getServletContext().getRealPath(".");
		String saveDirPath1 = realPath + "\\animages\\";
		File saveDirPathFile1 = new File(realPath);
		saveDirPathFile1.mkdirs();
		String savePath1 = saveDirPath1 +  animages_file1;
		File savePathFile1 = new File (savePath1);
		if (StringUtils.isNotBlank(mf2.getOriginalFilename())) {
			mf2.transferTo(savePathFile1);
		} //圖片
		announcement.setAnimages(animages_file1);
		
		announcementService.update(announcement);
		return "redirect:/insertOK";
	}
	
	@GetMapping("/deleteAnnouncement/{id}")
	public String deletebyid(@PathVariable Integer id,Model m,Announcement announcement) {
		
		announcement = announcementService.findById(id);
		m.addAttribute(announcement);
		return "/announcement/DeleteAnnForm";
	}
	
	@PostMapping("/deleteAnnouncement/{id}")
	public String delete(Integer id, Model m,Announcement announcement) {
		announcementService.deleteById(id);
		return "redirect:/insertOK";
	}
	

	@PostMapping("/queryByPage/{pageNo}")
	@ResponseBody
	public PageAL processQueryByPage(@PathVariable("pageNo") int pageNo, Model m,Model m1){
		int pageSize = 3;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Announcement> page = announcementService.findAllByPage(pageable);
		
		PageAL pga = new PageAL();
		
		pga.setList(page.getContent());
		pga.setPageEles(page.getTotalElements());
		pga.setTolpages(page.getTotalPages());
		
		return pga;
	}
	
}

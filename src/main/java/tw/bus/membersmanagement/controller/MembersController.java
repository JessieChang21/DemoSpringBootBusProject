package tw.bus.membersmanagement.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.FileNameMap;
import java.net.URLConnection;
import java.security.Principal;
import java.sql.Blob;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.bus.members.model.AreaBean;
import tw.bus.members.model.Members;
import tw.bus.members.model.MembersService;
import tw.bus.memberslogin.model.UpdateMembers;
import tw.bus.membersmanagement.model.PageAssistM;
import tw.bus.membersmanagement.model.QueryMembers;
import tw.bus.membersmanagement.model.QueryMembersService;


@Controller
//@RequestMapping("/members")
//@SessionAttributes(names = {"totalPages", "totalElememnts"})
public class MembersController {

	@Autowired
	private MembersService mService;
	
	@Autowired
	private QueryMembersService qService;
	
	@GetMapping("/membersmain.controller")
	public String processMembersMainAction() {
		return "members/membersQueryAll";
	}
	
	@GetMapping("/testname")
	public String processtestnameAction() {
//		System.out.println(p.getName());Principal p
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
//		
		System.out.println(username);
		return username;
	}
	
	@GetMapping("/search/{email}") 
	@ResponseBody
	public QueryMembers processSearchAction(@PathVariable("email") String email) {
		QueryMembers qmember = qService.findByEmail(email);
		return qmember;
	}
	
	@PostMapping("/insert") 
	@ResponseBody
	public Members processInsertAction(@RequestBody Members m) {
		byte[] b = null;
		Blob blob = null;
		InputStream is = null;
		try {
			ClassPathResource cpr = new ClassPathResource("/static/images/NoImage.png");
			is = cpr.getInputStream();
            System.out.println("is1 = "+is);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            
            int len = 0;
	        byte[] bytes = new byte[8192];
	        
	        while ((len = is.read(bytes)) != -1) {
	            baos.write(bytes, 0, len);
            }
	        b = baos.toByteArray();
			blob = new SerialBlob(b);
			
		} catch (Exception e) {				
			e.printStackTrace();
		}
		m.setMemberImage(blob); 
		m.setFileName("NoImage.png");
		m.setMimeType("image/png");
		m.setAge("保密");
		String encodePwd = new BCryptPasswordEncoder().encode(m.getMemberpwd());
		m.setMemberpwd(encodePwd);
		return mService.insertMembers(m);
	}
	
	@PostMapping("/update") 
	@ResponseBody
	public QueryMembers processUpdateAction(@RequestBody QueryMembers qmembers) {
		return qService.updateMembers(qmembers);
	}
	
	@GetMapping("/delete/{id}") 
	public void processDeleteAction(@PathVariable Long id) {
		mService.deleteMembersById(id);
	}
	
//	@PostMapping("/membersqueryByPage/{pageNo}")
//	@ResponseBody
//	public List<QueryMembers> processQueryByPage(@PathVariable("pageNo") int pageNo, Model m){
//		int pageSize = 3;
//		Pageable pageable = PageRequest.of(pageNo-1, pageSize, Sort.by(Sort.Direction.DESC,"id"));
//		Page<QueryMembers> page = qService.findAllByPage(pageable);
//		m.addAttribute("totalPages", page.getTotalPages());
//		m.addAttribute("totalElements", page.getTotalElements());
//		return page.getContent();
//	}

	@PostMapping("/membersqueryByPage/{pageNo}")
	@ResponseBody
	public PageAssistM processQueryByPage(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 3;
		Sort sort = Sort.by(Sort.Direction.DESC, "id");
		Pageable pageable = PageRequest.of( (pageNo-1), pageSize, sort);
		Page<QueryMembers> page = qService.findAllByPage(pageable);
		
		PageAssistM memberspage = new PageAssistM();
		memberspage.setList(page.getContent());
		memberspage.setPageEles(page.getTotalElements());
		memberspage.setTolpages(page.getTotalPages());
		return memberspage;
	}
}
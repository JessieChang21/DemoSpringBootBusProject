package tw.bus.memberslogin.controller;

import java.net.FileNameMap;
import java.net.URLConnection;
import java.sql.Blob;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import tw.bus.members.model.CityService;
import tw.bus.members.model.EmailSenderService;
import tw.bus.members.model.AdressBean;
import tw.bus.members.model.AdressRepository;
import tw.bus.members.model.AdressService;
import tw.bus.members.model.AgelevelBean;
import tw.bus.members.model.AgelevelService;
import tw.bus.members.model.AreaBean;
import tw.bus.members.model.AreaService;
import tw.bus.members.model.CityBean;
import tw.bus.members.model.Members;
import tw.bus.memberslogin.model.UpdateMemberService;
import tw.bus.memberslogin.model.UpdateMembers;
import tw.bus.membersmanagement.model.QueryMembers;

@Controller
public class UpdateMembersController {

	
	CityService aService;
	
	
	AreaService areaService;
	
	
	AdressService adressService;
	
	
	UpdateMemberService uService;
	
	
	AgelevelService agelevelService;
	
	
	EmailSenderService senderService;
	
	
	ServletContext context;
	
	@Autowired
	public UpdateMembersController(CityService aService, AreaService areaService, AdressService adressService,
			UpdateMemberService uService,AgelevelService agelevelService, EmailSenderService senderService) {
		this.aService = aService;
		this.areaService = areaService;
		this.adressService = adressService;
		this.uService = uService;
		this.agelevelService = agelevelService;
		this.senderService = senderService;
	}


	@PostMapping("/sendeMail")
	@ResponseBody
	public Map sendEmail(@RequestBody Map<String, String> o
//			,Model model
			) throws MessagingException {
		// 註冊的前置作業，你要自行完成
		// 假設前端會送一Email Address來後端，本範例將假設放在參數：emailAddress內
//		Map<String, String> map = (Map<String, String>) session.getAttribute("randomCode");
//		if (map == null) {
//			map = new HashMap<>();
//			session.setAttribute("randomCode", map);
//		}
		System.out.println(o);
		String email = (String) o.get("email");
		System.out.println(email);
		String random = randomCode();
//		map.put(random, random);
		System.out.println("random=" + random);
		senderService.sendMineEmail(email, "歡迎您修改 無事坐BUS 的會員密碼", "請於10分鐘內輸入驗證碼 : " + 
				random + "<br>");
//		model.addAttribute("random", random);
		o.put("random", random);
		return o;
	}
	
	public String randomCode(){
		  StringBuilder str = new StringBuilder();
		  Random random = new Random();
		  for (int i = 0; i < 6; i++) {
		   str.append(random.nextInt(10));
		  }
		  return str.toString();
		 }
	
	// 取得登入成功後使用者資料
	@GetMapping("/updatemembers.controller")
	public String processPrincipalQuery(@SessionAttribute Members members, Model m,
										HttpServletRequest request) {
		System.out.println(members);
		UpdateMembers umembers = new UpdateMembers();
		umembers.setFileName(members.getFileName());
        umembers.setMimeType(members.getMimeType());
        umembers.setMemberImage(members.getMemberImage());
		System.out.println("umembers="+umembers);
		HttpSession session = request.getSession();
		session.setAttribute("umembers",umembers);
		m.addAttribute("members",members);
//		return "members/updatemembers";
		return "members/updatemembers";
	}
	
	
	@PostMapping(path = "/memberupdate.controller" )
	public String updateAction(
//			@RequestPart("members") @Valid Members members,
//			@RequestPart("file") @Valid  MultipartFile file,
			@ModelAttribute("members")  Members members,
			@SessionAttribute("umembers") UpdateMembers umembers,
									//BindingResult result, @ModelAttribute("members") 
									Model model,
									HttpServletRequest request) {
		
		System.out.println("umembers="+umembers);
		System.out.println("members.getMemberMultipartFile()="+members.getMemberMultipartFile());
//		if(members.getMemberMultipartFile() != null) {
			MultipartFile picture = members.getMemberMultipartFile();
			System.out.println(members.getMemberMultipartFile());
	//		MultipartFile picture = file;
			String originalFilename = picture.getOriginalFilename();
			System.out.println(picture);
			System.out.println(originalFilename);
			
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				members.setFileName(originalFilename);
			}
			// 建立Blob物件，交由 Hibernate 寫入資料庫
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					System.out.println(blob);
					members.setMemberImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}//getMimeType(originalFilename);
			//String mimeType = servletContext.
			//String mimeType = originalFilename.getMimeType();
			FileNameMap fileNameMap = URLConnection.getFileNameMap();
			String mimeType = fileNameMap.getContentTypeFor(originalFilename);
	        members.setMimeType(mimeType);
	//        UpdateMembers umembers = new UpdateMembers();
	//        BeanUtils.copyProperties(members, umembers);
	//        UpdateMembers umembers = uService.findById(members.getId());
	        if(members.getMimeType() == null) {
	        	members.setFileName(umembers.getFileName());
		        members.setMimeType(umembers.getMimeType());
		        members.setMemberImage(umembers.getMemberImage());
	        }
	        
	        System.out.println("members.getAge()="+members.getAge());
	        AgelevelBean agelevel = agelevelService.findById(Integer.valueOf(members.getAge()));
	        System.out.println("agelevel="+agelevel);
	        members.setAge(agelevel.getAgelevel());
	        
	        System.out.println("members.getAdress()="+members.getAdress());
	        AreaBean areabean = areaService.findByAreaname(members.getAdress());
	        System.out.println("areabean="+areabean);
	        Integer adressid= areabean.getId();
	        System.out.println("adressid="+adressid);
	        AdressBean adressbean = adressService.findById(adressid);
	        System.out.println("adressbean.getAdressName()="+adressbean.getAdressName());
	        members.setAdress(adressbean.getAdressName());
	        
	        String encodePwd = new BCryptPasswordEncoder().encode(members.getMemberpwd());
			members.setMemberpwd(encodePwd);
	       
	        System.out.println("members.getAdress()="+members.getAdress());
	        System.out.println(members);
	        umembers.setId(members.getId());
	        umembers.setEmail(members.getEmail());
	        umembers.setMembername(members.getMembername());
	        umembers.setMemberpwd(members.getMemberpwd());
	        umembers.setGender(members.getGender());
	        umembers.setAge(members.getAge());
	        umembers.setAdress(members.getAdress());
	        umembers.setFileName(members.getFileName());
	        umembers.setMimeType(members.getMimeType());
	        umembers.setMemberImage(members.getMemberImage());
		
	        System.out.println("umembers="+umembers);
	        System.out.println("members="+members);
	      
		try {
			HttpSession session = request.getSession();
			session.setAttribute("members",umembers);
			uService.updateMembers(umembers);

		} 
		catch (Exception ex) {
			ex.printStackTrace();
			return "members/updatemembers";
		}  
	
			return "index2";
	}
	
	
	@GetMapping("/membersAdressjsp")
	public String processadress(Model m){

//		List<CityBean> citybean = aService.findAll();
//		m.addAttribute("totalPages", citybean);
		return "adresstest";
	}
	
	
	@PostMapping("/membersAdress")
	@ResponseBody
	public List<CityBean> processCity(Model m){

		List<CityBean> citybean = aService.findAll();
//		m.addAttribute("totalPages", citybean);
		return citybean;
	}
	
	@PostMapping("/Adressarea")
	@ResponseBody
	public Set<AreaBean> processArea(@RequestBody Map<String, String> o){

		String city = (String) o.get("seled");
		CityBean citybean = aService.findByCityname(city);
		Set<AreaBean> adressarae = citybean.getAreabean();
//		m.addAttribute("totalPages", citybean);
//		o.put("random", adressarae);
		return adressarae;
	}
}

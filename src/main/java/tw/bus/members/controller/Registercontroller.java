package tw.bus.members.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.bus.announcemen.validators.AnnouncementValidator;
import tw.bus.members.model.EmailSenderService;
import tw.bus.members.model.Members;
import tw.bus.members.model.MembersService;
import tw.bus.members.validate.MembersValidator;
import tw.bus.memberslogin.controller.LoginMembersController;
import tw.bus.memberslogin.model.EncodePwdUtil;
import tw.bus.memberslogin.model.LoginMembers;



@Controller
@RequestMapping("/register")
//@SessionAttributes(names = {"totalPages", "totalElememnts"})
public class Registercontroller {

	@Autowired
	private MembersService mService;
	
	@Autowired
	private EmailSenderService senderService;
	
//	String noImagePath = "/../static/images/NoImage.png";
	String noImagePath = "/animages/images01.jpg";
	
	ServletContext context;
	
	@GetMapping("/membersregister.controller")
	public String processMembersAddAction(Model m) {
		LoginMembers lmembers = new LoginMembers();
		Members members = new Members();
		m.addAttribute("lmembers",lmembers);
		m.addAttribute("members",members);
		return "login";
	}
	
	@PostMapping("/membersregister.controller") 
	public String processInsertAction(@ModelAttribute("members")Members members,
										Model m, BindingResult bindingResult, HttpSession session) {
		
		MembersValidator membersValidator = new MembersValidator();
		membersValidator.validate(members, bindingResult);
		if(bindingResult.hasErrors()) {
			System.out.println(bindingResult.getAllErrors());
			LoginMembers lmembers = new LoginMembers();
			m.addAttribute("lmembers",lmembers);
			return "login";
		}
		if (mService.existsByEmail(members.getEmail())) {
			bindingResult.rejectValue("email", "", "帳號已存在，請重新輸入");
			LoginMembers lmembers = new LoginMembers();
			m.addAttribute("lmembers",lmembers);
			return "login";
		}
		
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
		members.setMemberImage(blob); 
		members.setFileName("NoImage.png");
		members.setMimeType("image/png");
		members.setAge(1);
		members.setMemberpwd(getMD5Endocing(EncodePwdUtil.encryptString(members.getMemberpwd())));
		System.out.println("membersout = "+members);
		mService.insertMembers(members);
		session.setAttribute("members",members);
		return "index2";
	}
	
//	@PostMapping("/membersregister.controller") 
//	public String processInsertAction(@ModelAttribute("members")Members members,
//										Model m, BindingResult bindingResult, HttpSession session) {
//		
//		MembersValidator membersValidator = new MembersValidator();
//		membersValidator.validate(members, bindingResult);
//		if(bindingResult.hasErrors()) {
//			System.out.println(bindingResult.getAllErrors());
//			LoginMembers lmembers = new LoginMembers();
//			m.addAttribute("lmembers",lmembers);
//			return "login";
//		}
//		if (mService.existsByEmail(members.getEmail())) {
//			bindingResult.rejectValue("email", "", "帳號已存在，請重新輸入");
//			LoginMembers lmembers = new LoginMembers();
//			m.addAttribute("lmembers",lmembers);
//			return "login";
//		}
//		
//		byte[] b = null;
//		String filename = null;
//		String mimeType = null;
//		Blob blob = null;
////		MultipartFile mf = members.getMemberMultipartFile();
//		try {
//			System.out.println("noImagePath = "+noImagePath);
//			b = convertToByteArray("/webapp/animage/images01.png");
//			System.out.println("b = "+b);
//			filename = noImagePath.substring(noImagePath.lastIndexOf("/") + 1);
//			mimeType = context.getMimeType(filename);
//
//			blob = new SerialBlob(b);
//			members.setFileName(filename);
//			members.setMemberImage(blob);
//			members.setMimeType(mimeType);
//			System.out.println("filename1 = "+filename);
//			System.out.println("blob1 = "+blob);
//			System.out.println("mimeType1 = "+mimeType);
//			System.out.println("membersin = "+members);
//		} catch (Exception e) {				
//			e.printStackTrace();
//		} 
//		System.out.println("filename2 = "+filename);
//		System.out.println("blob2 = "+blob);
//		System.out.println("mimeType2 = "+mimeType);
//		members.setFileName(filename);
//		members.setMemberImage(blob);
//		members.setMimeType(mimeType);
//		members.setAge(1);
//		members.setMemberpwd(getMD5Endocing(EncodePwdUtil.encryptString(members.getMemberpwd())));
//		System.out.println("membersout = "+members);
//		mService.insertMembers(members);
//		session.setAttribute("members",members);
//		return "index2";
//	}
	
	public byte[] convertToByteArray(String path) {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
//		CharArrayWriter caw = new CharArrayWriter(); //文件
//		char[] c = caw.toCharArray();
		try {
			System.out.println("path = "+path);
			InputStream is = context.getResourceAsStream(path);
			System.out.println("is = "+is);
			byte[] b = new byte[81920];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return baos.toByteArray();
	}
	
	public static String getMD5Endocing(String message) {
		final StringBuffer buffer = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(message.getBytes());
			byte[] digest = md.digest();

			for (int i = 0; i < digest.length; ++i) {
				final byte b = digest[i];
				final int value = Byte.toUnsignedInt(b);
				buffer.append(value < 16 ? "0" : "");
				buffer.append(Integer.toHexString(value));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		return buffer.toString();
	}
	
//	@PostMapping("/membersregister.controller") 
//	public String processInsertAction(@ModelAttribute("members")Members member,
//										Model m, BindingResult bindingResult, HttpSession session) {
//		
//		MembersValidator membersValidator = new MembersValidator();
//		membersValidator.validate(member, bindingResult);
//		if(bindingResult.hasErrors()) {
//			System.out.println(bindingResult.getAllErrors());
//			return "login";
//		}
//		String encodePwd = new BCryptPasswordEncoder().encode(member.getMemberpwd());
//		member.setMemberpwd(encodePwd);
//		mService.insertMembers(member);
//		session.setAttribute("members",member);
//		return "index2";
//	}
	
//	@GetMapping("/sendemail.controller")
//	public String sendEmailAction(Model m) {
//		return "members/membersregister";
//	}
	
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
		senderService.sendMineEmail(email, "歡迎您註冊成為 無事坐BUS 的會員", "請於10分鐘內輸入驗證碼 : " + 
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
	
//	@PostMapping("/insert") 
//	public String processInsertAction(@RequestParam("email") String email,
//									@RequestParam("membername") String membername, 
//									@RequestParam("memberpwd2") String memberpwd2,
//									@RequestParam("memberpwd") String memberpwd, Model m) {
//		System.out.println("email = "+ email);
//		System.out.println("membername = "+ membername);
//		System.out.println("memberpwd = "+ memberpwd);
//		System.out.println("memberpwd2 = "+ memberpwd2);
//		Map<String, String> errors = new HashMap<String, String>(); 
//		m.addAttribute("errors", errors);
//		
//		if(email ==null || email.length()==0) {
//			errors.put("email", "請輸入密碼");
//		}
//		
//		if(memberpwd ==null || memberpwd.length()==0) {
//			errors.put("pwd", "請輸入密碼");
//		}
//		
//		if(memberpwd2 ==null || memberpwd2.length()==0) {
//			errors.put("pwd2", "請輸入密碼");
//		}
//		
//		if(! memberpwd2.equals(memberpwd)) {
//			errors.put("pwd2", "請確認密碼");
//		}
//		
//		if(membername ==null ||membername.length()==0) {
//			errors.put("name", "請輸入註冊姓名");
//		}
//		if(errors!=null && !errors.isEmpty()) {
//			System.out.println("errors = "+ errors);
//			return "/members/membersregister";
//		}
//		String encodePwd = new BCryptPasswordEncoder().encode(memberpwd);
//		Members members = new Members();
//		members.setEmail(email);
//		members.setMemberpwd(encodePwd);
//		members.setMembername(membername);
//		Members result = mService.insertMembers(members);
//		System.out.println("result = "+ result);
//		m.addAttribute(members);
//		if(result == null) {
//			
//			errors.put("msg", "輸入錯誤");
//			return "/members/membersregister";
//		}
//		
//		return "index2";
//	}
}

package tw.bus.memberslogin.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.FileNameMap;
import java.net.URLConnection;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.validation.Valid;
import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.bus.announcemen.model.Announcement;
import tw.bus.announcemen.model.AnnouncementService;
import tw.bus.members.model.EmailSenderService;
import tw.bus.members.model.Members;
import tw.bus.members.model.MembersService;
import tw.bus.memberslogin.model.EncodePwdUtil;
//import tw.bus.memberslogin.model.LoginMembers;
//import tw.bus.memberslogin.model.LoginMembersService;
import tw.bus.memberslogin.model.UpdateMemberService;
import tw.bus.memberslogin.model.UpdateMembers;
import tw.bus.memberslogin.model.UpdateMembersRespository;

@Controller
//@SessionAttributes(types=Members.class)
public class LoginMembersController {
	
	@Autowired
	private MembersService mService;
	
//	@Autowired
//	private LoginMembersService lService;
	
	@Autowired
	private UpdateMemberService uService;
	
	@Autowired
	private EmailSenderService senderService;
	
	@Autowired
	private AnnouncementService announcementService;

	ServletContext context;

//	@GetMapping("/login")
//	public String login00(HttpServletRequest request, Model model, 
//		@CookieValue(value="username", required = false, defaultValue="") String username,
//		@CookieValue(value="password", required = false) String password,
//		@CookieValue(value="rm", required = false) Boolean rm 
//			) {
////		if (user == null)
////			user = "";
//		if (password == null) {
//			password = "";
//		} else {
//			password = EncodePwdUtil.decryptString(EncodePwdUtil.KEY, password);
//		}
//		
//		if (rm != null) {
//			rm = Boolean.valueOf(rm);
//		} else {
//			rm = false;
//		}
//			
//		LoginMembers lmembers = new LoginMembers(username, password, rm);
//		model.addAttribute(lmembers);	
//		System.out.println("送出登入表單, userId=" + username);
//		return "login";
//	}
//	
//	
//	
//	@PostMapping("/login")
//	public String checkAccount(
//			@ModelAttribute("bean") LoginMembers lmembers,
//			BindingResult result, Model model,
//			HttpServletRequest request, HttpServletResponse response) {
//		
////		LoginBeanValidator validator = new LoginBeanValidator();
////		validator.validate(bean, result);
////		if (result.hasErrors()) {
////		Members members = new Members();
////		model.addAttribute("members",members);
////			return loginForm;
////		}
//		System.out.println(lmembers);
//		String password =lmembers.getPassword();
//		System.out.println(lmembers.getPassword());
//		System.out.println(lmembers.getUsername());
//		Members members = new Members();
//		try {
//			// 呼叫 loginService物件的 checkIDPassword()，傳入userid與password兩個參數
//			members = mService.findByEmailAndPassword(lmembers.getUsername(),  
//					EncodePwdUtil.getMD5Endocing(EncodePwdUtil.encryptString(password)));
//			System.out.println(members);
//			if (members!= null) {
//				
//				// OK, 登入成功, 將mb物件放入Session範圍內，識別字串為"LoginOK"
////				model.addAttribute("members", members);
////				log.info("登入成功，MemberBean=" + mb);
//			} else {
//				// NG, 登入失敗, userid與密碼的組合錯誤，放相關的錯誤訊息到 errorMsgMap 之內
////				result.rejectValue("invalidCredentials", "", "該帳號不存在或密碼錯誤");
////				log.info("登入失敗，userid=" + bean.getUserId() + ", 密碼=" + password);
//				return "login";
//			}
//		} catch (RuntimeException ex) {
////			result.rejectValue("invalidCredentials", "", ex.getMessage());
//			ex.printStackTrace();
//			return "login";
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		HttpSession session = request.getSession();
////		Members member = mService.findByEmail(members.getEmail());
//		session.setAttribute("members",members);
//		processCookies(members, request, response);
//		System.out.println(members.getId());
//		String nextPath = (String)session.getAttribute("requestURI");
//		if (nextPath == null) {
//			nextPath = request.getContextPath();
//			return "index2";
//		}
//		return "redirect: " + nextPath;
//	}
//	
//	private void processCookies(Members member, HttpServletRequest request, HttpServletResponse response) {
//
//		Cookie cookieUsername = null;
//		Cookie cookiePassword = null;
//		Cookie cookieRememberMe = null;
//		Cookie cookieemail=null;
//
//		String memberemail = member.getEmail();
//		String password = member.getMemberpwd();
//		String membername = member.getMembername();
//		
//		// rm存放瀏覽器送來之RememberMe的選項，如果使用者對RememberMe打勾，rm就不會是null
//		if (member.isRememberme()) {
//			
//			cookieemail = new Cookie("user", memberemail);
//			cookieemail.setMaxAge(7 * 24 * 60 * 60);
//			cookieemail.setPath(request.getContextPath());
//			
//			cookieUsername = new Cookie("user", membername);
//			cookieUsername.setMaxAge(7 * 24 * 60 * 60);       // Cookie的存活期: 七天
//			cookieUsername.setPath(request.getContextPath());
//
//			String encodePassword = EncodePwdUtil.encryptString(password);
//			cookiePassword = new Cookie("password", encodePassword);
//			cookiePassword.setMaxAge(7 * 24 * 60 * 60);
//			cookiePassword.setPath(request.getContextPath());
//
//			cookieRememberMe = new Cookie("rm", "true");
//			cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
//			cookieRememberMe.setPath(request.getContextPath());
//		} else { // 使用者沒有對 RememberMe 打勾
//			cookieemail = new Cookie("user", memberemail);
//			cookieemail.setMaxAge(0);
//			cookieemail.setPath(request.getContextPath());
//			
//			cookieUsername = new Cookie("user", membername);
//			cookieUsername.setMaxAge(0); // MaxAge==0 表示要請瀏覽器刪除此Cookie
//			cookieUsername.setPath(request.getContextPath());
//
//			String encodePassword = EncodePwdUtil.encryptString(password);
//			cookiePassword = new Cookie("password", encodePassword);
//			cookiePassword.setMaxAge(0);
//			cookiePassword.setPath(request.getContextPath());
//
//			cookieRememberMe = new Cookie("rm", "true");
//			cookieRememberMe.setMaxAge(0);
//			cookieRememberMe.setPath(request.getContextPath());
//		}
//		response.addCookie(cookieemail);
//		response.addCookie(cookieUsername);
//		response.addCookie(cookiePassword);
//		response.addCookie(cookieRememberMe);
//		
//	}
	
//	@PostMapping("/getusername")
//	@ResponseBody
//	public Map getUserName(@RequestBody Map<String, String> o) {
//
//		System.out.println("o =" +o);
//		String email = (String) o.get("logemail");
//		System.out.println("email =" +email);
//		if(email.isEmpty()) {
//			o.put("error", "請輸入正確Email");
//			return o;
//		}
//		
//		LoginMembers members = new LoginMembers();
//		members = lService.findByLogemail(email);
//		String membername = members.getUsername();
//		o.put("membername", membername);
//		return o;
//	}
	
	@PostMapping("/forgetpasswordsend") 
	@ResponseBody
	public Map forgetpasswordsendEmail(@RequestBody Map<String, String> o) throws MessagingException {
		
		String email = (String) o.get("email");
		System.out.println(email);
		if (mService.existsByEmail(email)){
			Members member = new Members();
			member = mService.findByEmail(email);
			String random = randomCode();
			System.out.println("random=" + random);
			String encodePwd = new BCryptPasswordEncoder().encode(random);
			member.setMemberpwd(encodePwd);
			senderService.sendMineEmail(email, "歡迎您進入 無事坐BUS 的會員密碼中心", "請輸入您的新密碼 : " + 
					random + "登入後請至 --> 會員中心 --> 修改密碼");
			mService.updateMembers(member);
			o.put("email", email);
			return o;
		}
		Map<String, String> error = new HashMap<>();
		return error;
	}
	
	 public String randomCode(){
		  StringBuilder str = new StringBuilder();
		  Random random = new Random();
		  for (int i = 0; i < 8; i++) {
		   str.append(random.nextInt(10));
		  }
		  return str.toString();
		 }
	
	
	@GetMapping("/getMemberImage")
	public ResponseEntity<byte[]> getProductImage(@RequestParam("id") Long id) {
		ResponseEntity<byte[]> re = null;
		try {
			Members members = mService.findById(id);
			Blob blob = members.getMemberImage();
			String mimeType = members.getMimeType();
			byte[] b = blob.getBytes(1, (int) blob.length());
			HttpHeaders headers = new HttpHeaders();
			MediaType mediaType = MediaType.valueOf(mimeType);
			headers.setContentType(mediaType);
			re = new ResponseEntity<byte[]>(b, headers, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return re;
	}
	
	public byte[] convertToByteArray(String path) {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
//		CharArrayWriter caw = new CharArrayWriter(); //文件
//		char[] c = caw.toCharArray();
		try {
			InputStream is = context.getResourceAsStream(path);
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
	
	@PostMapping("/login/error")
	public String loginerror(Model m) {
		
		System.out.println("hi~/error");
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		errorMsgMap.put("error", "帳號及密碼錯誤");
		m.addAttribute("error",errorMsgMap);
		return "login";		
	}
	
//	@GetMapping("/login")
//	public ModelAndView login(
//	    @RequestParam(value = "error", required = false) String error,
//	    @RequestParam(value = "logout", required = false) String logout) {
//
//	    ModelAndView model = new ModelAndView();
//	    if (error != null) {
//	        model.addObject("error", "帳號及密碼錯誤");
//	    }
//
//	    if (logout != null) {
//	        model.addObject("msg", "您以登出");
//	    }
//	    model.setViewName("login");
//
//	    return model;
//
//	}
	
	@GetMapping("/web")
	public String emailGetMembersName(Authentication authentication ,HttpSession session,
			Model m) {
		
		System.out.println("hi~/web");
		System.out.println(authentication.getName());
		
		Members members = mService.findByEmail(authentication.getName());
		List<Announcement> list = announcementService.findtop3();
		m.addAttribute("list",list);
		System.out.println("member = " + members);
		session.setAttribute("members",members);
		return "index2";		
	}
	
}
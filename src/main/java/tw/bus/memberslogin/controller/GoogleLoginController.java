package tw.bus.memberslogin.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.sql.Blob;

import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.bus.members.model.Members;
import tw.bus.members.model.MembersService;

@Controller
public class GoogleLoginController {
	
	@Autowired
	private MembersService mService;
	
    @RequestMapping(value = "/user")
    public String user(Principal principal, HttpSession session) throws JsonGenerationException, JsonMappingException, IOException, JSONException {
     System.out.println(principal.toString());
        ObjectMapper mapper = new ObjectMapper();
         String user = mapper.writeValueAsString(principal);
         System.out.println(user);
         
         String str1 = user.substring(0, user.indexOf("]"));
         String str2 = user.substring(str1.length()+1, user.length());
//         System.out.println("擷取str2:"+str2);
         
         int index = str2.indexOf(":");
         index = str2.indexOf(":", index + 1);
         String str3 = str2.substring(index + 1);
//         System.out.println("擷取str3:"+str3);
         
         String str4 = str3.substring(0, str3.indexOf('"'));
         String str5 = str3.substring(str4.length()+1, str3.length());
//         System.out.println("擷取str5:"+str5);
         
         String membername = str5.substring(0, str5.indexOf('"'));
//         System.out.println("擷取membername:"+membername);
         
         int index2 = str5.indexOf("}");
         index2 = str5.indexOf("}", index2+ 1);
         String str6 = str5.substring(index2 + 1);
//         System.out.println("擷取str6:"+str6);
         
         String str7 = str6.substring(0, str6.indexOf(":"));
         String str8 = str6.substring(str7.length()+1, str6.length());
//         System.out.println("擷取str8:"+str8);
         
         String str9 = str8.substring(0, str8.indexOf('"'));
         String str10 = str8.substring(str9.length()+1, str8.length());
//         System.out.println("擷取str5:"+str10);
         
         String email = str10.substring(0, str10.indexOf('"'));
         System.out.println("email:"+email);
         System.out.println("membername:"+membername);
         
         if(mService.existsByEmail(email)) {
        	 Members members = mService.findByEmail(email);
        	 session.setAttribute("members",members);
        	 
         }else {
        	 Members members = new Members();
        	 
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
     		members.setAge("保密");
     		
	         members.setEmail(email);
	         members.setMembername(membername);
	         
	         System.out.println("members="+members);
	         session.setAttribute("members",members);
	         mService.insertMembers(members);
         }
 
       return "index2";
    }
    
//    @GetMapping("/web")
//	public String emailGetMembersName(Authentication authentication ,HttpSession session) {
//		
//		System.out.println("hi~/web");
//		System.out.println(authentication.getName());
//		
//		Members members = mService.findByEmail(authentication.getName());
//		System.out.println("member = " + members);
//		session.setAttribute("members",members);
//		return "index2";		
//	}
    
}



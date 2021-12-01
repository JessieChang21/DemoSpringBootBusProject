package tw.bus.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import tw.bus.members.model.Members;
import tw.bus.members.model.MembersService;


@Component("myAuthenticationSuccessHandler")
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	private MembersService mService;

	
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		System.out.println(authentication.getName());
		System.out.println("hi~/web");
		Members members = mService.findByEmail(authentication.getName());
		System.out.println("member = " + members);
		request.setAttribute("members", members);
		request.getRequestDispatcher("/welcome").forward(request,response);

	}

}

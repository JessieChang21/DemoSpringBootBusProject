//package tw.bus.memberslogin.model;
//
//import java.util.Collections;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//@Service
//@Transactional
//public class AuthUserDetailsService implements UserDetailsService {
//
//	@Autowired
//	private LoginMembersService uService;
//	
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		LoginMembers loginmember = uService.findByEmail(username);
//		return new User(loginmember.getEmail(),loginmember.getPassword(),Collections.emptyList());
//	}
//
//}

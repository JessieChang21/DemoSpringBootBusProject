package tw.bus.memberslogin.model;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.bus.members.model.Members;
import tw.bus.members.model.MembersService;

@Service
@Transactional
public class AuthUserDetailsService implements UserDetailsService {

	@Autowired
	private MembersService mService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println(username);
		Members member = mService.findByEmail(username);
		System.out.println(member);
		return new User(member.getEmail(),member.getMemberpwd(),Collections.emptyList());
	}

}

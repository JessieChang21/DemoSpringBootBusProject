package tw.bus.member.model;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional
public class AuthUserDetailsService implements UserDetailsService {

	@Autowired
	private UserProfilesService uService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserProfiles uprofiles = uService.findByName(username);
		return new User(uprofiles.getName(),uprofiles.getPassword(),Collections.emptyList());
	}

}

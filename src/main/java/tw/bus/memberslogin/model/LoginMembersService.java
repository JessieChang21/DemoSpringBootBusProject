package tw.bus.memberslogin.model;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.bus.exception.UserNotFoundException;


@Service
@Transactional
public class LoginMembersService {
	@Autowired
	private LoginMembersRespository uResp;
	
//	public UserProfiles findByName(String name) {
//		 Optional<UserProfiles> opl = uResp.findByName(name);
//		 
//		 if(opl.isEmpty()) {
//			 throw new UserNotFoundException("Can't find user!");
//		 }
//		 return opl.get();
//	}
	
	public LoginMembers findByEmail(String email) {
		 Optional<LoginMembers> opl = uResp.findByEmail(email);
		 
		 if(opl.isEmpty()) {
			 throw new UserNotFoundException("Can't find user!");
		 }
		 return opl.get();
	}
	
	public LoginMembers createUserProfile(LoginMembers uProfiles) {
		return uResp.save(uProfiles);
	}
}

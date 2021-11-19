package tw.bus.member.model;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.bus.exception.UserNotFoundException;



@Service
@Transactional
public class UserProfilesService {
	@Autowired
	private UserProfilesRespository uResp;
	
	public UserProfiles findByName(String name) {
		 Optional<UserProfiles> opl = uResp.findByName(name);
		 
		 if(opl.isEmpty()) {
			 throw new UserNotFoundException("Can't find user!");
		 }
		 return opl.get();
	}
	
	public UserProfiles createUserProfile(UserProfiles uProfiles) {
		return uResp.save(uProfiles);
	}
}

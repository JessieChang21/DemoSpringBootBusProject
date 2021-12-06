package tw.bus.memberslogin.model;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.bus.members.model.Members;


@Service
@Transactional
public class UpdateMemberService {
	
	@Autowired
	private UpdateMembersRespository URpo; 

	public UpdateMembers findById(Long id) {
		Optional<UpdateMembers> op1 = URpo.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	public UpdateMembers updateMembers(UpdateMembers umember) {
		return URpo.save(umember);
	}
}

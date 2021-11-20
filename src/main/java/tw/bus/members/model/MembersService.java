package tw.bus.members.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MembersService {

	@Autowired
	private MemberRepository memberRpo;
	
	public List<Members> findAll(){
		return memberRpo.findAll();
	}
	
	public Members findById(Long id) {
		Optional<Members> op1 = memberRpo.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	public Page<Members> findAllByPage(Pageable pageable){
		return memberRpo.findAll(pageable);
	}
	
	public Members insertMembers(Members member) {
		return memberRpo.save(member);
	}
	
	public Members updateMembers(Members member) {
		return memberRpo.save(member);
	} 
	
	public void deleteMembersById(Long id) {
		memberRpo.deleteById(id);
	}

}

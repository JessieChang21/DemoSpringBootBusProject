package tw.bus.memberslike.model;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.bus.exception.UserNotFoundException;
import tw.bus.members.model.Members;


@Transactional
@Service
public class FrameBeanService {

	@Autowired
	private FrameBeanRepository fRpo;
	
	public FrameBean updateFrameBean(FrameBean framebean) {
		return fRpo.save(framebean);
	} 
	
	public FrameBean findById(Long id) {
		Optional<FrameBean> op1 = fRpo.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	public boolean existsById(Long id) {
		Optional<FrameBean> opl = fRpo.findById(id);
		
		if(opl.isEmpty()) {
			return false;
		 }
		return true;
	}
	
	public List<FrameBean> findAll(){
		return fRpo.findAll();
	}
}

package tw.bus.memberslike.model;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Transactional
@Service
public class UpdateFrameBeanService {

	@Autowired
	private UpdateFrameBeanRepository ufRpo;
	
	public UpdateFrameBean UpdateFrameBean(UpdateFrameBean updateframebean) {
		return ufRpo.save(updateframebean);
	} 
}

package tw.bus.members.model;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Transactional
@Service
public class AgelevelService {

	@Autowired
	private AgelevelRepository aRpo;
	
	public AgelevelBean findById(Integer ageid) {
		Optional<AgelevelBean> op1 = aRpo.findById(ageid);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
}

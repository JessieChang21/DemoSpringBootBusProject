package tw.bus.ticket.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberorderService {

	@Autowired
	private MemberorderRepository moResp;
	
	
	public Memberorder insert(Memberorder memberorder) { 
		moResp.save(memberorder);
		return memberorder;
	}

	public void deleteById(Integer orderid) {
		moResp.deleteById(orderid);
	}
	
	public Memberorder findByOrderid(Integer orderid) {
		return moResp.findByOrderid(orderid);
	}

}

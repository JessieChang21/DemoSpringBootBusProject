package tw.bus.ticket.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class Memberorder2Service {

	@Autowired
	private Memberorder2Repository moResp;
	
	
	public Memberorder2 insert(Memberorder2 memberorder) { 
		return moResp.save(memberorder);
	}

	public Integer deleteByOrderid(Integer orderid) {
		return moResp.deleteByOrderid(orderid);
	}

	// 使用者email查詢訂單編號
	public List<Memberorder2> findByEmail(String useremail) {
		return moResp.findByEmail(useremail);
	}
	
	public List<Memberorder2> findByOrderid(Integer orderid) {
		return moResp.findByOrderid(orderid);
	}
	

}

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
	
	
	public List<Memberorder2> insert(List<Memberorder2> memberorder) { 
		moResp.saveAll(memberorder);
		return memberorder;
	}

	public void deleteByOrderid(Integer orderid) {
		moResp.deleteByOrderid(orderid);
	}
	
	public Memberorder2 findByOrderid(Integer orderid) {
		return moResp.findByOrderid(orderid);
	}
	
	// 使用者名稱查詢訂單編號

}

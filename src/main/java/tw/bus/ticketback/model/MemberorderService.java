package tw.bus.ticketback.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
	
	
	// 後臺相關
	
	public Page<Memberorder> findMoAll(Pageable pageable){
		return moResp.findAll(pageable);
	}
	
	public Page<Memberorder> findMoByBusNumber(Integer busnumber, Pageable pageable){
		return moResp.findByBusnumber(busnumber, pageable);
	}
	
	public Page<Memberorder> findMoByEmail(String email, Pageable pageable){
		return moResp.findByEmailLike("%"+email+"%", pageable);
	}
	
	public Memberorder deleteByIdBack(Integer oid) {
		Memberorder m =moResp.findById(oid).get();
		moResp.deleteById(oid);
		return m;
	}
	
	public List<Memberorder> deleteByOrderidBack(Integer orderid) {
		List<Memberorder> m =moResp.findByOrderid(orderid);
		moResp.deleteByOrderid(orderid);
		return m;
	}
	
	public List<Memberorder> findByOrderidBack(Integer orderid) {
		List<Memberorder> m =moResp.findByOrderid(orderid);
		return m;
	}
	

}

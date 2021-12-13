package tw.bus.ticketback.model;



import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;



public interface MemberorderRepository extends JpaRepository<Memberorder, Integer> {


	// 後臺相關
	public Page<Memberorder> findByBusnumber(Integer busnumber, Pageable pageable);
	public List<Memberorder> deleteByOrderid(Integer orderid);
	public List<Memberorder> findByOrderid(Integer orderid);
	public Page<Memberorder> findByEmailLike(String email, Pageable pageable);
	
	
}

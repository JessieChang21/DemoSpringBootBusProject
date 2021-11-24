package tw.bus.ticket.model;

import org.springframework.data.jpa.repository.JpaRepository;


public interface MemberorderRepository extends JpaRepository<Memberorder, Integer> {

	Memberorder findByOrderid(Integer orderid);

}

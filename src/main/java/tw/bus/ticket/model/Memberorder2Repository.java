package tw.bus.ticket.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface Memberorder2Repository extends JpaRepository<Memberorder2, Integer> {

	Memberorder2 findByOrderid(Integer orderid);

	@Modifying
	@Query(value="delete from Memberorder2 as m where m.orderid=:orderid", nativeQuery = true)
	void deleteByOrderid(@Param("orderid") Integer orderid);

}

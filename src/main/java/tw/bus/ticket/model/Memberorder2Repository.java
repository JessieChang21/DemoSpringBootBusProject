package tw.bus.ticket.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface Memberorder2Repository extends JpaRepository<Memberorder2, Integer> {

	@Modifying
	@Query(value="delete from Memberorder2 where orderid=:orderid", nativeQuery = true)
	Integer deleteByOrderid(@Param("orderid") Integer orderid);

	@Query(value="select * from Memberorder2 as m where m.email=:email order by orderid", nativeQuery = true)
	List<Memberorder2> findByEmail(@Param("email") String useremail);
	
	List<Memberorder2> findByOrderid(Integer orderid);

}

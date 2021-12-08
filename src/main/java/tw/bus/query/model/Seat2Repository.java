package tw.bus.query.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface Seat2Repository extends JpaRepository<Seat2, Integer> {

	List<Seat2> findByBusnumber(Integer busnumber);
	
	@Modifying
	@Query(value = " delete from Seat2 where seatid=:seatid", nativeQuery = true)
	Integer deleteSeatAfterOrder(@Param("seatid") Integer seatid);

	@Modifying
	@Query(value = " insert Seat2 (busnumber, seat) values (:busnumber,:seatid)", nativeQuery = true)
	Integer insertSeatAfterDeleteOrder(@Param("busnumber") Integer busnumber, @Param("seatid") Integer seatid);
	
//	@Query(value= "update Totalbus2 as t set t.remainseats=:newremainseat where busnumber=:busnumber", nativeQuery = true)
//	Totalbus2 updateRemainSeat(@Param("busnumber") Integer busnumber, @Param("newremainseat") int newremainseat);
	

}

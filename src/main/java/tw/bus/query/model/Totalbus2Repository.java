package tw.bus.query.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface Totalbus2Repository extends JpaRepository<Totalbus2, Integer> {
	
	@Query(value = "select * from Totalbus2 as t "
			+ "where (t.tripname=:tripname and t.initialtime>:initialtime and t.remainseats>:qty) order by initialTime", nativeQuery = true)
	List<Totalbus2> queryRoutesByTripname(@Param("tripname") String tripname, @Param("initialtime") String initialtime, @Param("qty") Integer qty);

	
	Totalbus2 findByBusnumber(Integer busnumber);

	@Modifying
	@Query(value= "update Totalbus2 as t set t.remainseats=:newremainseat where t.busnumber=:busnumber", nativeQuery = true)
	Totalbus2 updateRemainSeat(@Param("busnumber") Integer busnumber, @Param("newremainseat") int newremainseat);
	
	
}
	

	

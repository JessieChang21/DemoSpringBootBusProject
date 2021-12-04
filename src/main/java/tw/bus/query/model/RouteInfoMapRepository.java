package tw.bus.query.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RouteInfoMapRepository extends JpaRepository<RouteInfoMap, Integer> {
	
//	@Modifying 聲明執行的SQL是更新（增删改）操作
    @Query(value = "select r.station from RouteInfoMap r where r.station LIKE %:term%",
            nativeQuery = true)
    List<String> getStation(String term);

}

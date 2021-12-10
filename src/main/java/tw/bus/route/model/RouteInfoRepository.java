package tw.bus.route.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface RouteInfoRepository extends JpaRepository<RouteInfo, String> {
	public List<RouteInfo> findByRouteIdOrderByStationSequence(String routeId);
	
	public RouteInfo findTopByRouteIdOrderByStationSequenceDesc(String routeId);
	
	public RouteInfo findTopByRouteIdOrderByStationSequenceAsc(String routeId);
	
}

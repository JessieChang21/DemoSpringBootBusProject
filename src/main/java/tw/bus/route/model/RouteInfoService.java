package tw.bus.route.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RouteInfoService {
//	@Autowired
//	private RouteInfoDao rInfoDao;

	@Autowired
	private RouteInfoRepository rouRep;
	
	public List<RouteInfo> findRouteInfoById(String routeId){
		return rouRep.findByRouteIdOrderByStationSequence(routeId);
	}
	
	public RouteInfo findLastStationSequence(String routeId) {
		System.out.println(routeId);
		return rouRep.findTopByRouteIdOrderByStationSequenceDesc(routeId);
	}
	public RouteInfo findFirstStationSequence(String routeId) {
		System.out.println(routeId);
		return rouRep.findTopByRouteIdOrderByStationSequenceAsc(routeId);
	}

}

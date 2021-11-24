package tw.bus.query.model;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional 
public class RouteService {
	@Autowired
	private RouteRepository routeResp;

	public List<tw.bus.query.model.Route> findByStation(String station) {
		return routeResp.findByStation(station);
	}



}

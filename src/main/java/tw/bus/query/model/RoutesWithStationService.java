package tw.bus.query.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional 
public class RoutesWithStationService {
	@Autowired
	private RoutesWithStationRepository routesResp;
	
	public List<RoutesWithStation> findAll() {
		return routesResp.findAll();
	}


}

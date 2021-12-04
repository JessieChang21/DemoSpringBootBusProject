package tw.bus.query.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RouteInfoMapService {
	@Autowired
	private RouteInfoMapRepository mapResp;
	
	public List<String> getStation(String term) {
        return mapResp.getStation(term);
    }
	
	public List<RouteInfoMap> findAll() {
		return mapResp.findAll();
	}


}

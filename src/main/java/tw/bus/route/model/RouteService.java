package tw.bus.route.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;




@Service
@Transactional
public class RouteService {
	@Autowired
	private RouteRepository routeResp;
	
	public Optional<Routes> findById(String routeId) {
		return routeResp.findById(routeId);
	}
	
	public List<Routes> findAllRoutes(){
		return routeResp.findAll();
	}
	
	public Page<Routes> findAllRouteByPage(Pageable pageable){
		return routeResp.findAll(pageable);
	}
	
//	public List<Routes> findRouteByTripName(String tripName) {
//		List<Routes> lis1 = routeResp.findByTripName(tripName);
//		if(lis1.isEmpty()) {
//			throw new RouteNotFoundException("找不到該路線資訊");
//		}
//		return lis1;
//	}
//	
//	public List<Routes> findRouteByArea(String area) {
//		List<Routes> lis2 = routeResp.findByArea(area);
//		if(lis2.isEmpty()) {
//			throw new RouteNotFoundException("找不到該路線資訊");
//		}
//		return lis2;
//	}
//	
	
	public Routes updateRoute(Routes route) {
		return routeResp.save(route);
	}
	
	public Routes insertRoute(Routes route) {
		return routeResp.save(route);
	}
	
	public Routes deleteRoute(Routes route) {
		routeResp.delete(route);
		return route;
	}
	
	public Page<Routes> findRouteByArea(String area, Pageable pageable){
		return routeResp.findByArea(area, pageable);
	}
	
	public Page<Routes> findRouteByTripName(String tripName, Pageable pageable){
		return routeResp.findByTripName(tripName, pageable);
	}
	
	public List<String> findDisArea(){
		return routeResp.findDisArea();
	}
	
	public List<String> findDisTripNameByArea(String area){
		return routeResp.findDisTripNameByArea(area);
	}
	
	public List<String> findDisTripName(){
		return routeResp.findDisTripName();
	}
	
	public Routes findLastRoute() {
		return routeResp.findTopOrderByRouteIdDesc();
	}

}

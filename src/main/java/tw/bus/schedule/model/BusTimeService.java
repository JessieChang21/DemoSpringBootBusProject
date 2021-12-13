package tw.bus.schedule.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BusTimeService {
	@Autowired
	private BusTimeRepository busRep;
	
	public List<BusTimes> findAllBusTimes(){
		return busRep.findAll();
	}
	
	public Page<BusTimes> findAllBusTimesByPage(Pageable pageable){
		return busRep.findAll(pageable);
	}
	
	
	public Page<BusTimes> findBusTimesByPageAndRouteId(String routeId, Pageable pageable){
		return busRep.findByRouteId(routeId, pageable);
	}
	
	
	public BusTimes updateBusTime(BusTimes busTime) {
		return busRep.save(busTime);
	}

	public BusTimes insertBusTime(BusTimes busTime) {
		return busRep.save(busTime);
	}
	

	public BusTimes deleteBusTime(BusTimes busTime) {
		busRep.delete(busTime);
		return busTime;
	}
	
	public BusTimes deleteByBusNo(Integer busNumber) {
		Optional<BusTimes> dBus = busRep.findById(busNumber);
		busRep.deleteByBusNumber(busNumber);
		return dBus.get();
	}
	
	public BusTimes findNewOne(String routeId) {
		return busRep.findTopByRouteIdOrderByBusNumberDesc(routeId);
	}
	
	public BusTimes findBusById(Integer busNumber) {
		Optional<BusTimes> op1 = busRep.findById(busNumber);
		if(op1.isPresent()) {
			BusTimes dBus = op1.get();
			return dBus;
		} else {
			BusTimes dBus = null;
			return dBus;
		}
		
	}

}

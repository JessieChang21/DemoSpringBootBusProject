package tw.bus.tour.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class RoutesForToursService {
	@Autowired
	private RoutesForToursRepository rRepository;
	
	public List<RoutesForTours> findRoutes() {
		return rRepository.findRoutes();
	}
	public List<RoutesForTours> findByArea() {
		return rRepository.findByArea();
	}
}

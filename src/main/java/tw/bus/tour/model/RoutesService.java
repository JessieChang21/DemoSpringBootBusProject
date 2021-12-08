package tw.bus.tour.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class RoutesService {
	@Autowired
	private RoutesRepository rRepository;
	
	public List<Routes> findRoutes() {
		return rRepository.findRoutes();
	}
	public List<Routes> findByArea() {
		return rRepository.findByArea();
	}
}

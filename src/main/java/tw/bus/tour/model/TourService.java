package tw.bus.tour.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class TourService {
	@Autowired
	private TourRepository tRepository;

	public List<Tour> findAll() {
		return tRepository.findAll();
	}
}

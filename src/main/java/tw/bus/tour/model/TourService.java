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
	@Autowired
	private RoutesRepository rRepository;
	

	public List<Tour> findAll() {
		return tRepository.findAll();
	}
	public List<Routes> findRoutes() {
		return rRepository.findRoutes();
	}
	public Tour findById(String editId) {
		return tRepository.findById(editId);
	}
	public List<Tour> findByCurDate() {
		return tRepository.findByCurDate();
	}
	public void deleteById(Integer editId) {
		tRepository.deleteById(editId);
//		tRepository.deleteCurId(editId);
	}
	public void insertData(Tour model ) {
		tRepository.save(model);
	}
}

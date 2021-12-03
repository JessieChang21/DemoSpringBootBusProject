package tw.bus.tour.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TourRepository extends JpaRepository<Tour, Integer> {
	@Query(value = "Select * from Tour", nativeQuery = true)
	public List<Tour> findAll();
}

package tw.bus.tour.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RoutesForToursRepository extends JpaRepository<RoutesForTours, Integer> {
	@Query(value = "SELECT * FROM Routes", nativeQuery = true)
	public List<RoutesForTours> findRoutes();
	@Query(value = "SELECT tripName FROM Routes WHERE area = ?", nativeQuery = true)
	public List<RoutesForTours> findByArea();
}

package tw.bus.tour.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RoutesForToursRepository extends JpaRepository<RoutesForTours, Integer> {
	@Query(value = "SELECT * FROM Routes WHERE direction = 0", nativeQuery = true)
	public List<RoutesForTours> findRoutes();
	@Query(value = "SELECT * FROM Routes WHERE area = ? AND direction = 0", nativeQuery = true)
	public List<RoutesForTours> findByArea(String area);
}

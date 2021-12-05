package tw.bus.tour.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RoutesRepository extends JpaRepository<Routes, Integer> {
	@Query(value = "SELECT * FROM Routes", nativeQuery = true)
	public List<Routes> findRoutes();
}

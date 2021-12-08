package tw.bus.route.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RouteRepository extends JpaRepository<Routes, String> {
	public Page<Routes> findByTripName(String tripName, Pageable pageable);
	public Page<Routes> findByArea(String area, Pageable pageable);
	
	@Query(value = "select distinct area FROM ROUTES r", nativeQuery = true)
	public List<String> findDisArea();
}

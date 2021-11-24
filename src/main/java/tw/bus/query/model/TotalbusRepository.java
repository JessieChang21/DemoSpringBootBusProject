package tw.bus.query.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TotalbusRepository extends JpaRepository<Totalbus, String> {
	
	@Query(value = "from Totalbus", nativeQuery = false)
	public List<Totalbus> findByRouteid(String routeid);
	
}

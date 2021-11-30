package tw.bus.announcemen.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.bus.announcemen.model.LostAndFound;





public interface LostAndFoundRepository extends JpaRepository<LostAndFound, Integer> {

//	@Query(value = "Select * From L", nativeQuery = true)
//	public List<LostAndFound> findAll();
	
	
	public List<LostAndFound> findByItdateLike(String itdate);
}

package tw.bus.tour.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TourRepository extends JpaRepository<Tour, Integer> {
	@Query(value = "Select * from Tour", nativeQuery = true)
	public List<Tour> findAll();
	@Query(value = "Select * from Tour Where tourId = ?", nativeQuery = true)
	public Tour findById(String editId);
	@Query(value = "SELECT * FROM Tour WHERE tourSaleStart < GETDATE() AND tourUseEnd > GETDATE()", nativeQuery = true)
	public List<Tour> findByCurDate();
//	@Query(value = "Delete from Tour Where tourId = ?", nativeQuery = true)
//	public void deleteCurId(Integer editId);
}

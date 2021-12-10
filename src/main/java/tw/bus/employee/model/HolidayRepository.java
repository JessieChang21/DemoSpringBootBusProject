package tw.bus.employee.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface HolidayRepository extends JpaRepository<Holiday, String> {
	@Query(value="select totalhours from Holiday where employeeid = ?1 ", nativeQuery = true)
	 public Integer getTotalHoursbyID(String employeeid);
	@Query(value="select lavehours from Holiday where employeeid = ?1 ", nativeQuery = true)
	 public Integer getLaveHoursbyID(String employeeid);
}

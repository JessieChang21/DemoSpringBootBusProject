package tw.bus.employee.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface EmployeeRepository extends JpaRepository<Employee, String> {
	@Query(value="select isnull(max(id),0)+1 from Employee", nativeQuery = true)
	 public String findMaxId();
	@Query(value="select employeename from Employee where id = ?1 ", nativeQuery = true)
	 public String getNamebyId(String id);
	@Query(value="select * from Employee where id not in (?1) ", nativeQuery = true)
	 public List<Employee> findAllById(String id);
	
	@Modifying
	@Transactional
	@Query(value="delete from Employee where id=:id", nativeQuery = true)
	void deleteByEmployeeid(@Param("id") String id);
}

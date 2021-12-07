package tw.bus.employee.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface EmployeeRepository extends JpaRepository<Employee, String> {
	@Query(value="select isnull(max(id),0)+1 from Employee", nativeQuery = true)
	 public String findMaxId();
}

package tw.bus.employeeLog.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;


public interface EmployeeLRepository extends JpaRepository<EmployeeL, Integer> {

	public Optional<EmployeeL> findByEmployeeName(String name);
	
	public EmployeeL findByIdAndPassword(String id, String password);
	public EmployeeL findById(String id);
	
}

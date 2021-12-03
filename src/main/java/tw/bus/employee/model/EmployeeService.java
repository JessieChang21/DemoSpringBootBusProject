package tw.bus.employee.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EmployeeService {

	@Autowired
	private EmployeeRepository eResp;
	
	public Employee findById(String id) {
		Optional<Employee> op1 = eResp.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	public List<Employee> findAll(){
		return eResp.findAll();
	}
	
	public Page<Employee> findAllByPage(Pageable pageable){
		return eResp.findAll(pageable);
	}
	
	public Employee insertEmployee(Employee e) {
		return eResp.save(e);
	}
	
	public Employee updateEmployee(Employee e) {
		return eResp.save(e);
	}
	
	public void deleteEmployee(Employee e) {
		eResp.delete(e);
	}

}

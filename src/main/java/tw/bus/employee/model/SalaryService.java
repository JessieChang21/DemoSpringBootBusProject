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
public class SalaryService {

	@Autowired
	private SalaryRepository sResp;
	
	public Salary findById(String id) {
		Optional<Salary> op1 = sResp.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	public List<Salary> findAll(){
		return sResp.findAll();
	}
	
	public Page<Salary> findAllByPage(Pageable pageable){
		return sResp.findAll(pageable);
	}
	
	public Salary insertSalary(Salary s) {
		return sResp.save(s);
	}
	
	public Salary updateSalary(Salary s) {
		return sResp.save(s);
	}
	
	public void deleteSalary(Salary s) {
		sResp.delete(s);
	}

}

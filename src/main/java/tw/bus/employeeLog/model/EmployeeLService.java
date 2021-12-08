package tw.bus.employeeLog.model;

import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service
@Transactional
public class EmployeeLService {
	
	@Autowired
	private EmployeeLRepository employRep;
	
	public EmployeeL findEmployeeByName(String empoyName) {
		Optional<EmployeeL> op1 = employRep.findByEmployeeName(empoyName);
		
		EmployeeL employee = op1.get();
	
		return employee;
	}
	
	public EmployeeL findEmployeeById(String id) {
		EmployeeL employee = employRep.findById(id);
		
		return employee;
	}
	
	
	public EmployeeL createEmployeeProfiles(EmployeeL eProfiles) {
		return employRep.save(eProfiles);
	}
	
	public boolean checkLogin(String id, String password) {

		EmployeeL e = employRep.findByIdAndPassword(id, password);
		
		if(e != null) {
			return true;
		}
		return false;
	}

}

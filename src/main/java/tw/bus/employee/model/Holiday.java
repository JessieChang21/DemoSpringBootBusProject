package tw.bus.employee.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Holiday")
@Component
public class Holiday {
	@Id
	private String EmployeeID;
	private Integer TotalHours;
	private Integer LaveHours;
	public String getEmployeeID() {
		return EmployeeID;
	}
	public void setEmployeeID(String employeeID) {
		EmployeeID = employeeID;
	}
	public Integer getTotalHours() {
		return TotalHours;
	}
	public void setTotalHours(Integer totalHours) {
		TotalHours = totalHours;
	}
	public Integer getLaveHours() {
		return LaveHours;
	}
	public void setLaveHours(Integer laveHours) {
		LaveHours = laveHours;
	}
	
	

}

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
	private String employeeid;
	private Integer totalhours;
	private Integer lavehours;
	public String getEmployeeid() {
		return employeeid;
	}
	public void setEmployeeid(String employeeid) {
		this.employeeid = employeeid;
	}
	public Integer getTotalhours() {
		return totalhours;
	}
	public void setTotalhours(Integer totalhours) {
		this.totalhours = totalhours;
	}
	public Integer getLavehours() {
		return lavehours;
	}
	public void setLavehours(Integer lavehours) {
		this.lavehours = lavehours;
	}
	
}

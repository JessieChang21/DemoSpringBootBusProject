package tw.bus.employee.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "GetHoliday")
@Component
public class GetHoliday{
	
	@Id
	private String employeeid;
	private String substituteid;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private String date;
	private String timeperiod;
	private Integer totalhours;
	private String release;
	public String getEmployeeid() {
		return employeeid;
	}
	public void setEmployeeid(String employeeid) {
		this.employeeid = employeeid;
	}
	public String getSubstituteid() {
		return substituteid;
	}
	public void setSubstituteid(String substituteid) {
		this.substituteid = substituteid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTimeperiod() {
		return timeperiod;
	}
	public void setTimeperiod(String timeperiod) {
		this.timeperiod = timeperiod;
	}
	public Integer getTotalhours() {
		return totalhours;
	}
	public void setTotalhours(Integer totalhours) {
		this.totalhours = totalhours;
	}
	public String getRelease() {
		return release;
	}
	public void setRelease(String release) {
		this.release = release;
	}
	

}

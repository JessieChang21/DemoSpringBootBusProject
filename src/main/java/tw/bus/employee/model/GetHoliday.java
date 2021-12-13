package tw.bus.employee.model;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "GetHoliday")
@Component
//@IdClass(GetHolidaypk.class)
public class GetHoliday{
	
	@EmbeddedId
	private GetHolidaypk pk;
	/**
	@Column(name="employeeid")
	private String employeeid;
	@Column(name = "date")
	private String date;
	@Column(name = "timeperiod")
	private String timeperiod;
	**/
	@Column(name = "substituteid")
	private String substituteid;
	
	@Column(name = "totalhours")
	private Integer totalhours;
	@Column(name = "release")
	private String release;
	
	
	
	
	public GetHolidaypk getPk() {
		return pk;
	}
	public void setPk(GetHolidaypk pk) {
		this.pk = pk;
	}
	/**
	public String getEmployeeid() {
		return employeeid;
	}
	public void setEmployeeid(String employeeid) {
		this.employeeid = employeeid;
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
	**/
	
	
	
	public String getSubstituteid() {
		return substituteid;
	}
	public void setSubstituteid(String substituteid) {
		this.substituteid = substituteid;
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

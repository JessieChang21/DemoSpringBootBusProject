package tw.bus.employee.model;

import java.io.Serializable;

import javax.persistence.Embeddable;

import com.fasterxml.jackson.annotation.JsonFormat;
@Embeddable
public class GetHolidaypk implements Serializable {
	private String employeeid;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private String date;
	private String timeperiod;
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
	
	
}

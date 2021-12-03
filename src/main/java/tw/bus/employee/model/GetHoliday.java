package tw.bus.employee.model;

import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "GetHoliday")
@Component
public class GetHoliday {
	
	@Id
	private String EmployeeID;
	private String SubstituteID;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date Date;
	private String TimePeriod;
	private Integer TotalHours;
	private String Release;
	public String getEmployeeID() {
		return EmployeeID;
	}
	public void setEmployeeID(String employeeID) {
		EmployeeID = employeeID;
	}
	public String getSubstituteID() {
		return SubstituteID;
	}
	public void setSubstituteID(String substituteID) {
		SubstituteID = substituteID;
	}
	public Date getDate() {
		return Date;
	}
	public void setDate(Date date) {
		Date = date;
	}
	public String getTimePeriod() {
		return TimePeriod;
	}
	public void setTimePeriod(String timePeriod) {
		TimePeriod = timePeriod;
	}
	public Integer getTotalHours() {
		return TotalHours;
	}
	public void setTotalHours(Integer totalHours) {
		TotalHours = totalHours;
	}
	public String getRelease() {
		return Release;
	}
	public void setRelease(String release) {
		Release = release;
	}
	
	
}

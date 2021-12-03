package tw.bus.employee.model;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Salary")
@Component
public class Salary {
	@Id
	private String EmployeeID;
	private String JobID;
	private String RankID;
	private Integer Seniority;
	private String isEndOfYear;
	private String PerformanceAppraisal;
	private BigDecimal Salary;
	public String getEmployeeID() {
		return EmployeeID;
	}
	public void setEmployeeID(String employeeID) {
		EmployeeID = employeeID;
	}
	public String getJobID() {
		return JobID;
	}
	public void setJobID(String jobID) {
		JobID = jobID;
	}
	public String getRankID() {
		return RankID;
	}
	public void setRankID(String rankID) {
		RankID = rankID;
	}
	public Integer getSeniority() {
		return Seniority;
	}
	public void setSeniority(Integer seniority) {
		Seniority = seniority;
	}
	public String getIsEndOfYear() {
		return isEndOfYear;
	}
	public void setIsEndOfYear(String isEndOfYear) {
		this.isEndOfYear = isEndOfYear;
	}
	public String getPerformanceAppraisal() {
		return PerformanceAppraisal;
	}
	public void setPerformanceAppraisal(String performanceAppraisal) {
		PerformanceAppraisal = performanceAppraisal;
	}
	public BigDecimal getSalary() {
		return Salary;
	}
	public void setSalary(BigDecimal salary) {
		Salary = salary;
	}
	
	
}

package tw.bus.employeeLog.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "employee")
@Component
public class EmployeeL {
	
	@Id @Column(name = "ID")
	private String id;
	
	@Column(name = "EMPLOYEENAME")
	private String employeeName;
	
	@Column(name = "PASSWORD")
	private String password;
	
	@Column(name = "GROUPID")
	private String groupId;
	
	@Column(name = "GENDER")
	private String gender;
	
	@Column(name = "JOBID")
	private String jobId;
	
	@Column(name = "RANKID")
	private String rankId;

	@Column(name = "ENTERDATE")
	private String enterDate;
	
	@Column(name = "SENIORITY")
	private Integer seniority;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getRankId() {
		return rankId;
	}

	public void setRankId(String rankId) {
		this.rankId = rankId;
	}

	public String getEnterDate() {
		return enterDate;
	}

	public void setEnterDate(String enterDate) {
		this.enterDate = enterDate;
	}

	public Integer getSeniority() {
		return seniority;
	}

	public void setSeniority(Integer seniority) {
		this.seniority = seniority;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}

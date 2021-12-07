package tw.bus.employee.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Job")
@Component
public class Job {
	
	@Id
	private String jobid;
	private String jobname;
	public String getJobid() {
		return jobid;
	}
	public void setJobid(String jobid) {
		this.jobid = jobid;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
}

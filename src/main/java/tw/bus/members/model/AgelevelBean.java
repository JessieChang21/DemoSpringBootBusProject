package tw.bus.members.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "Agelevel")
@Component
public class AgelevelBean {

	@Id @Column(name = "AGEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ageid;
	
	@Column(name = "AGELEVEL")
	private String agelevel;

	public Integer getAgeid() {
		return ageid;
	}

	public void setAgeid(Integer ageid) {
		this.ageid = ageid;
	}

	public String getAgelevel() {
		return agelevel;
	}

	public void setAgelevel(String agelevel) {
		this.agelevel = agelevel;
	}
	
	
}

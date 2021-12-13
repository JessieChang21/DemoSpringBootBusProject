package tw.bus.memberslike.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="Framesdaypage")
@Component
public class FrameDayTotal {

	@Id @Column(name = "FRAMEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer frameid;
	
	@Column(name = "LIKETOTEL")
	private Integer liketotal;
	
	@Column(name = "DATE")
	private String date;



	public Integer getFrameid() {
		return frameid;
	}

	public void setFrameid(Integer frameid) {
		this.frameid = frameid;
	}

	public Integer getLiketotal() {
		return liketotal;
	}

	public void setLiketotal(Integer liketotal) {
		this.liketotal = liketotal;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
}

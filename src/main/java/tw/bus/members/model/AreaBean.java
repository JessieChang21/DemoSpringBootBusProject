package tw.bus.members.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity @Table(name="adressarea")
@Component
public class AreaBean {

	
	@Id @Column(name = "AREAID",insertable=false,updatable=false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "AREA")
	private String areaname;
	
	@Column(name = "CITYID",insertable=false,updatable=false)
	private String cityid;
	
	@ManyToOne(fetch = FetchType.EAGER)//積極載入
	@JoinColumn(name = "CITYID")
	@JsonBackReference
	private CityBean citybean;
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAreaname() {
		return areaname;
	}

	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}

	public String getCityid() {
		return cityid;
	}

	public void setCityid(String cityid) {
		this.cityid = cityid;
	}

	public CityBean getCitybean() {
		return citybean;
	}

	public void setCitybean(CityBean citybean) {
		this.citybean = citybean;
	}
	
	
}

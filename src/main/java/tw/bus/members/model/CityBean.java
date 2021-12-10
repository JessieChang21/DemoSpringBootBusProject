package tw.bus.members.model;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity @Table(name="adresscity")
@Component
public class CityBean {
	
	@Id @Column(name = "CITYID",insertable=false,updatable=false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "CITYNAME")
	private String cityname;

	@OneToMany(fetch = FetchType.LAZY,mappedBy = "citybean",cascade=CascadeType.ALL)
	@JsonManagedReference
	private Set<AreaBean> areabean = new LinkedHashSet<AreaBean>();//LinkedHashSet在乎順序;HashSet不在乎
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCityname() {
		return cityname;
	}

	public void setCityname(String cityname) {
		this.cityname = cityname;
	}

	public Set<AreaBean> getAreabean() {
		return areabean;
	}

	public void setAreabean(Set<AreaBean> areabean) {
		this.areabean = areabean;
	}

	
	
}

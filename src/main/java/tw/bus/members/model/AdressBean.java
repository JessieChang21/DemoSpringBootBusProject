package tw.bus.members.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="adressname")
@Component
public class AdressBean {

	@Id @Column(name = "ADRESSID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "ADRESSNAME")
	private String adressName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAdressName() {
		return adressName;
	}

	public void setAdressName(String adressName) {
		this.adressName = adressName;
	}
	
	
}

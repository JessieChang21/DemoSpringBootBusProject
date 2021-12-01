package tw.bus.memberslogin.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "Members")
@Component
public class LoginMembers {
	
	@Id @Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
//	@Column(name = "NAME")
//	private String name;
	
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "MEMBERPWD")
	private String password;
	
//	@Column(name = "PHONE")
//	private String phone;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String emailaddress) {
		this.email = emailaddress;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}

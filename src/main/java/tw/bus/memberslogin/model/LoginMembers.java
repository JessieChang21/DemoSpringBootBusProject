package tw.bus.memberslogin.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity 
@Table(name = "Members")
@Component
public class LoginMembers {
	
	@Id @Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "EMAIL")
	private String username;
	
	@Column(name = "MEMBERPWD")
	private String password;
	
	boolean rememberme;

	
	public LoginMembers() {

	}


	public LoginMembers(String username, String password, boolean rememberme) {
		super();
		this.username = username;
		this.password = password;
		this.rememberme = rememberme;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public boolean isRememberme() {
		return rememberme;
	}


	public void setRememberme(boolean rememberme) {
		this.rememberme = rememberme;
	}
	
}

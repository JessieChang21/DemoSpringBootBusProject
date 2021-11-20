package tw.bus.members.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity @Table(name = "Members")
@Component
public class Members {

	@Id @Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "IDNUMBER")
	private String idNumber;
	
	@Column(name = "MEMBERNAME")
	private String membername;
	
	@Column(name = "MEMBERPWD")
	private String memberpwd;
	
	@Column(name = "PHONE")
	private String phone;
	
	@Column(name = "BIRTHDAY")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date birthday;
	
	@Column(name = "GENDER")
	private String gender;
	
	@Column(name = "ADRESS")
	private String adress;
	
	@Column(name = "EMAIL")
	private String email;

	public Members() {
		
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public Members(Long id, String idNumber, String membername, String memberpwd, String phone, Date birthday,
			String gender, String adress, String email) {
		super();
		this.id = id;
		this.idNumber = idNumber;
		this.membername = membername;
		this.memberpwd = memberpwd;
		this.phone = phone;
		this.birthday = birthday;
		this.gender = gender;
		this.adress = adress;
		this.email = email;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getMemberpwd() {
		return memberpwd;
	}

	public void setMemberpwd(String memberpwd) {
		this.memberpwd = memberpwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Members [id=");
		builder.append(id);
		builder.append(", idNumber=");
		builder.append(idNumber);
		builder.append(", membername=");
		builder.append(membername);
		builder.append(", memberpwd=");
		builder.append(memberpwd);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", birthday=");
		builder.append(birthday);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", adress=");
		builder.append(adress);
		builder.append(", email=");
		builder.append(email);
		builder.append("]");
		return builder.toString();
	}
	
	
}

package tw.bus.membersmanagement.model;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity @Table(name = "Members")
@Component
public class QueryMembers {

	@Id @Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "MEMBERNAME")
	private String membername;
	
	@Column(name = "GENDER")
	private String gender;
	
	@Column(name = "ADRESS")
	private String adress;
	
	@Column(name = "AGE")
	private Integer age;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
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

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("QueryMembers [id=");
		builder.append(id);
		builder.append(", email=");
		builder.append(email);
		builder.append(", membername=");
		builder.append(membername);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", adress=");
		builder.append(adress);
		builder.append(", age=");
		builder.append(age);
		builder.append("]");
		return builder.toString();
	}
	
}

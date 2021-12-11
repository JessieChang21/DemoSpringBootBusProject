package tw.bus.members.model;

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
public class Members {

	@Id @Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "MEMBERNAME")
	private String membername;
	
	@Column(name = "MEMBERPWD")
	private String memberpwd;
	
	@Column(name = "GENDER")
	private String gender;
	
	@Column(name = "ADRESS")
	private String adress;
	
	@Column(name = "AGE")
	private String age;
	
	@Column(name = "FILENAME")
	private String fileName;
	
	@Column(name = "MIMETYPE")
	private String mimeType;
	
	@Column(name = "MEMBERIMAGE")
	private Blob memberImage;
	
	@Transient
	MultipartFile memberMultipartFile;
	
	@Transient
	String memberpwd2;
	
	@Transient
	String agreecheckbox;
	
	@Transient
	String emailcheck;
	
	@Transient
	String emailcheck2;
	
	@Transient
	boolean rememberme;

	public Members() {
		
	}

//	public Members(Long id, String email, String membername, String memberpwd, String memberpwd2) {
//		this.id = id;
//		this.email = email;
//		this.membername = membername;
//		this.memberpwd = memberpwd;
//		this.memberpwd2 = memberpwd2;
//	}


//	public Members(Long id, String email, String membername, String memberpwd, String gender, 
//					String adress, Integer age, String fileName, String mimeType, Blob memberImage) {
//		this.id = id;
//		this.email = email;
//		this.membername = membername;
//		this.memberpwd = memberpwd;
//		this.gender = gender;
//		this.adress = adress;
//		this.age = age;
//		this.fileName = fileName;
//		this.mimeType = mimeType;
//		this.memberImage = memberImage;
//	}

	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getMimeType() {
		return mimeType;
	}


	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}


	public Blob getMemberImage() {
		return memberImage;
	}


	public void setMemberImage(Blob memberImage) {
		this.memberImage = memberImage;
	}


	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMemberpwd() {
		return memberpwd;
	}

	public void setMemberpwd(String memberpwd) {
		this.memberpwd = memberpwd;
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
	
	public String getMemberpwd2() {
		return memberpwd2;
	}


	public void setMemberpwd2(String memberpwd2) {
		this.memberpwd2 = memberpwd2;
	}

	
	
	public MultipartFile getMemberMultipartFile() {
		return memberMultipartFile;
	}


	public void setMemberMultipartFile(MultipartFile memberMultipartFile) {
		this.memberMultipartFile = memberMultipartFile;
	}


	public String getAgreecheckbox() {
		return agreecheckbox;
	}

	public void setAgreecheckbox(String agreecheckbox) {
		this.agreecheckbox = agreecheckbox;
	}

	public String getEmailcheck() {
		return emailcheck;
	}

	public void setEmailcheck(String emailcheck) {
		this.emailcheck = emailcheck;
	}

	public String getEmailcheck2() {
		return emailcheck2;
	}

	public void setEmailcheck2(String emailcheck2) {
		this.emailcheck2 = emailcheck2;
	}

	public boolean isRememberme() {
		return rememberme;
	}

	public void setRememberme(boolean rememberMe) {
		this.rememberme = rememberMe;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Members [id=");
		builder.append(id);
		builder.append(", email=");
		builder.append(email);
		builder.append(", membername=");
		builder.append(membername);
		builder.append(", memberpwd=");
		builder.append(memberpwd);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", adress=");
		builder.append(adress);
		builder.append(", age=");
		builder.append(age);
		builder.append(", fileName=");
		builder.append(fileName);
		builder.append(", mimeType=");
		builder.append(mimeType);
		builder.append(", memberImage=");
		builder.append(memberImage);
		builder.append(", memberMultipartFile=");
		builder.append(memberMultipartFile);
		builder.append(", memberpwd2=");
		builder.append(memberpwd2);
		builder.append(", agreecheckbox=");
		builder.append(agreecheckbox);
		builder.append(", emailcheck=");
		builder.append(emailcheck);
		builder.append(", emailcheck2=");
		builder.append(emailcheck2);
		builder.append(", rememberme=");
		builder.append(rememberme);
		builder.append("]");
		return builder.toString();
	}
	
}

package tw.bus.memberslogin.model;

import java.sql.Blob;

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
public class UpdateMembers {
	
	@Id @Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "Email")
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
	
	public UpdateMembers() {

	}

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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UpdateMembers [id=");
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
		builder.append("]");
		return builder.toString();
	}


}

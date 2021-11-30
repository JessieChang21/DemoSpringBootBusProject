package tw.bus.announcemen.model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "Announcement")
@Component
public class Announcement {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String antitle;
	String ancontent;
	String ancategory;
	@Column(name = "ANIMAGES")
	String animages;

	@JsonFormat(pattern = "yyyy/MM/dd")
	Date registerdate;

	public Announcement() {

	}

	public Announcement(Integer id, String antitle, String ancontent, String ancategory, Timestamp registerdate,
			String animages) {
		this.id = id;
		this.antitle = antitle;
		this.ancontent = ancontent;
		this.ancategory = ancategory;
		this.registerdate = registerdate;
		this.animages = animages;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAnimages() {
		return animages;
	}

	public void setAnimages(String animages) {
		this.animages = animages;
	}

	public String getAntitle() {
		return antitle;
	}

	public void setAntitle(String antitle) {
		this.antitle = antitle;
	}

	public String getAncontent() {
		return ancontent;
	}

	public void setAncontent(String ancontent) {
		this.ancontent = ancontent;
	}

	public String getAncategory() {
		return ancategory;
	}

	public void setAncategory(String ancategory) {
		this.ancategory = ancategory;
	}

	public Date getRegisterdate() {
		return registerdate;
	}

	public void setRegisterdate(Date registerdate) {
		this.registerdate = registerdate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Announcement [id=");
		builder.append(id);
		builder.append(", antitle=");
		builder.append(antitle);
		builder.append(", ancontent=");
		builder.append(ancontent);
		builder.append(", ancategory=");
		builder.append(ancategory);
		builder.append(", animages=");
		builder.append(animages);
		builder.append(", registerdate=");
		builder.append(registerdate);
		builder.append("]");
		return builder.toString();
	}

}

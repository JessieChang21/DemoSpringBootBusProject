package tw.bus.announcemen.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="Lostandfound")
@Component
public class LostAndFound {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String itname;
	String itplace;
	String itbussnumber;
	String itdate;
	
	public LostAndFound() {
		
	}
	
	public LostAndFound(Integer id, String itname, String itplace, String itbussnumber, String itdate) {
		this.id = id;
		this.itname = itname;
		this.itplace = itplace;
		this.itbussnumber = itbussnumber;
		this.itdate = itdate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getItname() {
		return itname;
	}

	public void setItname(String itname) {
		this.itname = itname;
	}

	public String getItplace() {
		return itplace;
	}

	public void setItplace(String itplace) {
		this.itplace = itplace;
	}

	public String getItbussnumber() {
		return itbussnumber;
	}

	public void setItbussnumber(String itbussnumber) {
		this.itbussnumber = itbussnumber;
	}

	public String getItdate() {
		return itdate;
	}

	public void setItdate(String itdate) {
		this.itdate = itdate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("LostAndFound [id=");
		builder.append(id);
		builder.append(", itname=");
		builder.append(itname);
		builder.append(", itplace=");
		builder.append(itplace);
		builder.append(", itbussnumber=");
		builder.append(itbussnumber);
		builder.append(", itdate=");
		builder.append(itdate);
		builder.append("]");
		return builder.toString();
	}
}

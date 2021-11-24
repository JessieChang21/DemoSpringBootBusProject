package tw.bus.query.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity @Table(name="totalbus")
@Component
public class Totalbus {
	@Id @Column(name="busnumber")
	private String busnumber;
	
	@Column(name="routeid")
	private String routeid;
	
	@Column(name="initialstation")
	private String initialstation;
	
	@Column(name="finalstation")
	private String finalstation;
	
	@Column(name="initialtime")
	private java.util.Date initialtime;
	
	@Transient
	private String formatinitaltime;
	
	@Column(name="totalseats")
	private int totalseats;
	
	@Column(name="remainseats")
	private int remainseats;
	
	@Column(name="note")
	private String note;
	
	@Column(name="traveltime")
	private String traveltime;
	
	public Totalbus() {
		
	}
	

	public Totalbus(String busnumber, String routeid, String initialstation, String finalstation, Date initialtime,
			String formatinitaltime, int totalseats, int remainseats, String note, String traveltime) {
		this.busnumber = busnumber;
		this.routeid = routeid;
		this.initialstation = initialstation;
		this.finalstation = finalstation;
		this.initialtime = initialtime;
		this.formatinitaltime = formatinitaltime;
		this.totalseats = totalseats;
		this.remainseats = remainseats;
		this.note = note;
		this.traveltime = traveltime;
	}

	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Totalbus [busnumber=");
		builder.append(busnumber);
		builder.append(", routeid=");
		builder.append(routeid);
		builder.append(", initialstation=");
		builder.append(initialstation);
		builder.append(", finalstation=");
		builder.append(finalstation);
		builder.append(", initialtime=");
		builder.append(initialtime);
		builder.append(", formatinitaltime=");
		builder.append(formatinitaltime);
		builder.append(", totalseats=");
		builder.append(totalseats);
		builder.append(", remainseats=");
		builder.append(remainseats);
		builder.append(", note=");
		builder.append(note);
		builder.append(", traveltime=");
		builder.append(traveltime);
		builder.append("]");
		return builder.toString();
	}


	public String getBusnumber() {
		return busnumber;
	}

	public void setBusnumber(String busnumber) {
		this.busnumber = busnumber;
	}

	public String getRouteid() {
		return routeid;
	}

	public void setRouteid(String routeid) {
		this.routeid = routeid;
	}

	public String getInitialstation() {
		return initialstation;
	}

	public void setInitialstation(String initialstation) {
		this.initialstation = initialstation;
	}

	public String getFinalstation() {
		return finalstation;
	}

	public void setFinalstation(String finalstation) {
		this.finalstation = finalstation;
	}

	public java.util.Date getInitialtime() {
		return initialtime;
	}

	public void setInitialtime(java.util.Date initialtime) {
		this.initialtime = initialtime;
	}

	public int getTotalseats() {
		return totalseats;
	}

	public void setTotalseats(int totalseats) {
		this.totalseats = totalseats;
	}

	public int getRemainseats() {
		return remainseats;
	}

	public void setRemainseats(int remainseats) {
		this.remainseats = remainseats;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getTraveltime() {
		return traveltime;
	}

	public void setTraveltime(String traveltime) {
		this.traveltime = traveltime;
	}

	public String getFormatinitaltime() {
		return formatinitaltime;
	}

	public void setFormatinitaltime(String formatinitaltime) {
		this.formatinitaltime = formatinitaltime;
	}
	
	
}

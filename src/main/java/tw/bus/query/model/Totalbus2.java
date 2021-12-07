package tw.bus.query.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity @Table(name="totalbus2")
@Component
public class Totalbus2 {
	@Id @Column(name="BUSNUMBER")
	private Integer busnumber;
	
	@Column(name="ROUTEID")
	private String routeid;
	
	@Column(name="TRIPNAME")
	private String tripname;
	
	@Column(name="AREA")
	private String area;
	
	@Column(name="DIRECTION")
	private Integer direction;
	
	@Column(name="INITIALSTATION")
	private String initialstation;
	
	@Column(name="FINALSTATION")
	private String finalstation;
	
	@Column(name="INITIALTIME")
	@Temporal(TemporalType.TIME)
	private Date initialtime;
	
	@Column(name="TOTALSEATS")
	private Integer totalseats;
	
	@Column(name="REMAINSEATS")
	private Integer remainseats;
	
	@Column(name="NOTE")
	private String note;
	
	@Column(name="TRAVELTIME")
	private String traveltime;
	
	@Column(name="SUNDAY")
	private Integer sunday;
	
	@Column(name="MONDAY")
	private Integer monday;
	
	@Column(name="TUESDAY")
	private Integer tuesday;
	
	@Column(name="WEDNESDAY")
	private Integer wednesday;
	
	@Column(name="THURSDAY")
	private Integer thursday;
	
	@Column(name="FRIDAY")
	private Integer friday;
	
	@Column(name="SATURDAY")
	private Integer saturday;
	
	@Transient
	private Integer adultprice;
	
	@Transient
	private Integer childrenprice;
	
	public Totalbus2() {
		
	}

	public Totalbus2(Integer busnumber, String routeid, String tripname, String area, Integer direction,
			String initialstation, String finalstation, Date initialtime, Integer totalseats, Integer remainseats,
			String note, String traveltime, Integer sunday, Integer monday, Integer tuesday, Integer wednesday,
			Integer thursday, Integer friday, Integer saturday, Integer adultprice, Integer childrenprice) {
		super();
		this.busnumber = busnumber;
		this.routeid = routeid;
		this.tripname = tripname;
		this.area = area;
		this.direction = direction;
		this.initialstation = initialstation;
		this.finalstation = finalstation;
		this.initialtime = initialtime;
		this.totalseats = totalseats;
		this.remainseats = remainseats;
		this.note = note;
		this.traveltime = traveltime;
		this.sunday = sunday;
		this.monday = monday;
		this.tuesday = tuesday;
		this.wednesday = wednesday;
		this.thursday = thursday;
		this.friday = friday;
		this.saturday = saturday;
		this.adultprice = adultprice;
		this.childrenprice = childrenprice;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Totalbus2 [busnumber=");
		builder.append(busnumber);
		builder.append(", routeid=");
		builder.append(routeid);
		builder.append(", tripname=");
		builder.append(tripname);
		builder.append(", area=");
		builder.append(area);
		builder.append(", direction=");
		builder.append(direction);
		builder.append(", initialstation=");
		builder.append(initialstation);
		builder.append(", finalstation=");
		builder.append(finalstation);
		builder.append(", initialtime=");
		builder.append(initialtime);
		builder.append(", totalseats=");
		builder.append(totalseats);
		builder.append(", remainseats=");
		builder.append(remainseats);
		builder.append(", note=");
		builder.append(note);
		builder.append(", traveltime=");
		builder.append(traveltime);
		builder.append(", sunday=");
		builder.append(sunday);
		builder.append(", monday=");
		builder.append(monday);
		builder.append(", tuesday=");
		builder.append(tuesday);
		builder.append(", wednesday=");
		builder.append(wednesday);
		builder.append(", thursday=");
		builder.append(thursday);
		builder.append(", friday=");
		builder.append(friday);
		builder.append(", saturday=");
		builder.append(saturday);
		builder.append(", adultprice=");
		builder.append(adultprice);
		builder.append(", childrenprice=");
		builder.append(childrenprice);
		builder.append("]");
		return builder.toString();
	}

	public Integer getBusnumber() {
		return busnumber;
	}

	public void setBusnumber(Integer busnumber) {
		this.busnumber = busnumber;
	}

	public String getRouteid() {
		return routeid;
	}

	public void setRouteid(String routeid) {
		this.routeid = routeid;
	}

	public String getTripname() {
		return tripname;
	}

	public void setTripname(String tripname) {
		this.tripname = tripname;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Integer getDirection() {
		return direction;
	}

	public void setDirection(Integer direction) {
		this.direction = direction;
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

	public Date getInitialtime() {
		return initialtime;
	}

	public void setInitialtime(Date initialtime) {
		this.initialtime = initialtime;
	}

	public Integer getTotalseats() {
		return totalseats;
	}

	public void setTotalseats(Integer totalseats) {
		this.totalseats = totalseats;
	}

	public Integer getRemainseats() {
		return remainseats;
	}

	public void setRemainseats(Integer remainseats) {
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

	public Integer getSunday() {
		return sunday;
	}

	public void setSunday(Integer sunday) {
		this.sunday = sunday;
	}

	public Integer getMonday() {
		return monday;
	}

	public void setMonday(Integer monday) {
		this.monday = monday;
	}

	public Integer getTuesday() {
		return tuesday;
	}

	public void setTuesday(Integer tuesday) {
		this.tuesday = tuesday;
	}

	public Integer getWednesday() {
		return wednesday;
	}

	public void setWednesday(Integer wednesday) {
		this.wednesday = wednesday;
	}

	public Integer getThursday() {
		return thursday;
	}

	public void setThursday(Integer thursday) {
		this.thursday = thursday;
	}

	public Integer getFriday() {
		return friday;
	}

	public void setFriday(Integer friday) {
		this.friday = friday;
	}

	public Integer getSaturday() {
		return saturday;
	}

	public void setSaturday(Integer saturday) {
		this.saturday = saturday;
	}

	public Integer getAdultprice() {
		return adultprice;
	}

	public void setAdultprice(Integer adultprice) {
		this.adultprice = adultprice;
	}

	public Integer getChildrenprice() {
		return childrenprice;
	}

	public void setChildrenprice(Integer childrenprice) {
		this.childrenprice = childrenprice;
	}

	
	
	
	
}

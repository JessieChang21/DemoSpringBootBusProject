package tw.bus.schedule.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "totalbus")
@Component
public class BusTimes {
	@Id @Column(name="BUSNUMBER")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int busNumber;
	
	@Column(name="ROUTEID")
	private String routeId;
	
	@Column(name="TRIPNAME")
	private String tripName;
	
	@Column(name="AREA")
	private String area;
	
	@Column(name="INITIALSTATION")
	private String initialStation;
	
	@Column(name="FINALSTATION")
	private String finalStation;
	
	@Column(name="INITIALTIME")
	private String initialTime;
	
	@Column(name="TOTALSEATS")
	private int totalSeats;
	
	@Column(name="REMAINSEATS")
	private int remainSeats;
	
	@Column(name="NOTE")
	private String note;
	
	@Column(name="TRAVELTIME")
	private String travelTime;
	
	private int sunday;
	private int monday;
	private int tuesday;
	private int wednesday;
	private int thursday;
	private int friday;
	private int saturday;
	
	public int getBusNumber() {
		return busNumber;
	}
	public void setBusNumber(int busNumber) {
		this.busNumber = busNumber;
	}
	public String getRouteId() {
		return routeId;
	}
	public void setRouteId(String routeId) {
		this.routeId = routeId;
	}
	public String getTripName() {
		return tripName;
	}
	public void setTripName(String tripName) {
		this.tripName = tripName;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getInitialStation() {
		return initialStation;
	}
	public void setInitialStation(String initialStation) {
		this.initialStation = initialStation;
	}
	public String getFinalStation() {
		return finalStation;
	}
	public void setFinalStation(String finalStation) {
		this.finalStation = finalStation;
	}
	public String getInitialTime() {
		return initialTime;
	}
	public void setInitialTime(String initialTime) {
		this.initialTime = initialTime;
	}
	public int getTotalSeats() {
		return totalSeats;
	}
	public void setTotalSeats(int totalSeats) {
		this.totalSeats = totalSeats;
	}
	public int getRemainSeats() {
		return remainSeats;
	}
	public void setRemainSeats(int remainSeats) {
		this.remainSeats = remainSeats;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getTravelTime() {
		return travelTime;
	}
	public void setTravelTime(String travelTime) {
		this.travelTime = travelTime;
	}
	public int getSunday() {
		return sunday;
	}
	public void setSunday(int sunday) {
		this.sunday = sunday;
	}
	public int getMonday() {
		return monday;
	}
	public void setMonday(int monday) {
		this.monday = monday;
	}
	public int getTuesday() {
		return tuesday;
	}
	public void setTuesday(int tuesday) {
		this.tuesday = tuesday;
	}
	public int getWednesday() {
		return wednesday;
	}
	public void setWednesday(int wednesday) {
		this.wednesday = wednesday;
	}
	public int getThursday() {
		return thursday;
	}
	public void setThursday(int thursday) {
		this.thursday = thursday;
	}
	public int getFriday() {
		return friday;
	}
	public void setFriday(int friday) {
		this.friday = friday;
	}
	public int getSaturday() {
		return saturday;
	}
	public void setSaturday(int saturday) {
		this.saturday = saturday;
	}
	
	
	

}

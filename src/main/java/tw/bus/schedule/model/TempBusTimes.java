package tw.bus.schedule.model;

import java.text.SimpleDateFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "temporarybus")
@Component
public class TempBusTimes {
	
	@Id @Column(name="TESTBUSNUMBER")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer testBusNumber;
	
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
	private Integer totalSeats;
	
	@Column(name="NOTE")
	private String note;
	
	@Column(name="TRAVELTIME")
	private String travelTime;
	

	private Integer sunday;
	private Integer monday;
	private Integer tuesday;
	private Integer wednesday;
	private Integer thursday;
	private Integer friday;
	private Integer saturday;
	
	@Column(name="EMPOLYEENAME")
	private String empolyeeName;
	
	@Column(name="TOEXAMINENOTE")
	private String toExamineNote;
	
	@Column(name="TOEXAMINE")
	private Integer toExamine;
	
	@Column(name="TOEXAMINEDATE")
	private String toExamineDate;
	
	@Column(name="MANAGERNAME")
	private String managerName;
	
	@Column(name="EXAMINENOTE")
	private String examineNote;
	
	@Column(name="BUSNUMBER")
	private Integer busNumberPo;

	@Column(name="PASSDATE")
	private String passDate;
	
	
	public Integer getTestBusNumber() {
		return testBusNumber;
	}

	public void setTestBusNumber(Integer testBusNumber) {
		this.testBusNumber = testBusNumber;
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

	public Integer getTotalSeats() {
		return totalSeats;
	}

	public void setTotalSeats(Integer totalSeats) {
		this.totalSeats = totalSeats;
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

	public String getEmpolyeeName() {
		return empolyeeName;
	}

	public void setEmpolyeeName(String empolyeeName) {
		this.empolyeeName = empolyeeName;
	}

	public String getToExamineNote() {
		return toExamineNote;
	}

	public void setToExamineNote(String toExamineNote) {
		this.toExamineNote = toExamineNote;
	}

	public Integer getToExamine() {
		return toExamine;
	}

	public void setToExamine(Integer toExamine) {
		this.toExamine = toExamine;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getExamineNote() {
		return examineNote;
	}

	public void setExamineNote(String examineNote) {
		this.examineNote = examineNote;
	}

	public Integer getBusNumberPo() {
		return busNumberPo;
	}

	public void setBusNumberPo(Integer busNumberPo) {
		this.busNumberPo = busNumberPo;
	}

	public String getToExamineDate() {
		return toExamineDate;
	}

	public void setToExamineDate(String toExamineDate) {
		this.toExamineDate = toExamineDate;
	}

	public String getPassDate() {
		return passDate;
	}

	public void setPassDate(String passDate) {
		this.passDate = passDate;
	}


	
	

}

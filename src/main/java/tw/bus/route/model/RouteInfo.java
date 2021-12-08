package tw.bus.route.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
//@IdClass(RouteInfo.InnerIdClass.class)
@Table(name = "routeinfo")
@Component
public class RouteInfo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ROUTEINFOID")
	private Integer routeInfoId;
	
	@Column(name = "ROUTEID")
	private String routeId;
	
	@Column(name = "TRIPNAME")
	private String tripName;
	
	@Column(name = "AREA")
	private String area;
	
	@Column(name = "STATIONSEQUENCE")
	private int stationSequence;
	
	@Column(name = "STATION")
	private String station;
	
	@Column(name = "SEQUENCETIME")
	private int sequenceTime;
	
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
	public int getStationSequence() {
		return stationSequence;
	}
	public void setStationSequence(int stationSequence) {
		this.stationSequence = stationSequence;
	}
	public String getStation() {
		return station;
	}
	public void setStation(String station) {
		this.station = station;
	}
	public int getSequenceTime() {
		return sequenceTime;
	}
	public void setSequenceTime(int sequenceTime) {
		this.sequenceTime = sequenceTime;
	}
	public Integer getRouteInfoId() {
		return routeInfoId;
	}
	public void setRouteInfoId(Integer routeInfoId) {
		this.routeInfoId = routeInfoId;
	}

//	public static class InnerIdClass implements Serializable {
//        private String routeId;
//        private int stationSequence;
//    }
	
	
	
}

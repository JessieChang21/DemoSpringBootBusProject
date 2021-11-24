package tw.bus.query.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="route")
@Component
public class Route {
	@Id @Column(name="ROUTEID")
	private String routeId;
	
	@Column(name="STATIONSEQUENCE")
	private Integer stationSequence;
	
	@Column(name="STATION")
	private String station;
	
	public Route() {
		
	}
	
	public Route(String initStation, String finalStation) {
		this.station = initStation;
		this.station = finalStation;
	}

	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Route [routeId=");
		builder.append(routeId);
		builder.append(", stationSequence=");
		builder.append(stationSequence);
		builder.append(", station=");
		builder.append(station);
		builder.append("]");
		return builder.toString();
	}

	public String getRouteId() {
		return routeId;
	}

	public void setRouteId(String routeId) {
		this.routeId = routeId;
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

	
	

}

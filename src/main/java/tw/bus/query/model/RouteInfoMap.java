package tw.bus.query.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="routeinfomap")
@Component
public class RouteInfoMap {
	@Id @Column(name="ROUTEINFOID")
	private Integer routeinfoid;
	
	@Column(name="ROUTEID")
	private String routeid;
	
	@Column(name="TRIPNAME")
	private String tripname;
	
	@Column(name="AREA")
	private String area;
	
	@Column(name="DIRECTION")
	private Integer direction;
	
	@Column(name="STATIONSEQUENCE")
	private Integer stationsequence;
	
	@Column(name="STATION")
	private String station;
	
	@Column(name="SEQUENCETIME")
	private Integer sequencetime;
	
	@Column(name="LON")
	private BigDecimal lon;
	
	@Column(name="LAN")
	private BigDecimal lan;
	
	public RouteInfoMap() {
		
	}

	public RouteInfoMap(Integer routeinfoid, String routeid, String tripname, String area, Integer direction,
			Integer stationsequence, String station, Integer sequencetime, BigDecimal lon, BigDecimal lan) {
		this.routeinfoid = routeinfoid;
		this.routeid = routeid;
		this.tripname = tripname;
		this.area = area;
		this.direction = direction;
		this.stationsequence = stationsequence;
		this.station = station;
		this.sequencetime = sequencetime;
		this.lon = lon;
		this.lan = lan;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RouteInfoMap [routeinfoid=");
		builder.append(routeinfoid);
		builder.append(", routeid=");
		builder.append(routeid);
		builder.append(", tripname=");
		builder.append(tripname);
		builder.append(", area=");
		builder.append(area);
		builder.append(", direction=");
		builder.append(direction);
		builder.append(", stationsequence=");
		builder.append(stationsequence);
		builder.append(", station=");
		builder.append(station);
		builder.append(", sequencetime=");
		builder.append(sequencetime);
		builder.append(", lon=");
		builder.append(lon);
		builder.append(", lan=");
		builder.append(lan);
		builder.append("]");
		return builder.toString();
	}

	public Integer getRouteinfoid() {
		return routeinfoid;
	}

	public void setRouteinfoid(Integer routeinfoid) {
		this.routeinfoid = routeinfoid;
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

	public Integer getStationsequence() {
		return stationsequence;
	}

	public void setStationsequence(Integer stationsequence) {
		this.stationsequence = stationsequence;
	}

	public String getStation() {
		return station;
	}

	public void setStation(String station) {
		this.station = station;
	}

	public Integer getSequencetime() {
		return sequencetime;
	}

	public void setSequencetime(Integer sequencetime) {
		this.sequencetime = sequencetime;
	}

	public BigDecimal getLon() {
		return lon;
	}

	public void setLon(BigDecimal lon) {
		this.lon = lon;
	}

	public BigDecimal getLan() {
		return lan;
	}

	public void setLan(BigDecimal lan) {
		this.lan = lan;
	}
	
	
	
	
	
	


}

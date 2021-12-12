package tw.bus.route.model;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "routes")
@Component
public class Routes {
	
	@Id @Column(name="ROUTEID")
	private String routeId;
	
	@Column(name = "TRIPNAME")
	private String tripName;
	
	@Column(name = "AREA")
	private String area;
	
	@Column(name = "direction")
	private Integer direction;
	
	@Column(name = "initialstation")
	private String initialStation;
	
	@Column(name = "finalstation")
	private String finalStation;
	
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
	public Integer getDirection() {
		return direction;
	}
	public void setDirection(Integer direction) {
		this.direction = direction;
	}
	public Routes(String routeId, String tripName, String area, Integer direction) {
		super();
		this.routeId = routeId;
		this.tripName = tripName;
		this.area = area;
		this.direction = direction;
	}
	
	public Routes() {
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
	
	
	

}

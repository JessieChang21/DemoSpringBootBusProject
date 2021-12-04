package tw.bus.query.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="routeswithstation")
@Component
public class RoutesWithStation {
	@Id @Column(name="ROUTEID")
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

	public RoutesWithStation() {
		
	}

	public RoutesWithStation(String routeid, String tripname, String area, Integer direction, String initialstation,
			String finalstation) {
		super();
		this.routeid = routeid;
		this.tripname = tripname;
		this.area = area;
		this.direction = direction;
		this.initialstation = initialstation;
		this.finalstation = finalstation;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Routes [routeid=");
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
		builder.append("]");
		return builder.toString();
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
	
	
	
	
	

}

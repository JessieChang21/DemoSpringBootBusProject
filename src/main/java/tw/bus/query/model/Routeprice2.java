package tw.bus.query.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="routeprice")
@Component
public class Routeprice2 {
	@Column(name="ROUTEPRICEID")
	private Integer routePriceid;
	
	@Id 
	@Column(name="ROUTEID")
	private String routeid;
	
	@Column(name="TICKETTYPE")
	private String tickettype;
	
	@Column(name="PRICE")
	private Integer price;
	
	@Column(name="TRAVELTIME")
	private String traveltime;
	
	
	public Routeprice2() {
		
	}


	public Routeprice2(Integer routePriceid, String routeid, String tickettype, Integer price, String traveltime) {
		super();
		this.routePriceid = routePriceid;
		this.routeid = routeid;
		this.tickettype = tickettype;
		this.price = price;
		this.traveltime = traveltime;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Routeprice2 [routePriceid=");
		builder.append(routePriceid);
		builder.append(", routeid=");
		builder.append(routeid);
		builder.append(", tickettype=");
		builder.append(tickettype);
		builder.append(", price=");
		builder.append(price);
		builder.append(", traveltime=");
		builder.append(traveltime);
		builder.append("]");
		return builder.toString();
	}


	public Integer getRoutePriceid() {
		return routePriceid;
	}


	public void setRoutePriceid(Integer routePriceid) {
		this.routePriceid = routePriceid;
	}


	public String getRouteid() {
		return routeid;
	}


	public void setRouteid(String routeid) {
		this.routeid = routeid;
	}


	public String getTickettype() {
		return tickettype;
	}


	public void setTickettype(String tickettype) {
		this.tickettype = tickettype;
	}


	public Integer getPrice() {
		return price;
	}


	public void setPrice(Integer price) {
		this.price = price;
	}


	public String getTraveltime() {
		return traveltime;
	}


	public void setTraveltime(String traveltime) {
		this.traveltime = traveltime;
	}

	
	
	
	
}

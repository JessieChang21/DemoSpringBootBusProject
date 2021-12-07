package tw.bus.ticket.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.springframework.stereotype.Component;

@Entity @Table(name="memberorder2")
@Component
public class Memberorder2 {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer oid;
	
	@Column(name="ORDERID")
	private Integer orderid;
	
	@Column(name="EMAIL")
	private String email;
	
	@Column(name="BUSNUMBER")
	private Integer busnumber;
	
	@Column(name="INITIALSTATION")
	private String initialstation;
	
	@Column(name="FINALSTATION")
	private String finalstation;
	
	@Column(name="TRAVELDATE")
	private String traveldate;
//	private Date traveldate;
	
	@Column(name="INITIALTIME")
	private Date initialtime; // String
	
	@Column(name="TRAVELTIME")
	private String traveltime;
	
	@Column(name="TICKETTYPE")
	private String tickettype;
	
	@Column(name="PRICE")
	private Integer price;
	
	@Column(name="SEAT")
	private Integer seat;
	
	@Column(name="ORDERQTY")
	private Integer orderqty;
	
	@Column(name="ORDERDATE")
	private Date orderdate;
	
	public Memberorder2() {
		
	}

	public Memberorder2(Integer oid, Integer orderid, String email, Integer busnumber, String initialstation,
			String finalstation, String traveldate, Date initialtime, String traveltime, String tickettype,
			Integer price, Integer seat, Integer orderqty, Date orderdate) {
		super();
		this.oid = oid;
		this.orderid = orderid;
		this.email = email;
		this.busnumber = busnumber;
		this.initialstation = initialstation;
		this.finalstation = finalstation;
		this.traveldate = traveldate;
		this.initialtime = initialtime;
		this.traveltime = traveltime;
		this.tickettype = tickettype;
		this.price = price;
		this.seat = seat;
		this.orderqty = orderqty;
		this.orderdate = orderdate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Memberorder2 [oid=");
		builder.append(oid);
		builder.append(", orderid=");
		builder.append(orderid);
		builder.append(", email=");
		builder.append(email);
		builder.append(", busnumber=");
		builder.append(busnumber);
		builder.append(", initialstation=");
		builder.append(initialstation);
		builder.append(", finalstation=");
		builder.append(finalstation);
		builder.append(", traveldate=");
		builder.append(traveldate);
		builder.append(", initialtime=");
		builder.append(initialtime);
		builder.append(", traveltime=");
		builder.append(traveltime);
		builder.append(", tickettype=");
		builder.append(tickettype);
		builder.append(", price=");
		builder.append(price);
		builder.append(", seat=");
		builder.append(seat);
		builder.append(", orderqty=");
		builder.append(orderqty);
		builder.append(", orderdate=");
		builder.append(orderdate);
		builder.append("]");
		return builder.toString();
	}

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getBusnumber() {
		return busnumber;
	}

	public void setBusnumber(Integer busnumber) {
		this.busnumber = busnumber;
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

	public String getTraveldate() {
		return traveldate;
	}

	public void setTraveldate(String traveldate) {
		this.traveldate = traveldate;
	}

	public Date getInitialtime() {
		return initialtime;
	}

	public void setInitialtime(Date initialtime) {
		this.initialtime = initialtime;
	}

	public String getTraveltime() {
		return traveltime;
	}

	public void setTraveltime(String traveltime) {
		this.traveltime = traveltime;
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

	public Integer getSeat() {
		return seat;
	}

	public void setSeat(Integer seat) {
		this.seat = seat;
	}

	public Integer getOrderqty() {
		return orderqty;
	}

	public void setOrderqty(Integer orderqty) {
		this.orderqty = orderqty;
	}

	public Date getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	
	
	
	
}

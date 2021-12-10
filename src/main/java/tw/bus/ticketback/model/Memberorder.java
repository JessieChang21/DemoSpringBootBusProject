package tw.bus.ticketback.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
//import javax.validation.constraints.NotBlank;

import org.springframework.stereotype.Component;
//import org.springframework.validation.annotation.Validated;

@Entity @Table(name="memberorder")
@Component
//@Validated
public class Memberorder {
	@Id @Column(name="oid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer oid;
	
	@Column(name="orderid")
	private Integer orderid;
	
	@Column(name="email")
	private String email;
	
	// 改了型別
	@Column(name="busnumber")
	private Integer busnumber;
	
	@Column(name="initialstation")
	private String initialstation;
	
	@Column(name="finalstation")
	private String finalstation;
	
	@Column(name="traveldate")
	private String traveldate;
	
	// 改了型別
	@Column(name="initialtime")
	private String initialtime;
	
	@Column(name="traveltime")
	private String traveltime;
	
	@Column(name="tickettype")
	private String tickettype;
	
	@Column(name="price")
	private Integer price;
	
	@Column(name="seat")
	private Integer seat;
	
	@Column(name="orderqty")
	private Integer orderqty;
	
	@Column(name="orderdate")
	private String orderDate;
	
	public Memberorder() {
		
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

	public String getInitialtime() {
		return initialtime;
	}

	public void setInitialtime(String initialtime) {
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

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	
	
	
	
}

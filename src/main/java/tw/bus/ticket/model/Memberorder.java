package tw.bus.ticket.model;

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
	@Id @Column(name="orderid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@NotBlank
	private Integer orderid;
	
//	其他功能尚未完成，暫時寫@Transient
	@Transient
	private String memberid;
	
	@Column(name="busnumber")
	private String busnumber;
	
	@Column(name="initialstation")
	private String initialstation;
	
	@Column(name="finalstation")
	private String finalstation;
	
	@Transient
	private java.util.Date traveldate;
	
	@Column(name="initialtime")
	private java.util.Date initialtime;
	
	@Transient
	private String formatinitaltime;
	
	@Column(name="traveltime")
	private String traveltime;
	
	@Transient
	private String tickettype;
	@Transient
	private Integer price;
	@Transient
	private Integer seat;
	@Transient
	private Integer orderqty;
	
	public Memberorder() {
		
	}
	
	
	public Memberorder(Integer orderid, String busnumber, String initialstation, String finalstation, Date initialtime,
			String formatinitaltime, String traveltime) {
		super();
		this.orderid = orderid;
		this.busnumber = busnumber;
		this.initialstation = initialstation;
		this.finalstation = finalstation;
		this.initialtime = initialtime;
		this.formatinitaltime = formatinitaltime;
		this.traveltime = traveltime;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Memberorder [orderid=");
		builder.append(orderid);
		builder.append(", memberid=");
		builder.append(memberid);
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
		builder.append(", formatinitaltime=");
		builder.append(formatinitaltime);
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
		builder.append("]");
		return builder.toString();
	}


	public Integer getOrderid() {
		return orderid;
	}


	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}


	public String getMemberid() {
		return memberid;
	}


	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}


	public String getBusnumber() {
		return busnumber;
	}


	public void setBusnumber(String busnumber) {
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


	public java.util.Date getTraveldate() {
		return traveldate;
	}


	public void setTraveldate(java.util.Date traveldate) {
		this.traveldate = traveldate;
	}


	public java.util.Date getInitialtime() {
		return initialtime;
	}


	public void setInitialtime(java.util.Date initialtime) {
		this.initialtime = initialtime;
	}


	public String getFormatinitaltime() {
		return formatinitaltime;
	}


	public void setFormatinitaltime(String formatinitaltime) {
		this.formatinitaltime = formatinitaltime;
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


	public int getPrice() {
		return price;
	}


	public void setPrice(Integer price) {
		this.price = price;
	}


	public int getSeat() {
		return seat;
	}


	public void setSeat(Integer seat) {
		this.seat = seat;
	}


	public int getOrderqty() {
		return orderqty;
	}


	public void setOrderqty(Integer orderqty) {
		this.orderqty = orderqty;
	}

	
	
	
	
	
}

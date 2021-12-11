package tw.bus.query.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name="seat")
@Component
public class Seat2 {
	@Id @Column(name="SEATID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer seatid;
	
	@Column(name="BUSNUMBER")
	private Integer busnumber;
	
	@Column(name="SEAT")
	private Integer seat;

	public Seat2() {
		
	}
	
	public Seat2(Integer seatid, Integer busnumber, Integer seat) {
		this.seatid = seatid;
		this.busnumber = busnumber;
		this.seat = seat;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Seatj [seatid=");
		builder.append(seatid);
		builder.append(", busnumber=");
		builder.append(busnumber);
		builder.append(", seat=");
		builder.append(seat);
		builder.append("]");
		return builder.toString();
	}

	public Integer getSeatid() {
		return seatid;
	}

	public void setSeatid(Integer seatid) {
		this.seatid = seatid;
	}

	public Integer getBusnumber() {
		return busnumber;
	}

	public void setBusnumber(Integer busnumber) {
		this.busnumber = busnumber;
	}

	public Integer getSeat() {
		return seat;
	}

	public void setSeat(Integer seat) {
		this.seat = seat;
	}
	
	
	
	
	
	

}

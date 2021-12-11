package tw.bus.schedule.model;

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
//@IdClass(Seats.InnerIdClass.class)
@Table(name = "seat")
@Component
public class Seats {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "SEATID")
	private Integer seatId;
	
	@Column(name = "BUSNUMBER")
	private Integer busNumber;
	
	
	@Column(name = "SEAT")
	private Integer seats;
	
//	public static class InnerIdClass implements Serializable {
//        private String busNumber;
//        private int seats;
//    }

	public int getBusNumber() {
		return busNumber;
	}

	public void setBusNumber(int busNumber) {
		this.busNumber = busNumber;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}
	
	

}

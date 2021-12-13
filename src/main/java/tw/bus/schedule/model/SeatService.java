package tw.bus.schedule.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SeatService {
	@Autowired
	private SeatRepository seatRep;
	
	public void deleteSeatByBusNumber(Integer busNumber){
		seatRep.deleteByBusNumber(busNumber);
	}
	
	public Seats insertSeats(Seats seatNo) {
		return seatRep.save(seatNo);
	}
	
	public Seats findByBusAndSeat(Integer busNumber, Integer seats) {
		return seatRep.findByBusNumberAndSeats(busNumber, seats);
	}
	
}

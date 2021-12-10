package tw.bus.query.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class Seat2Service {
	@Autowired
	private Seat2Repository seatResp;
	
	public List<Seat2> findByBusnumber(Integer busnumber) {
		 return seatResp.findByBusnumber(busnumber);
	}

	public Integer deleteSeatAfterOrder(Integer seatid) {
		return seatResp.deleteSeatAfterOrder(seatid);
	}
	
	public Integer insertSeatAfterDeleteOrder(Integer busnumber, Integer seatid) {
		return seatResp.insertSeatAfterDeleteOrder(busnumber,seatid);
	}
	
}

package tw.bus.employee.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class HolidayService {

	@Autowired
	private HolidayRepository hResp;
	
	public Holiday findById(String id) {
		Optional<Holiday> op1 = hResp.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	public List<Holiday> findAll(){
		return hResp.findAll();
	}
	
	public Page<Holiday> findAllByPage(Pageable pageable){
		return hResp.findAll(pageable);
	}
	
	public Holiday insertHoliday(Holiday h) {
		return hResp.save(h);
	}
	
	public Holiday updateHoliday(Holiday h) {
		return hResp.save(h);
	}
	
	public void deleteHoliday(Holiday h) {
		hResp.delete(h);
	}

}

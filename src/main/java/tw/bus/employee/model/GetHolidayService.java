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
public class GetHolidayService {

	@Autowired
	private GetHolidayRepository ghResp;
	
	public GetHoliday findById(String id) {
		Optional<GetHoliday> op1 = ghResp.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	public List<GetHoliday> findAll(){
		return ghResp.findAll();
	}
	
	public Page<GetHoliday> findAllByPage(Pageable pageable){
		return ghResp.findAll(pageable);
	}
	
	public GetHoliday insertGetHoliday(GetHoliday gh) {
		return ghResp.save(gh);
	}
	
	public GetHoliday updateGetHoliday(GetHoliday gh) {
		return ghResp.save(gh);
	}
	
	public void deleteGetHoliday(GetHoliday gh) {
		ghResp.delete(gh);
	}

}

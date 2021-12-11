package tw.bus.schedule.model;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TempBusTimeService {
	
	@Autowired
	private TempBusTimeRepository tempBusRep;
	
	public TempBusTimes insertTempBusTimes(TempBusTimes tempBus) {
		return tempBusRep.save(tempBus);
	}
	
	public TempBusTimes updateTempBusTimes(TempBusTimes tempBus){
		return tempBusRep.save(tempBus);
	}
	
	public Page<TempBusTimes> findTempBusTimesByOneExa(Integer toExamined, Pageable pageable){
		return tempBusRep.findByToExamine(toExamined, pageable);
	}
	
	public Page<TempBusTimes> findTempBusTimesByTwoExa(Integer toExamined1, Integer toExamined2, Pageable pageable){
		return tempBusRep.findByToExamineOrToExamine(toExamined1, toExamined2, pageable);
	}
	
	public Page<TempBusTimes> findTempBusTimesByThreeExa(Integer toExamined1, Integer toExamined2, Integer toExamined3, Pageable pageable){
		return tempBusRep.findByToExamineOrToExamineOrToExamine(toExamined1, toExamined2, toExamined3, pageable);
	}
	
	public Page<TempBusTimes> findAllTempBusTimesByPage(Pageable pageable){
		return tempBusRep.findAll(pageable);
	}
	
	public TempBusTimes findTempBusById(Integer testBusId) {
		Optional<TempBusTimes> op1 = tempBusRep.findById(testBusId);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	public Optional<TempBusTimes> findTempBusByBusNumber(Integer busNumber) {
		Optional<TempBusTimes> op1 = tempBusRep.findByBusNumberPo(busNumber);
		return op1;
	}

}

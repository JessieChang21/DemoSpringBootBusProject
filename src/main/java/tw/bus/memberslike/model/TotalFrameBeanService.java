package tw.bus.memberslike.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TotalFrameBeanService {

	@Autowired
	TotalFrameBeanRepository TRop;
	
	public TotalFrameBean saveTotalFrame(TotalFrameBean totalframebean) {
		return TRop.save(totalframebean);
	}
}

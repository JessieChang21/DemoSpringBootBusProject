package tw.bus.query.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TotalbusService {
	@Autowired
	private TotalbusRepository tbResp;
	
	public List<Totalbus> findByRouteid(String routeid) {
		return tbResp.findByRouteid(routeid);
	}
	
	public Totalbus findById(String busnumber) {
		Optional<Totalbus> op1 = tbResp.findById(busnumber);
		return op1.get();
	}

}

package tw.bus.query.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
@Transactional
public class Routeprice2Service {
	@Autowired
	private Routeprice2Repository rPriceResp;
	
	public Routeprice2 findByRouteid(String id) {
		 return rPriceResp.findByRouteid(id);
	}

}

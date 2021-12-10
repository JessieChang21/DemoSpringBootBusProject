package tw.bus.members.model;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Transactional
@Service
public class AdressService {

	@Autowired
	private AdressRepository aRpo;
	
	public AdressBean findById(Integer Id) {
		Optional<AdressBean> op2 = aRpo.findById(Id);
		if(op2.isPresent()) {
			return op2.get();
		}
		return null;
	}
}

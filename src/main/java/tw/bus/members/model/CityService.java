package tw.bus.members.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.bus.exception.UserNotFoundException;

@Service
@Transactional
public class CityService {

	@Autowired
	private CityRepository ARpo;
	
	public List<CityBean> findAll(){
		return ARpo.findAll();
	}
	
	public CityBean findByCityname(String cityname) {
		Optional<CityBean> opl = ARpo.findByCityname(cityname);
		 
		 if(opl.isEmpty()) {
			 throw new UserNotFoundException("Can't find user!");
		 }
		 return opl.get();
	}
}

package tw.bus.members.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.bus.exception.UserNotFoundException;

@Service
@Transactional
public class AreaService {

	@Autowired
	private AreaRepository ARpo;
	
	public List<AreaBean> findAll(){
		return ARpo.findAll();
	}
	
	public AreaBean findByAreaname(String Areaname) {
		Optional<AreaBean> opl = ARpo.findByAreaname(Areaname);
		 
		 if(opl.isEmpty()) {
			 throw new UserNotFoundException("Can't find user!");
		 }
		 return opl.get();
	}
	
//	public List<AreaBean> findById(Integer id) {
//		Optional<AreaBean> op1 = ARpo.findById(id);
//		if(op1.isPresent()) {
//			return (List<AreaBean>) op1.get();
//		}
//		return null;
//	}
}

package tw.bus.memberslike.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.bus.members.model.Members;

@Service
@Transactional
public class FrameDayTotalService {
	
	@Autowired
	private FrameDayTotalRepository fRepo;

	public FrameDayTotal findById(Integer id) {
		Optional<FrameDayTotal> op1 = fRepo.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	public FrameDayTotal updateFrameDayTotal(FrameDayTotal framedaytotal) {
		return fRepo.save(framedaytotal);
	}

	public List<FrameDayTotal> findAll(){
		return fRepo.findAll();
	}
}

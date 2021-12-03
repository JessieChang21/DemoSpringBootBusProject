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
public class RankService {

	@Autowired
	private RankRepository rResp;
	
	public Rank findById(String id) {
		Optional<Rank> op1 = rResp.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	public List<Rank> findAll(){
		return rResp.findAll();
	}
	
	public Page<Rank> findAllByPage(Pageable pageable){
		return rResp.findAll(pageable);
	}
	
	public Rank insertRank(Rank r) {
		return rResp.save(r);
	}
	
	public Rank updateRank(Rank r) {
		return rResp.save(r);
	}
	
	public void deleteRank(Rank r) {
		rResp.delete(r);
	}

}

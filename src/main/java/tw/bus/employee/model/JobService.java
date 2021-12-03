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
public class JobService {

	@Autowired
	private JobRepository jResp;
	
	public Job findById(String id) {
		Optional<Job> op1 = jResp.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	public List<Job> findAll(){
		return jResp.findAll();
	}
	
	public Page<Job> findAllByPage(Pageable pageable){
		return jResp.findAll(pageable);
	}
	
	public Job insertJob(Job j) {
		return jResp.save(j);
	}
	
	public Job updateJob(Job j) {
		return jResp.save(j);
	}
	
	public void deleteJob(Job j) {
		jResp.delete(j);
	}

}

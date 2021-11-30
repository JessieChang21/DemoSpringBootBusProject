package tw.bus.announcemen.model;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import tw.bus.announcemen.model.LostAndFound;



@Service
@Transactional
public class LostAndFoundService {

	@Autowired
	LostAndFoundRepository lostAndFoundRepository;
	
	public LostAndFound insert(LostAndFound lostAndFound) {
		return lostAndFoundRepository.save(lostAndFound);
	}
	
	public LostAndFound update(LostAndFound lostAndFound) {
		return lostAndFoundRepository.save(lostAndFound);
	}
	
	public void deleteById(Integer id) {
		lostAndFoundRepository.deleteById(id);
	}
	
	public LostAndFound findById(Integer id) {
		Optional<LostAndFound> op1 = lostAndFoundRepository.findById(id);
		return op1.get();
	}
	
	public List<LostAndFound> findAll(){
		return lostAndFoundRepository.findAll();
	}
	
	public List<LostAndFound> findByItdateLike(String itdate){
		return lostAndFoundRepository.findByItdateLike(itdate);
	}

	public Page<LostAndFound> findAllByPage(Pageable pageable) {
		return lostAndFoundRepository.findAll(pageable);
	}
	
}

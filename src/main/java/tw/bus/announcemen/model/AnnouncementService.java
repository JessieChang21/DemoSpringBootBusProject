package tw.bus.announcemen.model;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import tw.bus.announcemen.model.Announcement;

@Service
@Transactional
public class AnnouncementService {

	@Autowired
	AnnouncementRepository announcementRepository;
	
	public Announcement insert(Announcement announcement) {
		return announcementRepository.save(announcement);
	}
	
	public Announcement update(Announcement announcement) {
		return announcementRepository.save(announcement);
	}
	
	public void deleteById(Integer id) {
		announcementRepository.deleteById(id);
	}
	
	public Announcement findById(Integer id) {
		Optional<Announcement> op1 = announcementRepository.findById(id);
		return op1.get();
	}
	
	public List<Announcement> findAll(){
		return announcementRepository.findAll();
	}
	
	public List<Announcement> findtop3(){
		return announcementRepository.findtop3();
	}
	
	public Page<Announcement> findAllByPage(Pageable pageable){
		return announcementRepository.findAll2(pageable);
	}
	
	public List<Announcement> findbyclassify(String ancategory){
		return announcementRepository.findByancategoryLike(ancategory);
	}
	
}

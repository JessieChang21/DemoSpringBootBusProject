package tw.bus.announcemen.model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.bus.announcemen.model.Announcement;


public interface AnnouncementRepository extends JpaRepository<Announcement, Integer> {

	@Query(value = "Select * From Announcement ", nativeQuery = true)
	public List<Announcement> findAll();
	
	@Query(value = "Select * From Announcement ORDER BY id DESC", nativeQuery = true)
	Page<Announcement> findAll2(Pageable pageable);
	
	@Query(value = "Select Top 3 * From Announcement ORDER BY id DESC", nativeQuery = true)
	public List<Announcement> findtop3();
	
	public List<Announcement> findByancategoryLike(String ancategory);
	
}

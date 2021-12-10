package tw.bus.employee.model;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
//public interface GetHolidayRepository extends JpaRepository<GetHoliday, GetHolidaypk>
public interface GetHolidayRepository extends JpaRepository<GetHoliday, String> {
	@Modifying
	@Transactional
	@Query(value="insert into GetHoliday(employeeid,substituteid,date,timeperiod,totalhours,release)values(?1,?2,?3,?4,?5,?6) ", nativeQuery = true)
	public void InsertGetHoliday(String employeeid,String substituteid,String date,String timeperiod,Integer totalhours,String release);
	
	@Query(value="select count(*) from GetHoliday where employeeid = ?1 and date = ?2 and timeperiod = ?3", nativeQuery = true)
	 public Integer hasData(String employeeid,String date,String timeperiod);
	
	@Modifying
	@Transactional
	@Query(value="update GetHoliday set release = 'Y' where employeeid = ?1 and date = ?2 and timeperiod = ?3 ", nativeQuery = true)
	public void Updaterelease(String employeeid,String date,String timeperiod);
	
	@Modifying
	@Transactional
	@Query(value="delete from GetHoliday where employeeid = ?1 and date = ?2 and timeperiod = ?3 ", nativeQuery = true)
	public void DeleteGetHoliday(String employeeid,String date,String timeperiod);
	
	@Query(value="select * from GetHoliday where release = 'N'", nativeQuery = true)
	 public Page<GetHoliday> QueryAllUnRelease(Pageable pageable);
	
	@Query(value="select * from GetHoliday where where employeeid = ?1 ", nativeQuery = true)
	 public Page<GetHoliday> QueryAllbyId(Pageable pageable,String employeeid);

}

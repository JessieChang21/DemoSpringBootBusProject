package tw.bus.employee.model;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface GetHolidayRepository extends JpaRepository<GetHoliday, GetHolidaypk> {
	@Modifying
	@Query(value="insert into GetHoliday(employeeid,substituteid,date,timeperiod,totalhours,release)values(?1,?2,?3,?4,?5,?6) ", nativeQuery = true)
	public void InsertGetHoliday(String employeeid,String substituteid,String date,String timeperiod,Integer totalhours,String release);
	
	@Query(value="select count(*) from GetHoliday where employeeid = ?1 and date = ?2 and timeperiod = ?3", nativeQuery = true)
	 public Integer hasData(String employeeid,String date,String timeperiod);
	
	
	@Modifying
	@Query(value="update GetHoliday set release = 'Y' where employeeid = ?1 and date = ?2 and timeperiod = ?3 and release = 'Y' ", nativeQuery = true)
	public void Updaterelease(String employeeid,String date,String timeperiod);
	
	@Modifying
	@Query(value="delete from GetHoliday where employeeid = ?1 and date = ?2 and timeperiod = ?3 ", nativeQuery = true)
	public void DeleteGetHoliday(String employeeid,String date,String timeperiod);
	
	@Query(value=" select employeeid+'-'+e1.employeename as employeeid, "
			+ " substituteid+'-'+e2.employeename as substituteid, "
			+ " date,timeperiod,totalhours,release "
			+ " from GetHoliday as g "
			+ " left join Employee as e1 "
			+ " on g.employeeid = e1.id "
			+ " left join Employee as e2 "
			+ " on g.substituteid = e2.id "
			+ " where release = 'N' ", nativeQuery = true)
	 public Page<GetHoliday> QueryAllUnRelease(Pageable pageable);
	
	@Query(value=" select g.employeeid, "
			+ " g.substituteid+'-'+e2.employeename as substituteid, "
			+ " g.date,g.timeperiod,g.totalhours,g.release "
			+ " from GetHoliday as g "
			+ " left join Employee as e1 "
			+ " on g.employeeid = e1.id "
			+ " left join Employee as e2 "
			+ " on g.substituteid = e2.id "
			+ " where  release = 'Y' and employeeid = :empid ", nativeQuery = true)
	 public Page<GetHoliday> QueryAllbyId_Y(Pageable pageable,@Param("empid") String empid);
	
	@Query(value=" select g.employeeid, "
			+ " g.substituteid+'-'+e2.employeename as substituteid, "
			+ " g.date,g.timeperiod,g.totalhours,g.release "
			+ " from GetHoliday as g "
			+ " left join Employee as e1 "
			+ " on g.employeeid = e1.id "
			+ " left join Employee as e2 "
			+ " on g.substituteid = e2.id "
			+ " where  release = 'N' and employeeid = :empid ", nativeQuery = true)
	 public Page<GetHoliday> QueryAllbyId_N(Pageable pageable,@Param("empid") String empid);
	
	@Query(value="select * from GetHoliday where release = 'N' ", nativeQuery = true)
	 public List<GetHoliday> finAllUnRelease();
	

}

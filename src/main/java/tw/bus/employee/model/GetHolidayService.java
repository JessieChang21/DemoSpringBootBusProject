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
public class GetHolidayService {

	@Autowired
	private GetHolidayRepository ghResp;
	
	public void InsertGetHoliday(String employeeid,String substituteid,String date,String timeperiod,Integer totalhours,String release) {
		ghResp.InsertGetHoliday(employeeid, substituteid, date, timeperiod, totalhours, release);
	}
	//依照employeeid, date, timeperiod檢查是否已存在請假資料,0:沒有,>=1:已存在請假資料
	public Integer hasData(String employeeid,String date,String timeperiod) {
		return ghResp.hasData(employeeid, date, timeperiod);
	}
	//主管放行
	public void Updaterelease(String employeeid,String date,String timeperiod) {
		ghResp.Updaterelease(employeeid, date, timeperiod);
	}
	public Page<GetHoliday> QueryAllUnRelease(Pageable pageable){
		return ghResp.QueryAllUnRelease(pageable);
	}
	//銷假
	public void DeleteGetHoliday(String employeeid,String date,String timeperiod) {
		ghResp.DeleteGetHoliday(employeeid, date, timeperiod);
	}
	
	public Page<GetHoliday> QueryAllbyId_Y(Pageable pageable,String employeeid){
		return ghResp.QueryAllbyId_Y(pageable,employeeid);
	}
	
	public Page<GetHoliday> QueryAllbyId_N(Pageable pageable,String employeeid){
		return ghResp.QueryAllbyId_N(pageable,employeeid);
	}
	
	/**public GetHoliday findById(String id) {
		Optional<GetHoliday> op1 = ghResp.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}**/
	
	
	
	public List<GetHoliday> findAll(){
		return ghResp.findAll();
	}
	
	public Page<GetHoliday> findAllByPage(Pageable pageable){
		return ghResp.findAll(pageable);
	}
	
	public List<GetHoliday> finAllUnRelease(){
		return ghResp.finAllUnRelease();
	}
	
	public GetHoliday insertGetHoliday(GetHoliday gh) {
		return ghResp.save(gh);
	}
	
	public GetHoliday updateGetHoliday(GetHoliday gh) {
		return ghResp.save(gh);
	}
	
	public void deleteGetHoliday(GetHoliday gh) {
		ghResp.delete(gh);
	}

}

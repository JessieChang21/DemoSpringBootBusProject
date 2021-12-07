package tw.bus.query.model;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class Totalbus2Service {
	
	private Totalbus2Repository tbResp;
	private Routeprice2Repository rPriceResp;
	
	@Autowired
	public Totalbus2Service(Totalbus2Repository tbResp, Routeprice2Repository rPriceResp) {
		this.tbResp = tbResp;
		this.rPriceResp = rPriceResp;
	}


	// 依使用者輸入資訊查詢車次
	public List<Totalbus2> queryRoutesByTripname(String tripname, String weekday, String initialtime, Integer adult, Integer children) throws ParseException{
		Integer qty = adult + children;
		List<Totalbus2> query = tbResp.queryRoutesByTripname(tripname, initialtime, qty);

		// 判斷星期幾
		List<Totalbus2> query2 = new ArrayList<Totalbus2>();	
		for(Totalbus2 bean : query) {
			if(weekday.equals("Sunday") && bean.getSunday() ==1) {
				query2.add(bean);
			}else if(weekday.equals("Monday") && bean.getMonday() ==1) {
				query2.add(bean);
			}else if(weekday.equals("Tuesday") && bean.getTuesday() ==1) {
				query2.add(bean);
			}else if(weekday.equals("Wednesday") && bean.getWednesday() ==1) {
				query2.add(bean);
			}else if(weekday.equals("Thursday") && bean.getThursday() ==1) {
				query2.add(bean);
			}else if(weekday.equals("Friday") && bean.getFriday() ==1) {
				query2.add(bean);
			}else if(weekday.equals("Saturday") && bean.getSaturday() ==1) {
				query2.add(bean);
			}
		}
		
		// 查詢票價
        for(Totalbus2 bean : query2) {
        	Routeprice2 routeprice = rPriceResp.findByRouteid(bean.getRouteid());
        	int adultprice = routeprice.getPrice();
        	int childrenprice = (int)(adultprice * 0.5);
        	bean.setAdultprice(adultprice);
        	bean.setChildrenprice(childrenprice);
        	
        }
        
		return query2;
	}
	
	
	public Totalbus2 findByBusnumber(Integer busnumber) {
		return tbResp.findByBusnumber(busnumber);
	}
	
	public Totalbus2 updateRemainSeat(Integer busnumber, int newremainseat) {
		return tbResp.updateRemainSeat(busnumber, newremainseat);
	}

}

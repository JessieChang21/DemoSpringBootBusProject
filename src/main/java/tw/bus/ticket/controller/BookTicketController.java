package tw.bus.ticket.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.bus.members.model.Members;
import tw.bus.members.model.MembersService;
import tw.bus.query.model.Routeprice2;
import tw.bus.query.model.Routeprice2Service;
import tw.bus.query.model.Seat2;
import tw.bus.query.model.Seat2Service;
import tw.bus.query.model.Totalbus2;
import tw.bus.query.model.Totalbus2Service;
import tw.bus.ticket.model.Memberorder2Service;
import tw.bus.ticket.model.ByTripname;
import tw.bus.ticket.model.Memberorder2;

@Controller
public class BookTicketController {
	ObjectMapper mapper = new ObjectMapper();
	private Integer countOrderid = 100000;

	private Memberorder2Service moService;
	private Totalbus2Service totalService;
	private Routeprice2Service priceService;
	private Seat2Service seatService;
	private MembersService mService;

	@Autowired
	public BookTicketController(Memberorder2Service moService, Totalbus2Service totalService,
			Routeprice2Service priceService, Seat2Service seatService, MembersService mService) {
		this.moService = moService;
		this.totalService = totalService;
		this.priceService = priceService;
		this.seatService = seatService;
		this.mService = mService;
	}

	// 2.1 訂購車票
//	@PostMapping(path = "/members/bookTicket.controller")
	@PostMapping(path = "/bookTicket.controller")
	public String processBookAction(@RequestParam("bookBus") String busnumber,
			@RequestParam("inputdata") String inputdata, Model m
			) throws JsonMappingException, JsonProcessingException {
		
//		String username = SecurityContextHolder.getContext().getAuthentication().getName();
//		Members members = mService.findByEmail(username);
		
		ByTripname userinput = mapper.readValue(inputdata, ByTripname.class);
//		busnumber = 1135
//		inputdata = {"tripname":"北投竹子湖線","traveldate":"2021/12/06","weekday":"Monday","initialtime":"10:23:23","adult":"2","children":"0"}
//		userinput = ByTripname [tripname=北投竹子湖線, traveldate=2021/12/06, weekday=Monday, initialtime=10:23:23, adult=2, children=0]

		Totalbus2 totalBus = totalService.findByBusnumber(Integer.parseInt(busnumber));

		if (totalBus != null) {
			List<Memberorder2> memberorder = new ArrayList<Memberorder2>();
			// 總票數
			int adult = userinput.getAdult();
			int children = userinput.getChildren();
			int qty = adult + children; 
			
			// remainSeat
			int remainseat = totalBus.getRemainseats();
			int newremainseat = remainseat - qty;

			// 查路線價格
			Routeprice2 price = priceService.findByRouteid(totalBus.getRouteid());
			int adultprice = price.getPrice();
			int childrenprice = (int) (adultprice * 0.5);
			// 查路線座位
			List<Seat2> availableseat = seatService.findByBusnumber(Integer.parseInt(busnumber));
			List<Integer> seat = new ArrayList<Integer>();
			List<Integer> seatid = new ArrayList<Integer>();

			int countseat = 1;
			for (Seat2 bean : availableseat) {
				if (countseat <= qty) {
					seat.add(bean.getSeat());
					seatid.add(bean.getSeatid());
				}
				countseat++;
			}
			System.out.println(seat); // [1, 2, 3, 4, 5]
			System.out.println(seatid); // [5560, 5561, 5562, 5563, 5564]

			for (Integer i = 1; i <= qty; i++) {  // seat.size = qty
				if (i <= adult) {
					Memberorder2 member = new Memberorder2();
					// 呼叫此方法一次，訂單編號都一樣
					member.setOrderid(countOrderid);
					// 取得使用者登入email
//					member.setEmail(userName);
					member.setBusnumber(totalBus.getBusnumber());
					member.setInitialstation(totalBus.getInitialstation());
					member.setFinalstation(totalBus.getFinalstation());
					member.setTraveldate(userinput.getTraveldate());
					member.setInitialtime(totalBus.getInitialtime());
					member.setTraveltime(totalBus.getTraveltime());
					member.setTickettype("全票");
					member.setPrice(adultprice);
					member.setSeat(seat.get(i-1)); // 座位的第幾個
					member.setOrderqty(1);
					member.setOrderdate(new Date());
					memberorder.add(member);
				}else {											// 小孩
					Memberorder2 member = new Memberorder2();
					// 呼叫此方法一次，訂單編號都一樣
					member.setOrderid(countOrderid);
					// 取得使用者登入email
//					member.setEmail(userName);
					member.setBusnumber(totalBus.getBusnumber());
					member.setInitialstation(totalBus.getInitialstation());
					member.setFinalstation(totalBus.getFinalstation());
					member.setTraveldate(userinput.getTraveldate());
					member.setInitialtime(totalBus.getInitialtime());
					member.setTraveltime(totalBus.getTraveltime());
					member.setTickettype("半票");
					member.setPrice(childrenprice);
					member.setSeat(seat.get(i-1)); // 座位的第幾個
					member.setOrderqty(1);
					member.setOrderdate(new Date());
					memberorder.add(member);
				}
				
			}
			System.out.println(memberorder);
			
			moService.insert(memberorder);
// 			若新增成功: 1.totalBus remainSeat更新 2. seat相關位置刪除 3.countOrderid+1
			totalService.updateRemainSeat(Integer.parseInt(busnumber), newremainseat);
			for(Integer i : seatid) {
				seatService.deleteSeatAfterOrder(i);
			}
			
			countOrderid++; //若新增成功，countOrderid+1
//
			
			m.addAttribute(memberorder);
			
			
//			SimpleDateFormat myFmt = new SimpleDateFormat("HH:mm:ss");
//			memberorder.setFormatinitaltime(myFmt.format(totalBus.getInitialtime()));
//			m.addAttribute("insertMemberOrder", memberorder);
//			return "/queryAndBookTicket/bookTicketSuccess";
//		} else {
//			System.out.println("totalBus=null");
//			return "/queryAndBookTicket/queryRoute";
//		}

		}
		return "/queryAndBookTicket/bookTicketSuccess"; // 回傳頁面前要登入會員
	}

	

	// 3.
//	@PostMapping(path="/bookTicketByTripName.controller")
//	public String processbookTicketByTripName(@RequestParam("tripname") String tripname ,Model m) {
//		System.out.println("controller tripname :"+ tripname);
//		return "/queryAndBookTicket/queryRouteByMap2"; // 地圖查詢第二步
//	}

}

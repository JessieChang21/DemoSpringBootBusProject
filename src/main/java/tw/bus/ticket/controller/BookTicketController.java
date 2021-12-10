package tw.bus.ticket.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.bus.members.model.EmailSenderService;
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
@RequestMapping("/members")
public class BookTicketController {
	ObjectMapper mapper = new ObjectMapper();
	public static Integer countOrderid = 100000;  // server重新啟動後又會從頭開始算

	private Memberorder2Service moService;
	private Totalbus2Service totalService;
	private Routeprice2Service priceService;
	private Seat2Service seatService;
	private EmailSenderService senderService;

	@Autowired
	public BookTicketController(Memberorder2Service moService, Totalbus2Service totalService,
			Routeprice2Service priceService, Seat2Service seatService, EmailSenderService senderService) {
		this.moService = moService;
		this.totalService = totalService;
		this.priceService = priceService;
		this.seatService = seatService;
		this.senderService = senderService;
	}


	// 2.1 訂購車票
	@PostMapping(path = "/bookTicket.controller")
	public String processBookAction(@RequestParam("bookBus") String busnumber,
			@RequestParam("inputdata") String inputdata, Model m, Principal p)
			throws JsonMappingException, JsonProcessingException, MessagingException {

		String useremail = p.getName();

		ByTripname userinput = mapper.readValue(inputdata, ByTripname.class);
		System.out.println(userinput);
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

			for (Integer i = 1; i <= qty; i++) { // seat.size = qty
				if (i <= adult) {
					Memberorder2 member = new Memberorder2();
					member.setOrderid(countOrderid);
					member.setEmail(useremail);
					member.setBusnumber(totalBus.getBusnumber());
					member.setTripname(totalBus.getTripname());
					member.setInitialstation(totalBus.getInitialstation());
					member.setFinalstation(totalBus.getFinalstation());
					member.setTraveldate(userinput.getTraveldate());
					member.setInitialtime(totalBus.getInitialtime());
					member.setTraveltime(totalBus.getTraveltime());
					member.setTickettype("全票");
					member.setPrice(adultprice);
					member.setSeat(seat.get(i - 1)); // 座位的第幾個
					member.setOrderqty(1);
					member.setOrderdate(new Date());
					memberorder.add(member);
				} else { // 小孩
					Memberorder2 member = new Memberorder2();
					member.setOrderid(countOrderid);
					member.setEmail(useremail);
					member.setBusnumber(totalBus.getBusnumber());
					member.setTripname(totalBus.getTripname());
					member.setInitialstation(totalBus.getInitialstation());
					member.setFinalstation(totalBus.getFinalstation());
					member.setTraveldate(userinput.getTraveldate());
					member.setInitialtime(totalBus.getInitialtime());
					member.setTraveltime(totalBus.getTraveltime());
					member.setTickettype("半票");
					member.setPrice(childrenprice);
					member.setSeat(seat.get(i - 1)); // 座位的第幾個
					member.setOrderqty(1);
					member.setOrderdate(new Date());
					memberorder.add(member);
				}

			}

			// 計算總金額
			int totalPrice = 0;
			for (Memberorder2 mbean : memberorder) {
				moService.insert(mbean);
				totalPrice += mbean.getPrice();
			}

// 			若新增成功: 1.totalBus remainSeat更新 2. seat相關位置刪除 3.countOrderid+1 4.寄email
			
			totalService.updateRemainSeat(Integer.parseInt(busnumber), newremainseat);
			
			for(Integer i : seatid) {
				seatService.deleteSeatAfterOrder(i);
			}
			
			
			
			// Send Email
			String text;
			if (seat.size() == 1) {
				text = "<html><head><style>"
						+ " table{border-collapse: collapse; text-align: center;}"
						+ " th,td{border: 1px solid gray; width: 90px;}th{background-color: darkslategray;"
						+ "opacity: 80%; color:white}</style></head>"
						+ "<body><h4>您的訂票資訊如下 : <h4>" +
						"<table style=\"border-collapse: collapse; text-align: center\"> "+
							"<tr>" + 
								"<th>訂票編號</th>" + 
								"<th>車次編號</th>" + 
								"<th>路線名稱</th>" + 
								"<th>起站</th>" +
								"<th>迄站</th>" + 
								"<th>乘車日期</th>" + 
								"<th>發車時間</th>" + 
								"<th>旅程時間</th>" + 
								"<th>座位編號</th>" + 
								"<th>總金額</th>" + 
							"</tr>" +

							"<tr>" + 
								"<td>" + countOrderid + "</td>" + 
								"<td>" + totalBus.getBusnumber() + "</td>" + 
								"<td>" + totalBus.getTripname() + "</td>" + 
								"<td>" + totalBus.getInitialstation() + "</td>" + 
								"<td>" + totalBus.getFinalstation() + "</td>" +
								"<td>" + userinput.getTraveldate() + "</td>" + 
								"<td>" + totalBus.getInitialtime() + "</td>" +
								"<td>" + totalBus.getTraveltime() + "</td>" + 
								"<td>" + seat.get(0) + " 號</td>" + 
								"<td> NT$" + totalPrice + "</td>" + 
							"</tr>" + 
						"</table></body></html>";
			} else {
				text = "<html><head><style>"
						+ " table{border-collapse: collapse; text-align: center;}"
						+ " th,td{border: 1px solid gray; width: 90px;} th{background-color: darkslategray;"
						+ "opacity: 80%; color:white}</style></head>"
						+ "<body><h4>您的訂票資訊如下 : <h4>" +
						"<table style=\"border-collapse: collapse; text-align: center\"> "+
							"<tr>" + 
								"<th>訂票編號</th>" + 
								"<th>車次編號</th>" + 
								"<th>路線名稱</th>" + 
								"<th>起站</th>" +
								"<th>迄站</th>" + 
								"<th>乘車日期</th>" + 
								"<th>發車時間</th>" + 
								"<th>旅程時間</th>" + 
								"<th>座位編號</th>" + 
								"<th>總金額</th>" + 
							"</tr>" +

							"<tr>" + 
								"<td>" + countOrderid + "</td>" + 
								"<td>" + totalBus.getBusnumber() + "</td>" + 
								"<td>" + totalBus.getTripname() + "</td>" + 
								"<td>" + totalBus.getInitialstation() + "</td>" + 
								"<td>" + totalBus.getFinalstation() + "</td>" +
								"<td>" + userinput.getTraveldate() + "</td>" + 
								"<td>" + totalBus.getInitialtime() + "</td>" +
								"<td>" + totalBus.getTraveltime() + "</td>" + 
								"<td>" + seat.get(0) + "號 ~ " + seat.get(seat.size() - 1) + " 號</td>" + 
								"<td> NT$" + totalPrice + "</td>" + 
							"</tr>" + 
						"</table></body></html>";
			}

			
			senderService.sendMineEmail(useremail, "無事坐BUS 訂票成功", text);
			countOrderid++; //新增成功，且寄完email後
//			m.addAttribute("qty",qty);
//			m.addAttribute("userinput",userinput);
			m.addAttribute("memberorder",memberorder);
			m.addAttribute("totalPrice",totalPrice);

			return "/queryAndBookTicket/bookTicketSuccess";
		} else {
			System.out.println("totalBus=null");
			return "/queryAndBookTicket/queryRouteByKeyword"; // 導回首頁
		}
	}

	// 3.
//	@PostMapping(path="/bookTicketByTripName.controller")
//	public String processbookTicketByTripName(@RequestParam("tripname") String tripname ,Model m) {
//		System.out.println("controller tripname :"+ tripname);
//		return "/queryAndBookTicket/queryRouteByMap2"; // 地圖查詢第二步
//	}

}

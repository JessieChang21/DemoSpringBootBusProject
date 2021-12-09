package tw.bus.ticket.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.bus.members.model.EmailSenderService;
import tw.bus.query.model.Routeprice2Service;
import tw.bus.query.model.Seat2Service;
import tw.bus.query.model.Totalbus2;
import tw.bus.query.model.Totalbus2Service;
import tw.bus.ticket.model.Memberorder2;
import tw.bus.ticket.model.Memberorder2Service;

@Controller
@RequestMapping("/members")
public class QueryandDeleteTicketController {

	private Memberorder2Service moService;
	private Totalbus2Service totalService;
	private Routeprice2Service priceService;
	private Seat2Service seatService;
	private EmailSenderService senderService;

	@Autowired
	public QueryandDeleteTicketController(Memberorder2Service moService, Totalbus2Service totalService,
			Routeprice2Service priceService, Seat2Service seatService, EmailSenderService senderService) {
		this.moService = moService;
		this.totalService = totalService;
		this.priceService = priceService;
		this.seatService = seatService;
		this.senderService = senderService;
	}

	@GetMapping(path = "/queryMemberOrder")
	public String processMemberOrderMain() {
		return "/queryAndBookTicket/queryMemberOrder"; 
	}

	@GetMapping("/queryMemberOrderByEmail")
	@ResponseBody
	public List<Memberorder2> processMemberOrderAllAction(Principal p) {
		String useremail = p.getName();
		List<Memberorder2> userOrder = moService.findByEmail(useremail);

		for ( int i = 0 ; i < userOrder.size()-1 ; i++) {
			for ( int j = userOrder.size()-1 ; j > i ; j-- ) {
				if (userOrder.get(j).getOrderid().equals(userOrder.get(i).getOrderid())) {
					userOrder.remove(j); 
				} 
			} 
		} 
		return userOrder;
	}
		
	
	@GetMapping("/queryMemberOrderByOrderId/{orderid}")
	@ResponseBody
	public List<Memberorder2> processMemberOrderAction(@PathVariable("orderid") int orderid) {
		List<Memberorder2> userOrder = moService.findByOrderid(orderid);
		
		SimpleDateFormat myFmt =new SimpleDateFormat("HH:mm:ss");
		for(Memberorder2 bean : userOrder) {
			bean.setFormatinitaltime(myFmt.format(bean.getInitialtime()));
		}
		return userOrder;
	}
	
	@GetMapping("/deleteMemberOrderByOrderId/{orderid}")
	@ResponseBody
	public void processDeleteMemberOrderAction(@PathVariable("orderid") int orderid, Principal p) throws MessagingException {
		List<Memberorder2> userOrder = moService.findByOrderid(orderid);
		
		List<Integer> seat = new ArrayList<Integer>();
		int totalPrice = 0;
		Integer busnumber = 0;
		for(Memberorder2 bean : userOrder) {
			totalPrice += bean.getPrice();
			busnumber = bean.getBusnumber();
			seat.add(bean.getSeat());
		}
		
		Totalbus2 totalBus = totalService.findByBusnumber(busnumber);
		int newremainseat = totalBus.getRemainseats() + seat.size();
		System.out.println("totalPrice = " +totalPrice);
		System.out.println("seat = " + seat); 
		System.out.println("busnumber = " + busnumber); 
		System.out.println("newremainseat = " + newremainseat); 
		
		moService.deleteByOrderid(orderid);
		
		//totalBus修改
		totalService.updateRemainSeat(busnumber, newremainseat);
		//seat增加座位
		for(Integer s : seat) {
			seatService.insertSeatAfterDeleteOrder(busnumber, s);
		}
		//email
		String useremail = p.getName();
		String text = "您好，<br> 您的訂單編號 '"+orderid+"' 刪除成功!<br> 預計退款金額: NT$"+totalPrice+"元整。";
		senderService.sendMineEmail(useremail, "無事坐BUS 訂單刪除成功", text);
	}
	
}

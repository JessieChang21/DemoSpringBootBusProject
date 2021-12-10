package tw.bus.ticketback.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.bus.schedule.model.BusTimeService;
import tw.bus.schedule.model.BusTimes;
import tw.bus.schedule.model.SeatService;
import tw.bus.schedule.model.Seats;
import tw.bus.ticketback.model.Memberorder;
import tw.bus.ticketback.model.MemberorderService;
import tw.bus.ticketback.model.PageAssistMo;
import tw.bus.ticketback.model.emailSenderService;


@Controller
public class MemberorderController {
	
	private MemberorderService moService;
	// 後臺增加service
	private emailSenderService mailServ;
	private SeatService seatServ;
	private BusTimeService busServ;
	
	
	@Autowired
	public MemberorderController(MemberorderService moService, emailSenderService mailServ, SeatService seatServ, BusTimeService busServ) {
		this.moService = moService;
		this.mailServ = mailServ;
		this.seatServ = seatServ;
		this.busServ = busServ;
	}
	

	
	
	// 後臺相關
	
	@GetMapping("/memberOrderBackmain.controller")
	public String processRouteMainAction() {
		return "memberOrder/showAllMemberOrder";
	}
	

	@PostMapping("/MemberorderAllShow/{pageNo}")
	@ResponseBody
	public PageAssistMo processMemberorderAllShow(@PathVariable("pageNo") int pageNo){
		int pageSize = 20;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Memberorder> page = moService.findMoAll(pageable);
		
		PageAssistMo pagesEleMo = new PageAssistMo();
		pagesEleMo.setList(page.getContent());
		pagesEleMo.setTolpages(page.getTotalPages());
		pagesEleMo.setPageEles(page.getTotalElements());
		
		return pagesEleMo;
	}
	

	@PostMapping("/MemberorderAllShow/{busNumber}/{pageNo}")
	@ResponseBody
	public PageAssistMo processMemberorderAll(@PathVariable("busNumber") int busNumber, @PathVariable("pageNo") int pageNo){
		int pageSize = 20;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Memberorder> page = moService.findMoByBusNumber(busNumber, pageable);
		
		PageAssistMo pagesEleMo = new PageAssistMo();
		pagesEleMo.setList(page.getContent());
		pagesEleMo.setTolpages(page.getTotalPages());
		pagesEleMo.setPageEles(page.getTotalElements());
		
		return pagesEleMo;
	}
	

	@PostMapping("/MemberorderShowEmail/{email}/{pageNo}")
	@ResponseBody
	public PageAssistMo processMemberorderByEmail(@PathVariable("email") String email, @PathVariable("pageNo") int pageNo){
		System.out.println(email);
		int pageSize = 20;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<Memberorder> page = moService.findMoByEmail(email, pageable);
		
		PageAssistMo pagesEleMo = new PageAssistMo();
		pagesEleMo.setList(page.getContent());
		pagesEleMo.setTolpages(page.getTotalPages());
		pagesEleMo.setPageEles(page.getTotalElements());
		
		return pagesEleMo;
	}
	

	@PostMapping("/findbyOrderid.controller/{orderid}")
	@ResponseBody
	public List<Memberorder> processBusTimeShowDetailAction(@PathVariable("orderid") Integer orderid, Model m) {
		System.out.println(orderid);
		List<Memberorder> orders = moService.findByOrderidBack(orderid);
		m.addAttribute("orders", orders);
		return orders;
	} 
	
	
	@GetMapping(path = "/deleteTicketBack")
	public String deleteTicket(@RequestParam("deleteTicket") Integer orderid ,Model m) {
		System.out.println(orderid);
		List<Memberorder> n = moService.deleteByOrderidBack(orderid);
//		Memberorder n = moService.findByOrderid(orderid);
		System.out.println("找到了準備寄信");
		
		// 把Seat加回去
		for(int i=0; i<n.size(); i++) {
		Seats s = new Seats();
		s.setBusNumber(n.get(i).getBusnumber());
		s.setSeats(n.get(i).getSeat());
		seatServ.insertSeats(s);
		}
		
		
		BusTimes bus = busServ.findBusById(n.get(0).getBusnumber());
		bus.setRemainSeats(bus.getRemainSeats()+n.size());
		busServ.updateBusTime(bus);
		
		m.addAttribute("n", n);
		mailServ.sendEmail(
				n.get(0).getEmail(), 
				"無事坐BUS:已退票通知", 
				"您好，關於您訂購的車票，"+"\n"+
				"訂單編號:"+n.get(0).getOrderid()+"\n"+
				"車次編號:"+n.get(0).getBusnumber()+"\n"+
				"起始站:"+n.get(0).getInitialstation()+"\n"+
				"終點站:"+n.get(0).getFinalstation()+"\n"+
				"出發日期:"+n.get(0).getTraveldate()+"\n"+
				"出發時間:"+n.get(0).getInitialtime()+"\n"+
//				"票種:"+n.get(0).getTickettype()+"\n"+
//				"票價:"+n.get(0).getPrice()+"\n"+
//				"座位:"+n.get(0).getSeat()+"\n"+
				"數量:"+n.size()+"\n"+
				"\n"+ "由於發生突發狀況，目前已替您進行退票，若有疑慮，請洽客服人員進行查詢，謝謝您。"+
				"\n"+"無事坐BUS 祝您有個美好的一天"
				);
		return "/memberOrder/deleteTicketBackSuccess";
	}
	
}

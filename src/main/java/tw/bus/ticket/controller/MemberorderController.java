package tw.bus.ticket.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.bus.query.model.Totalbus;
import tw.bus.query.model.TotalbusService;
import tw.bus.ticket.model.Memberorder;
import tw.bus.ticket.model.MemberorderService;


@Controller
public class MemberorderController {
	
	private MemberorderService moService;
	private TotalbusService totalService;
	
	@Autowired
	public MemberorderController(MemberorderService moService, TotalbusService totalService) {
		this.moService = moService;
		this.totalService = totalService;
	}
	
	@GetMapping(path = "queryMemberOrdermain.controller")
	public String processMainPageAction() {
		return "/queryAndBookTicket/queryMemberOrder";
	}
	
	@PostMapping(path = "/queryMemberOrder")
	public String queryMemberOrder(@RequestParam("orderid") String orderid, Model m) {
		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		if (orderid ==null || orderid.length()==0 || !orderid.matches("[0-9]{6}")) {  //輸入文字會錯
			errors.put("orderid", "訂單編號輸入錯誤");
		}
		
		if (errors != null && !errors.isEmpty()) {
			return "/queryAndBookTicket/queryMemberOrder";
		}
		
		Integer orderid2 = Integer.valueOf(orderid);
		
		Memberorder order = moService.findByOrderid(orderid2);
		if(order != null) {
			
			SimpleDateFormat myFmt =new SimpleDateFormat("HH:mm:ss");
			order.setFormatinitaltime(myFmt.format(order.getInitialtime()));
			m.addAttribute("order",order);
			
			return "/queryAndBookTicket/queryMemberOrderSuccess";
		}else {
			errors.put("msg", "無此訂單編號");
			return "/queryAndBookTicket/queryMemberOrder";
		}		
	}

	@PostMapping(path = "/bookTicket")
	public String bookTicket(@RequestParam("bookBus") String busnumber ,Model m) {
		
		Totalbus totalBus = totalService.findById(busnumber);
		
		if (totalBus!=null) {			
			Memberorder memberorder = new Memberorder();
			
			memberorder.setBusnumber(totalBus.getBusnumber());
			memberorder.setInitialstation(totalBus.getInitialstation());
			memberorder.setFinalstation(totalBus.getFinalstation());
			memberorder.setInitialtime(totalBus.getInitialtime());
			memberorder.setTraveltime(totalBus.getTraveltime());
			
			moService.insert(memberorder);
				
			SimpleDateFormat myFmt =new SimpleDateFormat("HH:mm:ss");
			memberorder.setFormatinitaltime(myFmt.format(totalBus.getInitialtime()));
			m.addAttribute("insertMemberOrder",memberorder);
			return "/queryAndBookTicket/bookTicketSuccess";
		}else {
			System.out.println("totalBus=null");
			return "/queryAndBookTicket/queryRoute";
		}
		
	}
	
	@PostMapping(path = "/deleteTicket")
	public String deleteTicket(@RequestParam("deleteTicket") Integer orderid ,Model m) {
		
		moService.deleteById(orderid);
		
		return "/queryAndBookTicket/deleteTicketSuccess";
	}
	
}

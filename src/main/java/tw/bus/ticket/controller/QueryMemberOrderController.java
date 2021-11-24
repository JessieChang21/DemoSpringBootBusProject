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

import tw.bus.ticket.model.Memberorder;
import tw.bus.ticket.model.MemberorderService;




@Controller
public class QueryMemberOrderController {
	@Autowired
	private MemberorderService moService;
	
	@GetMapping(path = "queryMemberOrdermain.controller")
	public String processMainPageAction() {
		return "/queryAndBookTicket/queryMemberOrder";
	}
	
	@PostMapping(path = "queryMemberOrder.controller")
	public String processAction(@RequestParam("orderid") String orderid, Model m) {
		
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

}

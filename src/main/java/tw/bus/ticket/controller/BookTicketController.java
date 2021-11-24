package tw.bus.ticket.controller;

import java.text.SimpleDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.bus.query.model.Totalbus;
import tw.bus.query.model.TotalbusService;
import tw.bus.ticket.model.Memberorder;
import tw.bus.ticket.model.MemberorderService;


@Controller
public class BookTicketController {
	
	private MemberorderService moService;
	private TotalbusService totalService;
	
	@Autowired
	public BookTicketController(MemberorderService moService, TotalbusService totalService) {
		this.moService = moService;
		this.totalService = totalService;
	}



	@PostMapping(path = "/bookTicket.controller")
	public String processAction(@RequestParam("bookBus") String busnumber ,Model m) {
		
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
}

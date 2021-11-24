package tw.bus.ticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.bus.ticket.model.MemberorderService;



@Controller
public class DeleteTicketController {
	
	private MemberorderService moService;
	
	@Autowired
	public DeleteTicketController(MemberorderService moService) {
		this.moService = moService;
	}


	@PostMapping(path = "/deleteTicket.controller")
	public String processAction(@RequestParam("deleteTicket") Integer orderid ,Model m) {
		
		moService.deleteById(orderid);
		
		return "/queryAndBookTicket/deleteTicketSuccess";
	}
}

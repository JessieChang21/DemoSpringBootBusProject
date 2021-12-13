package tw.bus.memberslike.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import tw.bus.members.model.Members;
import tw.bus.memberslike.model.FrameBean;
import tw.bus.memberslike.model.FrameBeanService;
import tw.bus.memberslike.model.FrameDayTotal;
import tw.bus.memberslike.model.FrameDayTotalService;
import tw.bus.memberslike.model.UpdateFrameBean;
import tw.bus.memberslike.model.UpdateFrameBeanService;


@Controller
public class LikeController {
	
	@Autowired
	private FrameBeanService framebeanService;
	
	@Autowired
	private UpdateFrameBeanService updateframebeanService;
	
	@Autowired
	private FrameDayTotalService framedaytotalService;
	
	
	@GetMapping("/framePage2")
	public String framePage2() {

		return "members/framepage2";
	}
	
	@GetMapping("/framePage")
	public String framePage(@SessionAttribute Members members, Model m) {

		if(framebeanService.existsById(members.getId())) {
			FrameBean framebean = framebeanService.findById(members.getId());
			m.addAttribute("framebean", framebean);
			return "members/framepage";
		}
		FrameBean framebean = new FrameBean();
		framebean.setUserid(members.getId());
		m.addAttribute("framebean", framebean);
		return "members/framepage";
	}
	
	@PostMapping("/updateframelike") 
	@ResponseBody
	public UpdateFrameBean processUpdateAction(@RequestBody FrameBean framebean) {
			System.out.println("framebean"+framebean.getUserid());
	      Date dNow = new Date( );
	      SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
	      System.out.println("当前时间为: " + ft.format(dNow));
	      System.out.println("framebean.getChange()="+framebean.getChange());
	      FrameDayTotal daytotal = framedaytotalService.findById(framebean.getChange());
	      daytotal.setFrameid(framebean.getChange());
	      System.out.println("daytotal="+daytotal);
//	      FrameDayTotal daytotal0 = new FrameDayTotal();
	      
		if(framebean.getLiked() == 1) {
//			FrameDayTotal daytotal2 = framedaytotalService.findById(framebean.getChange());
//			daytotal2.setDate(ft.format(dNow));
			daytotal.setLiketotal((daytotal.getLiketotal())+1);
			framedaytotalService.updateFrameDayTotal(daytotal);
		}
		if(framebean.getLiked() == 0) {
			if(daytotal.getDate().equals(ft.format(dNow))) {
				daytotal.setLiketotal((daytotal.getLiketotal())-1);
				framedaytotalService.updateFrameDayTotal(daytotal);
			}
		}
		UpdateFrameBean updateframebean = new UpdateFrameBean();
		
		updateframebean.setUserid(framebean.getUserid());
		updateframebean.setFrame1(framebean.getFrame1());
		updateframebean.setFrame2(framebean.getFrame2());
		updateframebean.setFrame3(framebean.getFrame3());
		updateframebean.setFrame4(framebean.getFrame4());
		updateframebean.setFrame5(framebean.getFrame5());
		updateframebean.setFrame6(framebean.getFrame6());
		updateframebean.setFrame7(framebean.getFrame7());
		updateframebean.setFrame8(framebean.getFrame8());
		updateframebean.setFrame9(framebean.getFrame9());
		updateframebean.setFrame10(framebean.getFrame10());
		updateframebean.setFrame11(framebean.getFrame11());
		updateframebean.setFrame12(framebean.getFrame12());
		
		return updateframebeanService.UpdateFrameBean(updateframebean);
	}
}

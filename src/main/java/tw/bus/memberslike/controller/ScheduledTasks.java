package tw.bus.memberslike.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import tw.bus.memberslike.model.FrameBean;
import tw.bus.memberslike.model.FrameBeanService;
import tw.bus.memberslike.model.FrameDayTotal;
import tw.bus.memberslike.model.FrameDayTotalService;
import tw.bus.memberslike.model.TotalFrameBean;
import tw.bus.memberslike.model.TotalFrameBeanService;

@Component
public class ScheduledTasks {
		
	 private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
	 
	 @Autowired
	 private FrameDayTotalService framedaytotalService;
	 
	 @Autowired
	 private TotalFrameBeanService totalframebeanService;
	 
 
// 	@Scheduled(fixedDelay = 60000) // fixedDelay = 60000 表示當前方法執行完畢 60000ms(1分鐘) 後，Spring scheduling會再次呼叫該方法
// 	public void testFixDelay() {
//	 	System.out.println("===fixedDelay: 時間:{}"+dateFormat.format(new Date()));
//	 	
//
// }
 
// @Scheduled(fixedRate = 60000) // fixedRate = 60000 表示當前方法開始執行 60000ms(1分鐘) 後，Spring scheduling會再次呼叫該方法
// 	public void testFixedRate() {
//  	System.out.println("===fixedRate: 時間:{}"+dateFormat.format(new Date()));
// }
// 
// @Scheduled(initialDelay = 180000, fixedRate = 5000) // initialDelay = 180000 表示延遲 180000 (3秒) 執行第一次任務, 然後每 5000ms(5 秒) 再次呼叫該方法
// 	public void testInitialDelay() {
//  	System.out.println("===initialDelay: 時間:{}"+dateFormat.format(new Date()));
// }
 
 	@Scheduled(cron = "0 0 10 * * *") // cron接受cron表示式，根據cron表示式確定定時規則
 	public void testCron() {
	 	System.out.println("===cron: 時間:{}"+dateFormat.format(new Date()));

 }
 	private void getAndPut() {
 		
 		TotalFrameBean totalframebean = new TotalFrameBean();
 		
 		List<FrameDayTotal> framedaytotal = framedaytotalService.findAll();
 		
 		totalframebean.setDate(framedaytotal.get(0).getDate());
 		totalframebean.setFrame1(framedaytotal.get(0).getLiketotal());
 		totalframebean.setFrame2(framedaytotal.get(1).getLiketotal());
 		totalframebean.setFrame3(framedaytotal.get(2).getLiketotal());
 		totalframebean.setFrame4(framedaytotal.get(3).getLiketotal());
 		totalframebean.setFrame5(framedaytotal.get(4).getLiketotal());
 		totalframebean.setFrame6(framedaytotal.get(5).getLiketotal());
 		totalframebean.setFrame7(framedaytotal.get(6).getLiketotal());
 		totalframebean.setFrame8(framedaytotal.get(7).getLiketotal());
 		totalframebean.setFrame9(framedaytotal.get(8).getLiketotal());
 		totalframebean.setFrame10(framedaytotal.get(9).getLiketotal());
 		totalframebean.setFrame11(framedaytotal.get(10).getLiketotal());
 		totalframebean.setFrame12(framedaytotal.get(11).getLiketotal());
 		
 		totalframebeanService.saveTotalFrame(totalframebean);
 	}
 
}
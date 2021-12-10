package tw.bus.schedule.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.bus.route.model.RouteInfo;
import tw.bus.route.model.RouteInfoService;
import tw.bus.schedule.model.BusTimeService;
import tw.bus.schedule.model.BusTimes;
import tw.bus.schedule.model.PageAssistTB;
import tw.bus.schedule.model.SeatService;
import tw.bus.schedule.model.Seats;
import tw.bus.schedule.model.TempBusTimeService;
import tw.bus.schedule.model.TempBusTimes;


@Controller
@RequestMapping("/busTimes")
//@SessionAttributes(names = {"totalBusPages", "totalBusElements"})
public class TempBusTimeController {
	
	TempBusTimeService tempBusTimeServ;
	
	RouteInfoService routeInfoServ;
	
	BusTimeService busTimeServ;
	
	SeatService seatServ;
	
	@Autowired
	public TempBusTimeController(TempBusTimeService tempBusTimeServ, 
			RouteInfoService routeInfoServ, BusTimeService busTimeServ, SeatService seatServ) {
		this.tempBusTimeServ = tempBusTimeServ;
		this.routeInfoServ = routeInfoServ;
		this.busTimeServ = busTimeServ;
		this.seatServ = seatServ;
	}
	
	@GetMapping("/tempbustimemain.controller")
	public String processTempBusMainAction(@RequestParam("tEx") Integer tEx, Model m) {
		m.addAttribute("tEx", tEx);
		return "busTimes/showAllTempBusTimes";
	}
	
	
	@PostMapping("/tempBustimeByPage/{pageNo}")
	@ResponseBody
	public PageAssistTB processBusTimeByPage(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 20;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<TempBusTimes> page = tempBusTimeServ.findAllTempBusTimesByPage(pageable);
		
		PageAssistTB pagesEleBus = new PageAssistTB();
		pagesEleBus.setList(page.getContent());
		pagesEleBus.setTolpages(page.getTotalPages());
		pagesEleBus.setPageEles(page.getTotalElements());
		
		
		return pagesEleBus;
	}
	
	// 用toExamine狀態碼來搜尋
	@PostMapping("/TempBusTimeByOneToExamine/{toExamine}/{pageNo}")
	@ResponseBody
	public PageAssistTB processTempBusTimeByOneToExamine(@PathVariable("pageNo") int pageNo, Model m, @PathVariable("toExamine") Integer toExamine){
		int pageSize = 20;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<TempBusTimes> page = tempBusTimeServ.findTempBusTimesByOneExa(toExamine, pageable);
		
		PageAssistTB pagesEleBus = new PageAssistTB();
		pagesEleBus.setList(page.getContent());
		pagesEleBus.setTolpages(page.getTotalPages());
		pagesEleBus.setPageEles(page.getTotalElements());
		
		return pagesEleBus;
	}
	
	@PostMapping("/TempBusTimeByTwoToExamine/{toExamine}/{pageNo}")
	@ResponseBody
	public PageAssistTB processTempBusTimeByTwoToExamine(@PathVariable("pageNo") int pageNo, Model m, @PathVariable("toExamine") String toExamine){
		int pageSize = 20;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		String[] exaNoS = toExamine.split("&"); 
		Integer exa1 = Integer.valueOf(exaNoS[0]);
		Integer exa2 = Integer.valueOf(exaNoS[1]);
		Page<TempBusTimes> page = tempBusTimeServ.findTempBusTimesByTwoExa(exa1, exa2, pageable);
		
		PageAssistTB pagesEleBus = new PageAssistTB();
		pagesEleBus.setList(page.getContent());
		pagesEleBus.setTolpages(page.getTotalPages());
		pagesEleBus.setPageEles(page.getTotalElements());
		
		return pagesEleBus;
	}
	
	@PostMapping("/TempBusTimeByThreeToExamine/{toExamine}/{pageNo}")
	@ResponseBody
	public PageAssistTB processTempBusTimeByThreeToExamine(@PathVariable("pageNo") int pageNo, Model m, @PathVariable("toExamine") String toExamine){
		int pageSize = 20;
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		String[] exaNoS = toExamine.split("&"); 
		Integer exa1 = Integer.valueOf(exaNoS[0]);
		Integer exa2 = Integer.valueOf(exaNoS[1]);
		Integer exa3 = Integer.valueOf(exaNoS[2]);
		Page<TempBusTimes> page = tempBusTimeServ.findTempBusTimesByThreeExa(exa1, exa2, exa3, pageable);
		
		PageAssistTB pagesEleBus = new PageAssistTB();
		pagesEleBus.setList(page.getContent());
		pagesEleBus.setTolpages(page.getTotalPages());
		pagesEleBus.setPageEles(page.getTotalElements());
		
		return pagesEleBus;
	}
	
	// 用Id搜尋
	public TempBusTimes processfindTempBusById(Integer testBusNumber) {
		return tempBusTimeServ.findTempBusById(testBusNumber);
	}
	
	public TempBusTimes processUpdateTempBus(TempBusTimes tempBusTimes) {
		return tempBusTimeServ.updateTempBusTimes(tempBusTimes);
	}
	
	
	// 申請新增班次
	@GetMapping("/tempBusInsert.controller")
    public String processInsertTempMainAction(@RequestParam("rid") String rid, Model m) {
		RouteInfo r1 = routeInfoServ.findFirstStationSequence(rid);
		RouteInfo r2 = routeInfoServ.findLastStationSequence(rid);
		
		TempBusTimes tempBus = new TempBusTimes();
		tempBus.setRouteId(rid);
		System.out.println(r1.getRouteId());
		
		tempBus.setTripName(r1.getTripName());
		System.out.println(r1.getTripName());
		
		tempBus.setArea(r1.getArea());
		
		m.addAttribute("rid", rid);
		m.addAttribute("tempBus", tempBus);
    	return "busTimes/insertForm";
    }
	
	@RequestMapping(value = "/addTempBus.controller", method = RequestMethod.POST, params = "toExamine")
	public String processInsertTempToExamineAction(@RequestParam("initialTime") String initialTime, @ModelAttribute("tempBus") TempBusTimes tempBus, BindingResult result, Model m) {

		RouteInfo r1 = routeInfoServ.findFirstStationSequence(tempBus.getRouteId());
		RouteInfo r2 = routeInfoServ.findLastStationSequence(tempBus.getRouteId());
		
		Map<String, String> errors = new HashMap<String, String>(); 
		m.addAttribute("errors", errors);
		
		System.out.println(initialTime);
		if(initialTime!="") {
			tempBus.setInitialTime(initialTime);
		} else {
			errors.put("initialTimeE", "請選擇發車時間");
		}
		
		if(tempBus.getTotalSeats()==null) {
			errors.put("totalSeatsE", "請選擇總座位數");
		}
		
		if(errors!=null && !errors.isEmpty()) {
			return "busTimes/insertForm";
		}
		
		tempBus.setInitialStation(r1.getStation());
		tempBus.setFinalStation(r2.getStation());
		int t = 7*(r2.getStationSequence()-1);
		tempBus.setTravelTime("約"+t/60+"小時"+ t%60 +"分");
		tempBus.setToExamine(1);
		
		if (tempBus.getSunday()==null) {
			tempBus.setSunday(0);
		}
		if (tempBus.getMonday()==null) {
			tempBus.setMonday(0);
		}
		if (tempBus.getTuesday()==null) {
			tempBus.setTuesday(0);
		}
		if (tempBus.getWednesday()==null) {
			tempBus.setWednesday(0);
		}
		if (tempBus.getThursday()==null) {
			tempBus.setThursday(0);
		}
		if (tempBus.getFriday()==null) {
			tempBus.setFriday(0);
		}
		if (tempBus.getSaturday()==null) {
			tempBus.setSaturday(0);
		}
		
		Date dNow = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		tempBus.setToExamineDate(ft.format(dNow));
		
		
		tempBusTimeServ.insertTempBusTimes(tempBus);
		m.addAttribute("tempBusRoute", tempBus.getRouteId()+tempBus.getTripName());
		m.addAttribute("tempBusTime", tempBus.getInitialTime());
		m.addAttribute("tempBus", tempBus);
		
		
		return "busTimes/tempBusResult";
	}
	
	
	
// 編輯暫存班次
	@GetMapping("/tempBusUpdate.controller")
    public String processUpdateTempAction(@RequestParam("tbNo") Integer tbNo, Model m) {
		TempBusTimes tb1 = tempBusTimeServ.findTempBusById(tbNo);
		
		m.addAttribute("tempBus", tb1);
    	return "busTimes/tempUpInsertForm";
    }
	
	// 刪除退回
	@GetMapping("/tempBusUpdateDelete.controller")
    public String processDeleteTempAction(@RequestParam("tbNo") Integer tbNo, Model m) {
		TempBusTimes tb1 = tempBusTimeServ.findTempBusById(tbNo);
		
		m.addAttribute("tempBus", tb1);
    	return "busTimes/tempUpDeleteForm";
    }
	
	//變更退回
	@GetMapping("/tempBusUpdateUpdate.controller")
    public String processUpdateChangeTempAction(@RequestParam("tbNo") Integer tbNo, Model m) {
		TempBusTimes tb1 = tempBusTimeServ.findTempBusById(tbNo);
		
		m.addAttribute("tempBus", tb1);
    	return "busTimes/tempUpUpdateForm";
    }
	
	// 撤回新增申請

	@RequestMapping(value = "/addTempBus.controller", method = RequestMethod.POST, params = "noWantNew")
	//@PostMapping("/addTempBus.controller")
	public String processInsertTempOnlyAction(@Validated @ModelAttribute("tempBus") TempBusTimes tempBusP, BindingResult result, Model m) {
		if(result.hasErrors()) {
			return "busTimes/insertError";
		}
		TempBusTimes tempBus = tempBusTimeServ.findTempBusById(tempBusP.getTestBusNumber());
		tempBus.setToExamine(0);
		
		Date dNow = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		tempBus.setToExamineDate(ft.format(dNow));
		/// empolyeeName 待改
		
		
		tempBusTimeServ.insertTempBusTimes(tempBus);
		m.addAttribute("tempBusRoute", tempBus.getRouteId()+tempBus.getTripName());
		m.addAttribute("tempBusTime", tempBus.getInitialTime());
		
		return "busTimes/showAllTempBusTimes";
	}
	

	// 審查後退回或新增Bus表單
	@GetMapping("/tempBusExamine.controller")
    public String processExamineTempAction(@RequestParam("tbNo") Integer tbNo, Model m) {
		TempBusTimes tb1 = tempBusTimeServ.findTempBusById(tbNo);
		
		m.addAttribute("tempBus", tb1);
    	return "busTimes/examineForm";
    }
	
	@RequestMapping(value = "/saveTempBus.controller", method = RequestMethod.POST, params = "pass")
	public String processInsertBusAction(@Validated @ModelAttribute("tempBus") TempBusTimes tempBusP, BindingResult result, Model m) {

		TempBusTimes tempBus = tempBusTimeServ.findTempBusById(tempBusP.getTestBusNumber());
		
		tempBus.setToExamine(3);
		tempBus.setExamineNote(tempBusP.getExamineNote());
		tempBus.setManagerName(tempBusP.getManagerName());
		
		Date dNow = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		tempBus.setPassDate(ft.format(dNow));
		/// empolyeeName 待改
		
		//  輸入bus表
		BusTimes bus = new BusTimes();
		bus.setRouteId(tempBus.getRouteId());
		bus.setTripName(tempBus.getTripName());
		bus.setArea(tempBus.getArea());
		bus.setInitialStation(tempBus.getInitialStation());
		bus.setFinalStation(tempBus.getFinalStation());
		bus.setInitialTime(tempBus.getInitialTime());
		bus.setTotalSeats(tempBus.getTotalSeats());
		bus.setRemainSeats(tempBus.getTotalSeats());
		bus.setNote(tempBus.getNote());
		bus.setTravelTime(tempBus.getTravelTime());
		bus.setSunday(tempBus.getSunday());
		bus.setMonday(tempBus.getMonday());
		bus.setTuesday(tempBus.getTuesday());
		bus.setWednesday(tempBus.getWednesday());
		bus.setThursday(tempBus.getThursday());
		bus.setFriday(tempBus.getFriday());
		bus.setSaturday(tempBus.getSaturday());
		
		busTimeServ.insertBusTime(bus);
		
		// 輸入座位
		
		Integer busnumber = busTimeServ.findNewOne(bus.getRouteId()).getBusNumber();
		System.out.println(busnumber);
		for (int i=1; i<=tempBus.getTotalSeats() ;i++) {
			Seats s = new Seats();
			s.setBusNumber(busnumber);
			s.setSeats(i);
			seatServ.insertSeats(s);
		}
		
		
		System.out.println("開始改暫時表紀錄");
		tempBus.setBusNumberPo(busnumber);
		tempBusTimeServ.insertTempBusTimes(tempBus);
		m.addAttribute("tempBusRoute", tempBus.getRouteId()+tempBus.getTripName());
		m.addAttribute("tempBusTime", tempBus.getInitialTime());
		
		// 輸入Bus
		
		
		return "busTimes/InsertBusResult";
	}
	
	// 退回申請
	@RequestMapping(value = "/saveTempBus.controller", method = RequestMethod.POST, params = "nopass")
	public String processNoInsertBusAction(@Validated @ModelAttribute("tempBus") TempBusTimes tempBusP, BindingResult result, Model m) {
		
		TempBusTimes tempBus = tempBusTimeServ.findTempBusById(tempBusP.getTestBusNumber());
		
		tempBus.setToExamine(2);
		tempBus.setExamineNote(tempBusP.getExamineNote());
		tempBus.setManagerName(tempBusP.getManagerName());
		
		Date dNow = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		tempBus.setPassDate(ft.format(dNow));
		/// empolyeeName 待改
		
		tempBusTimeServ.insertTempBusTimes(tempBus);
		m.addAttribute("tempBusRoute", tempBus.getRouteId()+tempBus.getTripName());
		m.addAttribute("tempBusTime", tempBus.getInitialTime());
		
		return "busTimes/InsertBusResult";
	}
	
	// 申請刪除或變更班次
	// 進入表單
	
	@GetMapping("/Bustodeletetemp.controller/{busNumber}/{ename}")
    public String processDeleteBusExaMainAction(@PathVariable("busNumber") Integer busNumber, @PathVariable("ename") String empolyeeName, Model m) {
//		Optional<TempBusTimes> op1 = tempBusTimeServ.findTempBusByBusNumber(busNumber);
		
//		if(op1.isEmpty()) {
			System.out.println("尚未有申請紀錄");
			BusTimes bus = busTimeServ.findBusById(busNumber);
			TempBusTimes temp = new TempBusTimes();
			temp.setBusNumberPo(busNumber);
			
			temp.setRouteId(bus.getRouteId());
			temp.setTripName(bus.getTripName());
			temp.setArea(bus.getArea());
			temp.setInitialStation(bus.getInitialStation());
			temp.setFinalStation(bus.getFinalStation());
			temp.setInitialTime(bus.getInitialTime());
			temp.setTotalSeats(bus.getTotalSeats());
			temp.setNote(bus.getNote());
			temp.setTravelTime(bus.getTravelTime());
			temp.setSunday(bus.getSunday());
			temp.setMonday(bus.getMonday());
			temp.setTuesday(bus.getTuesday());
			temp.setWednesday(bus.getWednesday());
			temp.setThursday(bus.getThursday());
			temp.setFriday(bus.getFriday());
			temp.setSaturday(bus.getSaturday());
			
			temp.setEmpolyeeName(empolyeeName);
		    
		    System.out.println("新增申請表");
//		    TempBusTimes tempin = tempBusTimeServ.insertTempBusTimes(temp);
			System.out.println(temp.getTestBusNumber());
		    
		    m.addAttribute("tempBus", temp);
	    	return "busTimes/changeExaForm";
		
//		} else {
//			
//			System.out.println("已有申請紀錄，調閱");
//			TempBusTimes tempin = op1.get();
//			System.out.println(tempin.getTestBusNumber());
//		    
//			m.addAttribute("tempBus", tempin);
//	    	return "busTimes/changeExaForm";
//			
//		}
    }
	
	// 儲存要刪除的
	@RequestMapping(value = "/toChangeBus.controller", method = RequestMethod.POST, params = "delete")
	public String processToDeleteBusAction(@Validated @ModelAttribute("tempBus") TempBusTimes tempBus, BindingResult result, Model m) {
	
		tempBus.setToExamine(4);
//		tempBus.setTestBusNumber(tempBusP.getTestBusNumber());
//		tempBus.setToExamineNote(tempBusP.getToExamineNote());
//		tempBus.setInitialTime(tempBusP.getInitialTime());
//		tempBus.setNote(tempBusP.getNote());
//		tempBus.setSunday(tempBusP.getSunday());
//		tempBus.setMonday(tempBusP.getMonday());
//		tempBus.setTuesday(tempBusP.getTuesday());
//		tempBus.setWednesday(tempBusP.getWednesday());
//		tempBus.setThursday(tempBusP.getThursday());
//		tempBus.setFriday(tempBusP.getFriday());
//		tempBus.setSaturday(tempBusP.getSaturday());

		if (tempBus.getSunday()==null) {
			tempBus.setSunday(0);
		}
		if (tempBus.getMonday()==null) {
			tempBus.setMonday(0);
		}
		if (tempBus.getTuesday()==null) {
			tempBus.setTuesday(0);
		}
		if (tempBus.getWednesday()==null) {
			tempBus.setWednesday(0);
		}
		if (tempBus.getThursday()==null) {
			tempBus.setThursday(0);
		}
		if (tempBus.getFriday()==null) {
			tempBus.setFriday(0);
		}
		if (tempBus.getSaturday()==null) {
			tempBus.setSaturday(0);
		}

		Date dNow = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
	    tempBus.setToExamineDate(ft.format(dNow));
	    
	  //申請中先將剩餘座位設為0，無法訂票
	    Integer busNumber = tempBus.getBusNumberPo();
		System.out.println(busNumber);
		seatServ.deleteSeatByBusNumber(busNumber);
		
		BusTimes busInExa = busTimeServ.findBusById(busNumber);
		busInExa.setRemainSeats(0);
		busTimeServ.updateBusTime(busInExa);
	    
		tempBusTimeServ.updateTempBusTimes(tempBus);
		m.addAttribute("tempBusRoute", tempBus.getRouteId()+tempBus.getTripName());
		m.addAttribute("tempBusTime", tempBus.getInitialTime());
		
		return "busTimes/InsertBusResult";
	}
	
	//儲存要修改的
	@RequestMapping(value = "/toChangeBus.controller", method = RequestMethod.POST, params = "update")
	public String processToUpdateBusAction(@Validated @ModelAttribute("tempBus") TempBusTimes tempBus, BindingResult result, Model m) {
		
		tempBus.setToExamine(5);
//		tempBus.setTestBusNumber(tempBusP.getTestBusNumber());
//		tempBus.setToExamineNote(tempBusP.getToExamineNote());
//		tempBus.setInitialTime(tempBusP.getInitialTime());
//		tempBus.setNote(tempBusP.getNote());
//		tempBus.setSunday(tempBusP.getSunday());
//		tempBus.setMonday(tempBusP.getMonday());
//		tempBus.setTuesday(tempBusP.getTuesday());
//		tempBus.setWednesday(tempBusP.getWednesday());
//		tempBus.setThursday(tempBusP.getThursday());
//		tempBus.setFriday(tempBusP.getFriday());
//		tempBus.setSaturday(tempBusP.getSaturday());

		if (tempBus.getSunday()==null) {
			tempBus.setSunday(0);
		}
		if (tempBus.getMonday()==null) {
			tempBus.setMonday(0);
		}
		if (tempBus.getTuesday()==null) {
			tempBus.setTuesday(0);
		}
		if (tempBus.getWednesday()==null) {
			tempBus.setWednesday(0);
		}
		if (tempBus.getThursday()==null) {
			tempBus.setThursday(0);
		}
		if (tempBus.getFriday()==null) {
			tempBus.setFriday(0);
		}
		if (tempBus.getSaturday()==null) {
			tempBus.setSaturday(0);
		}

		Date dNow = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
	    tempBus.setToExamineDate(ft.format(dNow));
	    
	    //申請中先將剩餘座位設為0，無法訂票
	    Integer busNumber = tempBus.getBusNumberPo();
		System.out.println(busNumber);
		seatServ.deleteSeatByBusNumber(busNumber);
		
		BusTimes busInExa = busTimeServ.findBusById(busNumber);
		busInExa.setRemainSeats(0);
		busTimeServ.updateBusTime(busInExa);
		
		tempBusTimeServ.updateTempBusTimes(tempBus);
		m.addAttribute("tempBusRoute", tempBus.getRouteId()+tempBus.getTripName());
		m.addAttribute("tempBusTime", tempBus.getInitialTime());
		
		return "busTimes/InsertBusResult";
	}
	
	// 撤回變更刪除申請

		@RequestMapping(value = "/toChangeBus.controller", method = RequestMethod.POST, params = "noWant")
		//@PostMapping("/addTempBus.controller")
		public String processNoWantDeleteAction(@Validated @ModelAttribute("tempBus") TempBusTimes tempBusP, BindingResult result, Model m) {
			if(result.hasErrors()) {
				return "busTimes/insertError";
			}
			TempBusTimes tempBus = tempBusTimeServ.findTempBusById(tempBusP.getTestBusNumber());
			tempBus.setToExamine(0);
			
			Date dNow = new Date( );
		    SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
			tempBus.setToExamineDate(ft.format(dNow));
			
			BusTimes bus = busTimeServ.findBusById(tempBus.getBusNumberPo());
			
			for (int i=1; i<= bus.getTotalSeats() ;i++) {
				Seats s = new Seats();
				s.setBusNumber(bus.getBusNumber());
				s.setSeats(i);
				seatServ.insertSeats(s);
			}
			
			tempBusTimeServ.insertTempBusTimes(tempBus);
			m.addAttribute("tempBusRoute", tempBus.getRouteId()+tempBus.getTripName());
			m.addAttribute("tempBusTime", tempBus.getInitialTime());
			m.addAttribute("tempBus", tempBus);
			return "busTimes/tempBusResult";
		}
		
	
	
	// 審查後退回或刪除Bus表單
		@GetMapping("/tempBusExamineDelete.controller")
	    public String processExamineDeleteTempAction(@RequestParam("tbNo") Integer tbNo, Model m) {
			TempBusTimes tb1 = tempBusTimeServ.findTempBusById(tbNo);
			
			m.addAttribute("tempBus", tb1);
	    	return "busTimes/examineDeleteForm";
		}
		
	// 審查後退回或變更Bus表單
		@GetMapping("/tempBusExamineUpdate.controller")
	    public String processExamineUpdateTempAction(@RequestParam("tbNo") Integer tbNo, Model m) {
			TempBusTimes tb1 = tempBusTimeServ.findTempBusById(tbNo);
			
			m.addAttribute("tempBus", tb1);
	    	return "busTimes/examineUpdateForm";
		}
		
	// 審查刪除及變更
	
	@RequestMapping(value = "/deleteBus.controller", method = RequestMethod.POST, params = "depass")
	public String passDeleteBusAction(@Validated @ModelAttribute("tempBus") TempBusTimes tempBusP, BindingResult result, Model m) {
		System.out.println(tempBusP.getTestBusNumber());
		TempBusTimes tempBus = tempBusTimeServ.findTempBusById(tempBusP.getTestBusNumber());
		
		tempBus.setToExamine(43);
		tempBus.setExamineNote(tempBusP.getExamineNote());
		tempBus.setManagerName(tempBusP.getManagerName());
		
		Date dNow = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		tempBus.setPassDate(ft.format(dNow));
		/// empolyeeName 待改
		
		tempBusTimeServ.updateTempBusTimes(tempBus);
		m.addAttribute("tempBusRoute", tempBus.getRouteId()+tempBus.getTripName());
		m.addAttribute("tempBusTime", tempBus.getInitialTime());
		
		Integer busNumber = tempBus.getBusNumberPo();
		System.out.println(busNumber);
		seatServ.deleteSeatByBusNumber(busNumber);
		busTimeServ.deleteByBusNo(busNumber);
		
		return "busTimes/InsertBusResult";
	}
	
	@RequestMapping(value = "/deleteBus.controller", method = RequestMethod.POST, params = "denopass")
	public String processNodeleteBusAction(@Validated @ModelAttribute("tempBus") TempBusTimes tempBusP, BindingResult result, Model m) {
		
		TempBusTimes tempBus = tempBusTimeServ.findTempBusById(tempBusP.getTestBusNumber());
		
		tempBus.setToExamine(42);
		tempBus.setExamineNote(tempBusP.getExamineNote());
		tempBus.setManagerName(tempBusP.getManagerName());
		
		Date dNow = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		tempBus.setPassDate(ft.format(dNow));
		/// empolyeeName 待改
		
		tempBusTimeServ.insertTempBusTimes(tempBus);
		m.addAttribute("tempBusRoute", tempBus.getRouteId()+tempBus.getTripName());
		m.addAttribute("tempBusTime", tempBus.getInitialTime());
		
		return "busTimes/InsertBusResult";
	}
	
	
	// 審查變更
	@RequestMapping(value = "/updateTempBus.controller", method = RequestMethod.POST, params = "uppass")
	public String processUpdateBusAction(@Validated @ModelAttribute("tempBus") TempBusTimes tempBusP, BindingResult result, Model m) {

		TempBusTimes tempBus = tempBusTimeServ.findTempBusById(tempBusP.getTestBusNumber());
		
		tempBus.setToExamine(53);
		tempBus.setExamineNote(tempBusP.getExamineNote());
		tempBus.setManagerName(tempBusP.getManagerName());
		
		
		Date dNow = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		tempBus.setPassDate(ft.format(dNow));
		/// empolyeeName 待改
		
		//  輸入bus表
		BusTimes bus = new BusTimes();
		bus.setBusNumber(tempBus.getBusNumberPo());
		bus.setRouteId(tempBus.getRouteId());
		bus.setTripName(tempBus.getTripName());
		bus.setArea(tempBus.getArea());
		bus.setInitialStation(tempBus.getInitialStation());
		bus.setFinalStation(tempBus.getFinalStation());
		bus.setInitialTime(tempBus.getInitialTime());
		bus.setTotalSeats(tempBus.getTotalSeats());
		bus.setRemainSeats(tempBus.getTotalSeats());
		bus.setNote(tempBus.getNote());
		bus.setTravelTime(tempBus.getTravelTime());
		bus.setSunday(tempBus.getSunday());
		bus.setMonday(tempBus.getMonday());
		bus.setTuesday(tempBus.getTuesday());
		bus.setWednesday(tempBus.getWednesday());
		bus.setThursday(tempBus.getThursday());
		bus.setFriday(tempBus.getFriday());
		bus.setSaturday(tempBus.getSaturday());
		
		if (tempBus.getSunday()==null) {
			tempBus.setSunday(0);
		}
		if (tempBus.getMonday()==null) {
			tempBus.setMonday(0);
		}
		if (tempBus.getTuesday()==null) {
			tempBus.setTuesday(0);
		}
		if (tempBus.getWednesday()==null) {
			tempBus.setWednesday(0);
		}
		if (tempBus.getThursday()==null) {
			tempBus.setThursday(0);
		}
		if (tempBus.getFriday()==null) {
			tempBus.setFriday(0);
		}
		if (tempBus.getSaturday()==null) {
			tempBus.setSaturday(0);
		}
		
		busTimeServ.updateBusTime(bus);
		
		//輸入座位
		for (int i=1; i<= bus.getTotalSeats() ;i++) {
			Seats s = new Seats();
			s.setBusNumber(bus.getBusNumber());
			s.setSeats(i);
			seatServ.insertSeats(s);
		}
		
		tempBusTimeServ.insertTempBusTimes(tempBus);
		m.addAttribute("tempBusRoute", tempBus.getRouteId()+tempBus.getTripName());
		m.addAttribute("tempBusTime", tempBus.getInitialTime());
		
		return "busTimes/InsertBusResult";
	}
	
	// 退回申請
	@RequestMapping(value = "/updateTempBus.controller", method = RequestMethod.POST, params = "upnopass")
	public String processNoUpdateBusAction(@Validated @ModelAttribute("tempBus") TempBusTimes tempBusP, BindingResult result, Model m) {
		
		TempBusTimes tempBus = tempBusTimeServ.findTempBusById(tempBusP.getTestBusNumber());
		
		tempBus.setToExamine(52);
		tempBus.setExamineNote(tempBusP.getExamineNote());
		tempBus.setManagerName(tempBusP.getManagerName());
		
		Date dNow = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		tempBus.setPassDate(ft.format(dNow));
		/// empolyeeName 待改
		
		tempBusTimeServ.insertTempBusTimes(tempBus);
		m.addAttribute("tempBusRoute", tempBus.getRouteId()+tempBus.getTripName());
		m.addAttribute("tempBusTime", tempBus.getInitialTime());
		
		return "busTimes/InsertBusResult";
	}
	
	
	@GetMapping("/findTempbustimeDetailShow.controller")
	public String processTempBusTimeShowDetail(@RequestParam("testBusNumber") Integer tempBusNo, Model m) {
		TempBusTimes bus = tempBusTimeServ.findTempBusById(tempBusNo);
		m.addAttribute("bus", bus);
		return "busTimes/showTempBusTimesDetail";
	} 
	

}

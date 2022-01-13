package com.kh.daydream.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.daydream.service.ReservationService;
import com.kh.daydream.vo.AttendClassVo;
import com.kh.daydream.vo.ReservationTimeVo;
import com.kh.daydream.vo.ReservationVo;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	private static final String RESERVED = "1";
	private static final String INCLASS = "2";
	private static final String FINISH = "3";
	
	@Inject
	private ReservationService reservationService;
	
		// 예약 등록 폼
		@RequestMapping(value="/reservation_regist/{class_no}", method=RequestMethod.GET)
		public String reservationRegistForm(@PathVariable("class_no") int class_no, Model model) {
			String user_id = "hong";
			List<ReservationVo> resvList= reservationService.resvList(user_id, FINISH);
			List<ReservationTimeVo> timeList = reservationService.selectTimeList(class_no);
			model.addAttribute("resvList",resvList);
			model.addAttribute("timeList", timeList);
			System.out.println("ReservationController , reservationRegistForm , timeList >> " + timeList);
			return "reservation/reservation_regist";
	}
		// 예약 등록 처리
		@RequestMapping(value="/regist_run", method=RequestMethod.POST)
		public String reservationResgistrun(ReservationVo reservationVo) {
			System.out.println("RerservationController, insertRerservation, insertReservation:"+reservationVo);
			
			reservationService.insertReservation(reservationVo);
			return "redirect:/admin/rev_list";
	}
		
		
}
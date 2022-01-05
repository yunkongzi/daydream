package com.kh.daydream.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.daydream.service.ReservationService;
import com.kh.daydream.vo.ReservationVo;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	@Inject
	private ReservationService reservationService;
		// 예약 등록 폼
		@RequestMapping(value="/reservation_regist", method=RequestMethod.GET)
		public String reservationRegistForm() {
			return "reservation/reservation_regist";
	}
		// 예약 등록 처리
		@RequestMapping(value="/regist_run", method=RequestMethod.POST)
		public String insertReservation(ReservationVo reservationVo) {
			System.out.println("RerservationController, insertRerservation, insertReservation:"+reservationVo);
			reservationService.insertReservation(reservationVo);
			return "redirect:/reservation/reservation_list";
	}
		
	
}
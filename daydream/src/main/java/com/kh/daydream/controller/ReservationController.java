package com.kh.daydream.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.daydream.service.ReservationService;
import com.kh.daydream.vo.ReservationVo;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	@Inject
	private ReservationService reservationService;
	
		// 예약 등록 폼
		@RequestMapping(value="/reservation_regist", method=RequestMethod.GET)
		public String reservationRegistForm(Model model,int class_no) {
			// tbl_program 의 목록 얻어오기
			// 모델에 담고
			List<ReservationVo> list = reservationService.classList(class_no);
			model.addAttribute("list",list);
			return "reservation/reservation_regist";
	}
		// 예약 등록 처리
		@RequestMapping(value="/regist_run", method=RequestMethod.POST)
		public String reservationResgistrun(ReservationVo reservationVo) {
			System.out.println("RerservationController, insertRerservation, insertReservation:"+reservationVo);
			reservationService.insertReservation(reservationVo);
			return "redirect:/reservation/reservation_regist";
	}
		
	
}
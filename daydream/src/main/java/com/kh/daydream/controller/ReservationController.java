package com.kh.daydream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	// 예약 등록 폼
			@RequestMapping(value="/reservation_regist", method=RequestMethod.GET)
			public String boardRegistForm() {
				return "reservation/reservation_regist";
	}
	
}
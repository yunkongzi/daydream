package com.kh.daydream.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.daydream.service.ReservationService;

import com.kh.daydream.vo.MemberVo;
import com.kh.daydream.vo.ProgramVo;
import com.kh.daydream.vo.ReservationListVo;

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
			List<ReservationTimeVo> timeList = reservationService.selectTimeList(class_no);
			model.addAttribute("timeList", timeList);
			System.out.println("ReservationController , reservationRegistForm , timeList >> " + timeList);
			return "reservation/reservation_regist";
	}
		// 예약 등록 처리
		@RequestMapping(value="/regist_run", method=RequestMethod.POST)
		public String reservationResgistrun(ReservationVo reservationVo) {
			System.out.println("RerservationController, insertRerservation, insertReservation:"+reservationVo);
			reservationService.insertReservation(reservationVo);

			return "redirect:/program_intro";
	} 
		//예약 목록
		 @RequestMapping(value="/rev_list", method=RequestMethod.GET)
		   public String reservationList(Model model,HttpSession session) {
			 MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");

				if (memberVo == null || !memberVo.getUser_id().equals("kongzi")) {
					return "redirect:/main";
				}
			  List<ReservationListVo> revList =  reservationService.reservationList();
			  model.addAttribute("revList", revList);
			  return "/admin/rev_list";
 }

//		// 예약 수정 폼
//		@RequestMapping(value = "/reservation_modify", method = RequestMethod.GET)
//		public String programModify(int class_no, Model model) {
//			System.out.println("class_no" + class_no);
//			ProgramVo programVo = reservationService.selectByClassNo(class_no);
//			List<ReservationTimeVo> timeList = reservationService.selectTimeList(class_no);;
//			model.addAttribute("programVo", programVo);
//			model.addAttribute("timeList", timeList);
//			return "/admin/program_modify";
//		}
//	
//		// 예약 수정 처리
//		@RequestMapping(value = "/reservation_run", method = RequestMethod.POST)
//		public String updateReservation(ReservationVo reservationVo) {
//			reservationService.updateReservation(reservationVo);
//			return "redirect:/reservation/reservation_list";
//		}
//	
//		// 예약 취소
//		@RequestMapping(value = "/deleteReservation", method = RequestMethod.GET)
//		public String deleteReservation(int class_no) {
//			reservationService.deleteReservation(class_no);
//			return "redirect:/reservation/reservation_list";
//		}



		
		

}
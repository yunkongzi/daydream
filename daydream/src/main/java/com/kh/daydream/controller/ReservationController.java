package com.kh.daydream.controller;


import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.daydream.service.ProgramService;
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
	@Inject
	private ProgramService programService;
	
		// 예약등록폼
		@RequestMapping(value="/reservation_regist/{class_no}", method=RequestMethod.GET)
		public String reservationRegistForm(@PathVariable("class_no") int class_no, Model model){
			List<ReservationTimeVo> timeList = reservationService.selectTimeList(class_no);	
			model.addAttribute("timeList", timeList);
			ProgramVo programVo = programService.selectByClassNo(class_no);
			model.addAttribute("programVo",programVo);
			model.addAttribute("class_no", class_no);
			System.out.println("ReservationController, reservationRegistFrom, class_no : " + class_no);
			System.out.println("ReservationController , reservationRegistForm , timeList : " + timeList);
			return "reservation/reservation_regist";
	}
		// 예약등록처리
		@RequestMapping(value="/regist_run", method=RequestMethod.POST)
		public String reservationResgistrun(ReservationVo reservationVo, HttpSession session){
			MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
			String user_id = memberVo.getUser_id();
			reservationVo.setUser_id(user_id);
			System.out.println("ReservationController, reservationResgistrun, reservationVo : " + reservationVo);
			reservationService.insertReservation(reservationVo);
			return "redirect:/program_intro";
	} 
		//예약현황,관리자로 로그인 후 보기
		@RequestMapping(value = "/reservation_list", method = RequestMethod.GET)
		public String reservationList(Model model,ReservationListVo reservationListVo) {
	
			List<ReservationListVo> list = reservationService.selectAll();
			System.out.println("ReservationController, reservationList, list: " + list);
			model.addAttribute("list", list);
			
			  return "/reservation/reservation_list";
		}
		
		// 예약 수정
		@RequestMapping(value = "/res_modify", method = RequestMethod.GET)
		public String updateReservation(int rno, Model model) {
			System.out.println("rno" + rno);
			ProgramVo programVo = reservationService.selectByClassNo(rno);
			List<ReservationTimeVo> timeList = reservationService.selectTimeList(rno);;
			model.addAttribute("programVo", programVo);
			model.addAttribute("timeList", timeList);
			return "/reservation/res_modify";
		}
	
		// 수정 처리
		@RequestMapping(value = "/modify_run", method = RequestMethod.POST)
		public String updateReservation(ReservationListVo reservationListVo) {
			reservationService.updateReservation(reservationListVo);
			return "redirect:/admin/rev_list";
		}
	
		// 삭제
		@RequestMapping(value = "/deleteReservation", method = RequestMethod.GET)
		public String deleteReservation(int rno) {
			reservationService.deleteReservation(rno);
			return "redirect:/reservation/reservation_list";
		}


}
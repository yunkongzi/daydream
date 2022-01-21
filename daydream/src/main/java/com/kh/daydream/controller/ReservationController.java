package com.kh.daydream.controller;




import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.daydream.service.ProgramService;
import com.kh.daydream.service.ReservationService;
import com.kh.daydream.vo.MemberVo;
import com.kh.daydream.vo.ProgramVo;
import com.kh.daydream.vo.ReservationListVo;
import com.kh.daydream.vo.ReservationTimeVo;
import com.kh.daydream.vo.ReservationVo;
import com.kh.daydream.vo.StatusVo;



@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
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
			List<StatusVo> statusList = reservationService.statusList();
			System.out.println("ReservationController, reservationList, list: " + list);
			model.addAttribute("list", list);
			model.addAttribute("statusList", statusList);
			return "/reservation/reservation_list";
		}
		
		// 삭제
		@RequestMapping(value = "/deleteReservation", method = RequestMethod.GET)
		public String deleteReservation(int rno) {
			reservationService.deleteReservation(rno);
			System.out.println("ReservationController, deleteReservation, rno"+rno);
			return "redirect:/reservation/reservation_list";
		}
		
		// 예약상태변경
		@RequestMapping(value = "/change_status", method = RequestMethod.GET)
		@ResponseBody
		public String updateStatus(int rno, String status_code) {
			reservationService.updateStatus(rno,status_code);
			System.out.println("ReservationController, change_status, rno, status_code " + rno + ", " + status_code);
			return "success";
		}

}
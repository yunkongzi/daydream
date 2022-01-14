package com.kh.daydream.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.daydream.service.ProgramService;
import com.kh.daydream.service.ReservationService;
import com.kh.daydream.vo.AttendClassVo;
import com.kh.daydream.vo.ClassTimeVo;
import com.kh.daydream.vo.ProgramVo;
import com.kh.daydream.vo.ReservationTimeVo;
import com.kh.daydream.vo.ReservationVo;


@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	private static final String RESERVED = "1";
	private static final String INCLASS = "2";
	private static final String FINISH = "3";
	private static final String UPLOAD_PATH = "//192.168.0.80/programpic/";
	
	@Inject
	private ReservationService reservationService;
	@Inject
	private ProgramService programService;
	
		// 예약 등록 폼
		@RequestMapping(value="/reservation_regist", method=RequestMethod.GET)
		public String reservationRegistForm( int class_no, Model model){
			List<ReservationTimeVo> timeList = reservationService.selectTimeList(class_no);	
			model.addAttribute("timeList", timeList);
			ProgramVo programVo = programService.selectByClassNo(class_no);
			model.addAttribute("programVo",programVo);
			model.addAttribute("class_no", class_no);
			System.out.println("ReservationController, reservationRegistFrom, class_no : " + class_no);
			System.out.println("ReservationController , reservationRegistForm , timeList : " + timeList);
			return "/reservation/reservation_regist";
	}
		// 예약 등록 처리
		@RequestMapping(value="/regist_run", method=RequestMethod.POST)
		public String reservationResgistrun(ReservationVo reservationVo){
			System.out.println("ReservationController, reservationResgistrun, reservationVo : " + reservationVo);
			reservationService.insertReservation(reservationVo);
			return "redirect:/reservation/reservation_regist";
	} 
		//에약 목록
		 @RequestMapping(value="/rev_list", method=RequestMethod.GET)
		   public String reservationList(Model model) {
			  List<ReservationVo> allList =  reservationService.selectAll();
			  model.addAttribute("allList", allList);
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
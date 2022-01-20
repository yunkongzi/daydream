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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.daydream.service.MemberService;
import com.kh.daydream.service.ReservationService;
import com.kh.daydream.vo.LoginDto;
import com.kh.daydream.vo.MemberVo;
import com.kh.daydream.vo.MyReservationVo;
import com.kh.daydream.vo.ReviewVo;
import com.kh.daydream.vo.TeacherVo;

@RequestMapping("/member")
@Controller
public class MemberController {

	@Inject
	private MemberService memberService;
	@Inject
	private ReservationService reservationService;

	// 회원 가입 폼
	@RequestMapping(value = "/member_regist", method = RequestMethod.GET)
	public String memberRegist() {
		return "/member/member_regist";
	}

	// 회원 가입 처리
	@RequestMapping(value = "/regist_run", method = RequestMethod.POST)
	public String memberRegistRun(MemberVo memberVo) {
		memberService.insertMember(memberVo);
		return "redirect:/member/login";
	}

	// 아이디 중복 확인
	@RequestMapping(value = "member/checkDupId/{user_id}", method = RequestMethod.GET)
	@ResponseBody
	public String checkDupId(@PathVariable("user_id") String user_id) {
		System.out.println("user_id:" + user_id);
		int count = memberService.checkDupId(user_id);
		if (count == 0) {
			return "available";
		}
		return "used";
	}

	// 로그인 폼
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String memberLogin() {

		return "/member/login";
	}

	// 로그인 런
	@RequestMapping(value = "/login_run", method = RequestMethod.POST)
	public String loginRun(LoginDto loginDto, RedirectAttributes rttr, HttpSession session) {
		System.out.println("HomeController, loginRun, loginDto: " + loginDto);
		MemberVo memberVo = memberService.login(loginDto.getUser_id(), loginDto.getUser_pw());
		System.out.println("HomeController, loginRun, memberVo: " + memberVo);
		if (memberVo == null) {
			rttr.addFlashAttribute("msg", "fail");
			// 로그인 실패했을 때
			return "redirect:/member/login";
		} else {
			session.setAttribute("memberVo", memberVo);
			String targetLocation = (String) session.getAttribute("targetLocation");
			session.removeAttribute("targetLocation");
			if (targetLocation == null) {
				// 로그인 성공했을 때
				String user_id = loginDto.getUser_id();
				String is_out = memberVo.getIs_out();
				if (user_id.equals("kongzi")) {
					return "admin/admin_main"; // 관리자페이지로
				} else if (is_out.equals("Y")) {
					rttr.addFlashAttribute("msg", "nothing");
					session.invalidate();
					return "redirect:/member/login";
				}
				else {
					return "redirect:/main";
				}
			} else {
				return "redirect:" + targetLocation;
			}

		}

	}

	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String memberPage(HttpSession session, Model model) {
		MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");
			String user_id = memberVo.getUser_id();
//		String user_id = "hong";
		List<MyReservationVo> reservationList = memberService.reservationList(user_id);
		model.addAttribute("reservationList", reservationList);
		List<ReviewVo> myReviewList = memberService.myReviewList(user_id);
		model.addAttribute("myreviewList", myReviewList);
		List<TeacherVo> myTeacherList = memberService.myTeacherList(user_id);
		model.addAttribute("myTeacherList", myTeacherList);
		System.out.println("memberPage, reservationList"+reservationList);
		return "/member/mypage";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String memberlogout(HttpSession session, RedirectAttributes rttr) {
		session.invalidate();
		rttr.addFlashAttribute("message", "logout");
		return "redirect:/main";
	}

	// 내 정보 수정 폼
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String memberModify_form() {
		return "/member/modify";
	}
	
	//내 정보 수정처리
	@RequestMapping(value="/modify_run", method=RequestMethod.POST)
	   public String updateMemberRun(MemberVo memberVo, HttpSession session, RedirectAttributes rttr) {
	      System.out.println("MemberController, updateStudentRun, memberVo:" + memberVo);
	      memberService.updateMember(memberVo);
	      session.invalidate();
			rttr.addFlashAttribute("message", "login");
			return "redirect:/main";
	            
	   }
	
	//회원 삭제
	@RequestMapping(value="/deleteMember", method=RequestMethod.GET)
	public String memberDelete(String user_id, HttpSession session, RedirectAttributes rttr) {
		System.out.println("user_id:" + user_id);
		memberService.deleteMember(user_id);
		session.invalidate();
		rttr.addFlashAttribute("message", "delete");
		return "redirect:/main";
	}
	
	//예약취소
	@RequestMapping(value = "/deleteReservation", method = RequestMethod.GET)
	public String deleteReservation(int rno) {
		reservationService.deleteReservation(rno);
		System.out.println("MemberController, deleteReservation, rno: "+rno);
		return "redirect:/member/mypage";
	}
}

package com.kh.daydream.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.daydream.service.MemberService;
import com.kh.daydream.vo.LoginDto;
import com.kh.daydream.vo.MemberVo;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	
	
	// 회원 가입 폼
		@RequestMapping(value="/member_regist", method=RequestMethod.GET)
		public String memberRegist() {
			return "member/member_regist";
		}
		
	//회원 가입 처리
	@RequestMapping(value="/regist_run", method=RequestMethod.POST)
	public String memberRegistRun(MemberVo memberVo) {
		
		memberService.insertMember(memberVo);
		return "redirect:member/login";
	}
	
	//아이디 중복 확인
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
	
	//로그인 폼
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String memberLogin() {
		
		return "member/login";
	}
	
	//로그인 런
	@RequestMapping(value = "/login_run", method = RequestMethod.POST)
	public String loginRun(LoginDto loginDto, RedirectAttributes rttr,
						   HttpSession session) {
		System.out.println("HomeController, loginRun, loginDto: " + loginDto);
		MemberVo memberVo = memberService.login(
				loginDto.getUser_id(), loginDto.getUser_pw());
		System.out.println("HomeController, loginRun, memberVo: " + memberVo);
		if (memberVo == null) {
			rttr.addFlashAttribute("msg", "fail");
			//로그인 실패했을 때
			return "redirect:/member/login";
		} else {
			session.setAttribute("memberVo", memberVo);
			String targetLocation = (String)session.getAttribute("targetLocation");
			session.removeAttribute("targetLocation");
			if (targetLocation == null) {
				//로그인 성공했을 때
				String user_id = loginDto.getUser_id();
				
				if(user_id.equals("kongzi")) {
					return "redirect:/admin/admin_main";
				} else {
				return "redirect:/main";}
			} else {
				return "redirect:" + targetLocation;
			}
			
		}
		
	}

}

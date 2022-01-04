package com.kh.daydream.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.daydream.service.MemberService;
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
		System.out.println(
				"MemberController, memberRegistRun, memberVo:"	
						+ memberVo);
		memberService.insertMember(memberVo);
		return "redirect:/member/member_regist";
	}

}

package com.kh.daydream.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/member")
@Controller
public class MemberController {
	
//	@Inject
//	private MemberService memberService;
//	
	// 회원 가입 폼
		@RequestMapping(value="/member_regist", method=RequestMethod.GET)
		public String memberRegist() {
			return "member/member_regist";
		}

}

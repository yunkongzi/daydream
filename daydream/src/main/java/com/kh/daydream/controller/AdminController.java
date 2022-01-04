package com.kh.daydream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	// 회원 가입 폼
		@RequestMapping(value="/program_regist", method=RequestMethod.GET)
		public String programregistform() {
			return "admin/program_regist";
		}
}



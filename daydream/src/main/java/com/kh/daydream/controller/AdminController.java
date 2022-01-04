package com.kh.daydream.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.daydream.service.ProgramService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Inject
	private ProgramService adminService;

	// 관리자 메인 들어가기
	@RequestMapping(value = "/admin_main", method = RequestMethod.GET)
	public String adminMain() {
		return "admin/admin_main";
	}

	// 프로그램 등록 폼 들어가기 
	@RequestMapping(value = "/program_regist", method = RequestMethod.GET)
	public String programRegist() {
		return "admin/program_regist";
	}
	
	
}

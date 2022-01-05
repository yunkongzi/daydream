package com.kh.daydream.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.daydream.service.ProgramService;
import com.kh.daydream.vo.ProgramVo;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Inject
	private ProgramService programService;

	// 관리자 메인 들어가기
	@RequestMapping(value = "/admin_main", method = RequestMethod.GET)
	public String adminMain() {
		return "admin/admin_main";
	}

	
	// 프로그램 등록 폼 
	@RequestMapping(value = "/program_regist", method = RequestMethod.GET)
	public String programRegist() {
		return "/admin/program_regist";
	}
	
	// 프로그램 등록 처리
	@RequestMapping(value="/regist_run", method=RequestMethod.POST)
	public String programRegistRun(ProgramVo programVo) {
		programService.insertProgram(programVo);
		System.out.println("program_regist:" + programVo);
		return "redirect:/admin/program_list";
	}
	
	// 프로그램 목록
	@RequestMapping(value="/program_list", method=RequestMethod.GET)
	public String programListAll(Model model) {
		List<ProgramVo> list = programService.selectAll();
		model.addAttribute("list", list);
		return "/admin/program_list";
	}
	
	
	// 예약자 현황 보기
	@RequestMapping(value="/rev_list", method=RequestMethod.GET)
	public String revListAll() {
		return "/admin/rev_list";
	}
	
}

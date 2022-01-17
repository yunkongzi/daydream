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
@RequestMapping("/")
public class MainController {

	@Inject
	ProgramService programService;

	// 회원들이 보는 프로그램 페이지 열기
	@RequestMapping(value = "/program_intro", method = RequestMethod.GET)
	public String proIntro(Model model) {
		List<ProgramVo> programList = programService.selectOpenedProgramList();
		System.out.println("ProgramController, selectOpenedProgramList, programList:" + programList);
		model.addAttribute("programList", programList);
		return "/program_intro";
	}

}

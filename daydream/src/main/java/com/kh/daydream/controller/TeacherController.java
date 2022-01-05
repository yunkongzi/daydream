package com.kh.daydream.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.daydream.service.TeacherService;
import com.kh.daydream.vo.TeacherVo;


@Controller
@RequestMapping("/teacher")
public class TeacherController {
		@Inject
		private TeacherService teacherService;
		
		// 강사 가입 폼
		@RequestMapping(value="/regist_form", method=RequestMethod.GET)
		public String teacherRegist() {
			return "/teacher/regist_form";
		}
		
		// 강사등록 처리
		@RequestMapping(value="/regist_run", method=RequestMethod.POST)
		public String teacherRegistRun(TeacherVo teacherVo) {
			System.out.println(
					"TeacherController, teacherVo:" + teacherVo);
			teacherService.insertTeacher(teacherVo);
			return "redirect:/teacher/regist_form";
		}
		
		// 강사리스트
		@RequestMapping(value="/list_all", method=RequestMethod.GET)
		public String teacherListAll(Model model) {
			List<TeacherVo> list = teacherService.selectAll();
			model.addAttribute("list", list);
			return "/teacher/list_all";
		}
		
		
	}






package com.kh.daydream.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.daydream.service.ProgramService;
import com.kh.daydream.vo.ClassTimeVo;
import com.kh.daydream.vo.MemberVo;
import com.kh.daydream.vo.ProgramVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final String UPLOAD_PATH = "//192.168.0.80/programpic/";

	@Inject
	private ProgramService programService;

	// 관리자 메인 들어가기
	@RequestMapping(value = "/admin_main", method = RequestMethod.GET)
	public String adminMain(HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		
		if (memberVo == null || !memberVo.getUser_id().equals("kongzi")) {
			return "redirect:/main";
		}
		return "admin/admin_main";
	}

	// 프로그램 등록 폼
	@RequestMapping(value = "/program_regist", method = RequestMethod.GET)
	public String programRegist(HttpSession session, Model model) {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		
		if (memberVo == null || !memberVo.getUser_id().equals("kongzi")) {
			return "redirect:/main";
		}
		
		List<ClassTimeVo> timeList = programService.selectTimeList();
		model.addAttribute("timeList", timeList);
		return "/admin/program_regist";
	}

	// 프로그램 등록 처리
	/*@RequestMapping(value = "/regist_run", method = RequestMethod.POST)
	public String programRegistRun(ProgramVo programVo) {
		programService.insertProgram(programVo);
		System.out.println("program_regist:" + programVo);
		return "redirect:/admin/program_list";
	}*/
	
	// 프로그램 등록 처리, 파일 첨부
		@RequestMapping(value = "/regist_run", method = RequestMethod.POST)
		public String programRegistRun(MultipartHttpServletRequest request) throws Exception {
			MultipartFile multi = request.getFile("file_image");
			String filename = multi.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			String file_image = uuid + "_" + filename;
			multi.transferTo(new File(UPLOAD_PATH + file_image));
			
			String class_name = request.getParameter("class_name");
			String price = request.getParameter("price");
			String target = request.getParameter("target");
			String personnel = request.getParameter("personnel");
			String class_intro = request.getParameter("class_intro");
			String[] arr_time_no = request.getParameterValues("time_no"); // 같은 name으로 여러 값이 넘어 올때
			int[] time_no = new int[arr_time_no.length];
			for (int i = 0; i < arr_time_no.length; i++) {
				time_no[i] = Integer.parseInt(arr_time_no[i]);
			}
			System.out.println(class_intro);
			System.out.println(arr_time_no[0]);
			ProgramVo programVo = new ProgramVo(class_name, price, target, 
					personnel, class_intro, 0, time_no, file_image);
			System.out.println("AdminController, programRegistRun, programVo:" + programVo); 
			
			programService.insertProgram(programVo);
//			System.out.println("program_regist:" + programVo);
			return "redirect:/admin/program_list";
		}
		
		// 이미지 보이기 
		@RequestMapping(value="/displayImage", method=RequestMethod.GET)
		@ResponseBody
		public byte[] displayImage(String fileName) throws Exception {
			// 서버의 파일을 다운로드하기 위한 스트림
			System.out.println("UploadController, displayFile, fileName: " + fileName);
			FileInputStream fis = new FileInputStream(
					UPLOAD_PATH + fileName);
			byte[] bytes = IOUtils.toByteArray(fis);
			return bytes;
		}
		
	// 프로그램 목록
	/*
	 * @RequestMapping(value="/program_list", method=RequestMethod.GET) public
	 * String programListAll(Model model) { List<ProgramVo> list =
	 * programService.selectAll(); model.addAttribute("list", list); return
	 * "/admin/program_list"; }
	 */

	// 프로그램 목록
	@RequestMapping(value = "/program_list", method = RequestMethod.GET)
	public String programListAll(HttpSession session, Model model) {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		
		if (memberVo == null || !memberVo.getUser_id().equals("kongzi")) {
			return "redirect:/main";
		}
		
		List<ProgramVo> programList = programService.selectOpenedProgramList();
		System.out.println("ProgramController, selectOpenedProgramList, programList:" + programList);
		List<ClassTimeVo> timeList = programService.selectTimeList();
		model.addAttribute("programList", programList);
		model.addAttribute("timeList", timeList);
		return "/admin/program_list";
	} 
	

	// 프로그램 수정 폼
	@RequestMapping(value = "/program_modify", method = RequestMethod.GET)
	public String programModify(HttpSession session, int class_no, Model model) {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		
		if (memberVo == null || !memberVo.getUser_id().equals("kongzi")) {
			return "redirect:/main";
		}
		
		System.out.println("class_no" + class_no);
		ProgramVo programVo = programService.selectByClassNo(class_no);
		List<ClassTimeVo> timeList = programService.selectTimeList();
		model.addAttribute("programVo", programVo);
		model.addAttribute("timeList", timeList);
		return "/admin/program_modify";
	}

	// 프로그램 수정 처리
	@RequestMapping(value = "/modify_run", method = RequestMethod.POST)
	public String updateProgram(ProgramVo programVo) {
		programService.updateProgram(programVo);
		
		return "redirect:/admin/program_list";
	}
	
//	@RequestMapping(value = "/modify_run", method = RequestMethod.POST)
//	public String updateProgram(MultipartHttpServletRequest request) throws Exception {
//		MultipartFile multi = request.getFile("file_image");
//		String filename = multi.getOriginalFilename();
//		String uuid = UUID.randomUUID().toString();
//		String file_image = uuid + "_" + filename;
//		multi.transferTo(new File(UPLOAD_PATH + file_image));
//		
//		String class_name = request.getParameter("class_name");
//		String price = request.getParameter("price");
//		String target = request.getParameter("target");
//		String personnel = request.getParameter("personnel");
//		String class_intro = request.getParameter("class_intro");
//		String[] arr_time_no = request.getParameterValues("time_no"); // 같은 name으로 여러 값이 넘어 올때
//		int[] time_no = new int[arr_time_no.length];
//		for (int i = 0; i < arr_time_no.length; i++) {
//			time_no[i] = Integer.parseInt(arr_time_no[i]);
//		}
//		System.out.println(class_intro);
//		System.out.println(arr_time_no[0]);
//		ProgramVo programVo = new ProgramVo(class_name, price, target, 
//				personnel, class_intro, 0, time_no, file_image);
//		System.out.println("AdminController, programRegistRun, programVo:" + programVo); 
//		
//		programService.updateProgram(programVo);
////		System.out.println("program_regist:" + programVo);
//		return "redirect:/admin/program_list";
//	}
	


	// 프로그램 삭제
	@RequestMapping(value = "/deleteProgram", method = RequestMethod.GET)
	public String deleteProgram(int class_no) {
		programService.deleteProgram(class_no);
		return "redirect:/admin/program_list";
	}

	// 예약자 현황 보기
	@RequestMapping(value = "/rev_list", method = RequestMethod.GET)
	public String revListAll(HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		
		if (memberVo == null || !memberVo.getUser_id().equals("kongzi")) {
			return "redirect:/main";
		}
		
		return "/admin/rev_list";
	}

	// 회원들이 보는 프로그램 페이지 열기
	@RequestMapping(value = "/program_intro", method = RequestMethod.GET)
	public String proIntro() {
		return "/program_intro";
	}

//	@RequestMapping(value="/changeProgramTime", method=RequestMethod.POST)	
//	@ResponseBody
//	public String changeProgramTime(int class_no, int time_no, String q) {
//		System.out.println("AdminController, changeProgramTime, class_no:" + class_no);
//		System.out.println("AdminController, changeProgramTime, time_no:" + time_no);
//		System.out.println("AdminController, changeProgramTime, q:" + q);
//		return "success";
//	}

}

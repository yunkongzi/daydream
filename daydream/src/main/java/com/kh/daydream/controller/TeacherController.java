package com.kh.daydream.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.daydream.service.TeacherService;
import com.kh.daydream.vo.MemberVo;
import com.kh.daydream.vo.TeacherMemberVo;
import com.kh.daydream.vo.TeacherVo;

@Controller
@RequestMapping("/teacher")
public class TeacherController<PagingDto> {

	private static final String UPLOAD_PATH = "//192.168.0.80/teacherpic/";
	@Inject
	private TeacherService teacherService;

	// 강사 가입 폼
	@RequestMapping(value = "/teacher_regist", method = RequestMethod.GET)
	public String teacherRegist(HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		if (memberVo == null) {
			return "redirect:/member/login";
		}
		return "/teacher/teacher_regist";
	}

	// 강사등록 처리, 파일첨부
	@RequestMapping(value = "/regist_run", method = RequestMethod.POST)
	public String teacherRegistRun(MultipartHttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("TeacherController, teacherRegistRun...");
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		if (memberVo == null) {
			return "redirect:/member/login";
		}
		MultipartFile multi = request.getFile("certificate");
		String filename = multi.getOriginalFilename();
		String uuid = UUID.randomUUID().toString();
		String certificate = uuid + "_" + filename;
		multi.transferTo(new File(UPLOAD_PATH + certificate));

//			FileCopyUtils.copy(bytes, f);

		String tno = request.getParameter("tno");
		String class_name = request.getParameter("class_name");
		String price = request.getParameter("price");
		String personnel = request.getParameter("personnel");
		String target = request.getParameter("target");
		String introduce = request.getParameter("introduce");
		String user_id = memberVo.getUser_id();
		TeacherVo teacherVo = new TeacherVo(
				tno, class_name, price, personnel, target, certificate, introduce, user_id, "N");
//			System.out.println("TeacherController, teacherRegistRun, filename:" + filename);
		System.out.println("TeacherController, teacherRegistRun, teacherVo:" + teacherVo);
			teacherService.insertTeacher(teacherVo);
		return "redirect:/teacher/teacher_list";
	}

	// 강사리스트, 관리자로 로그인 후 보기
	@RequestMapping(value = "/teacher_list", method = RequestMethod.GET)
	public String teacherListAll(HttpSession session, Model model) {
		MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");

		if (memberVo == null || !memberVo.getUser_id().equals("kongzi")) {
			return "redirect:/main";
		}
		List<TeacherVo> list = teacherService.selectAll();
		System.out.println("TeacherController, teacherListAll, list: " + list);
		model.addAttribute("list", list);
		return "/teacher/teacher_list";
	}

	// 수정 폼
	@RequestMapping(value = "/modifyTeacherForm", method = RequestMethod.GET)
	public String modifyTeacherForm(String tno, Model model) {
		System.out.println("TeacherController, modifyTeacherForm, tno:" + tno);
		TeacherVo teacherVo = teacherService.selectByTno(tno);
		model.addAttribute("teacherVo", teacherVo);
		return "teacher/teacher_modify";
	}


	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String fileName) throws Exception {
		System.out.println("fileName:" + fileName);
		byte[] bytes = null;
		// 서버의 파일을 다운로드하기 위한 스트림
		if (fileName != null && !fileName.equals("")) {
			FileInputStream fis = new FileInputStream(UPLOAD_PATH + fileName);
			bytes = IOUtils.toByteArray(fis);
		}
		return bytes;
	}

	// 강사 수정 처리
	@RequestMapping(value = "/modify_run", method = RequestMethod.POST)
	public String modify_run(TeacherVo teacherVo) {
		System.out.println("TeacherController, modify_run, teacherVo: " + teacherVo);
		teacherService.updateTeacher(teacherVo);

		return "redirect:/teacher/teacher_list";
	}

	// 강사 삭제
	@RequestMapping(value = "/deleteTeacher", method = RequestMethod.GET)
	public String deleteTeacher(String tno) {
		teacherService.deleteTeacher(tno);
		return "redirect:/teacher/teacher_list";
	}
	
	// 강사 수락 상태 변경
	@RequestMapping(value = "/updateStatus/{tno}", method = RequestMethod.GET)
	@ResponseBody
	public String updateStatus(@PathVariable("tno") String tno) {
		teacherService.updateStatus(tno);
		return "success";
	}
	// 강사 목록
	@RequestMapping(value = "/statusList", method = RequestMethod.GET)
	public String statusList(String status, Model model) {
		List<TeacherMemberVo> statusList = teacherService.statusList(status);
		model.addAttribute("statusList", statusList);
		return "teacher/statusList";
	}
}

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.daydream.service.TeacherService;
import com.kh.daydream.vo.MemberVo;
import com.kh.daydream.vo.TeacherVo;

@Controller
@RequestMapping("/teacher")
public class TeacherController<PagingDto> {

	private static final String UPLOAD_PATH = "//192.168.0.80/teacherpic/";
	@Inject
	private TeacherService teacherService;
	private Object pagingDto;

	// 강사 가입 폼
	@RequestMapping(value = "/teacher_regist", method = RequestMethod.GET)
	public String teacherRegist() {

		return "/teacher/teacher_regist";
	}

	// 강사등록 처리, 파일첨부
	@RequestMapping(value = "/regist_run", method = RequestMethod.POST)
	public String teacherRegistRun(MultipartHttpServletRequest request) throws Exception {
		System.out.println("TeacherController, teacherRegistRun...");
		MultipartFile multi = request.getFile("certificate");
		String filename = multi.getOriginalFilename();
		String uuid = UUID.randomUUID().toString();
		String certificate = uuid + "_" + filename;
		multi.transferTo(new File("E:/teacher_attach/" + uuid + "_" + certificate));

//			FileCopyUtils.copy(bytes, f);

		String tno = request.getParameter("tno");
		String class_name = request.getParameter("class_name");
		String price = request.getParameter("price");
		String personnel = request.getParameter("personnel");
		String target = request.getParameter("target");
		String introduce = request.getParameter("introduce");
		TeacherVo teacherVo = new TeacherVo(tno, class_name, price, personnel, target, certificate, introduce);
//			System.out.println("TeacherController, teacherRegistRun, filename:" + filename);
		System.out.println("TeacherController, teacherRegistRun, teacherVo:" + teacherVo);
//			teacherService.insertTeacher(teacherVo);
		return "redirect:/teacher/teacher_regist";
	}

	// 강사리스트
	@RequestMapping(value = "/teacher_list", method = RequestMethod.GET)
	public String teacherListAll(HttpSession session, Model model) {
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		
		if (memberVo == null || !memberVo.getUser_id().equals("kongzi")) {
			return "redirect:/main";
		}
		List<TeacherVo> list = teacherService.selectAll();
		model.addAttribute("list", list);
		return "/teacher/teacher_list";
	}

	// 삭제처리
	@RequestMapping(value = "/deleteTeacher", method = RequestMethod.GET)
	public String deleteTeacher(String tno, RedirectAttributes rttr) {
		System.out.println("TeacherController, deleteTeacher, teacherVo:" + tno);
		// String[] filenames = teacherService.deleteTeacher(tno, filenames);

		rttr.addFlashAttribute("message", "delete_success");
		return "redirect:/teacher/teacher_list?page=" + ((com.kh.daydream.vo.PagingDto) pagingDto).getPage()
				+ "&perPage=" + ((com.kh.daydream.vo.PagingDto) pagingDto).getPerPage() + "&searchType="
				+ ((com.kh.daydream.vo.PagingDto) pagingDto).getSearchType() + "&keyword="
				+ ((com.kh.daydream.vo.PagingDto) pagingDto).getKeyword();
	}
	
	// 수정 폼
	@RequestMapping(value = "/modifyTeacherForm", method = RequestMethod.GET)
	public String modifyTeacherForm(String tno, Model model) {
		TeacherVo teacherVo = teacherService.selectByTno(tno);
		model.addAttribute("teacherVo", teacherVo);
		return "teacher/teacher_modify";
	}
	

	// 수정 처리
//		@RequestMapping(value="/modify_run", method=RequestMethod.POST)
//		public String modifyBoard(TeacherVo boardVo, PagingDto pagingDto, 
//								  RedirectAttributes rttr) {
//			System.out.println("TeacherController, modifyTeacher, teacherVo:" + teacherVo);
//			System.out.println("TeacherController, modifyTeacher, pagingDto:" + pagingDto);
//			((Object) teacherService).modifyteacher(teacherVo);
//			rttr.addFlashAttribute("message", "modify_success");
//			return "redirect:/teacher/content?tno=" + teacherVo.getTno() + 
//					"&page=" + pagingDto.getPage() + 
//					"&perPage=" + pagingDto.getPerPage() +
//					"&searchType=" + pagingDto.getSearchType() +
//					"&keyword=" + ((Object) pagingDto).getKeyword();
//		}

	@RequestMapping(value = "/displayImage", method = RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String fileName) throws Exception {
		System.out.println("fileName:" + fileName);
		// 서버의 파일을 다운로드하기 위한 스트림
		FileInputStream fis = new FileInputStream(UPLOAD_PATH + fileName);
		byte[] bytes = IOUtils.toByteArray(fis);
		return bytes;
	}

}

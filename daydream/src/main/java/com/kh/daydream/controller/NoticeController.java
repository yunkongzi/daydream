package com.kh.daydream.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.daydream.service.NoticeService;
import com.kh.daydream.vo.MemberVo;
import com.kh.daydream.vo.NoticeVo;


@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Inject
	private NoticeService noticeService;

	
	// 공지사항 폼
	@RequestMapping(value = "/write_form", method = RequestMethod.GET)
	public String NoticeWriteFrom() {
		return "/notice/write_form";
	}
	
	// 공지사항 글등록 처리
	@RequestMapping(value="/notice_run", method = RequestMethod.POST)
	public String NoticeWriteRun(NoticeVo noticeVo, RedirectAttributes rttr, HttpSession session) {
		System.out.println("NoticeController, NoticeWriteRun, noticeVo:" + noticeVo);
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		if(memberVo == null) {
			return "redirect:/main";
		}
		String user_id = "kongzi";
		noticeVo.setUser_id(user_id);
		System.out.println("NoticeController, NoticeWriteRun, noticeVo:" + noticeVo);
		noticeService.insertNotice(noticeVo);
		rttr.addFlashAttribute("message", "regist_success");
		return "redirect:/notice/list_all";
	}
	
	// 공지사항 목록
	@RequestMapping(value="/list_all", method=RequestMethod.GET)
	public String NoticeListAll(Model model) {
		List<NoticeVo> list = noticeService.selectAll();
		model.addAttribute("list", list);
		return "notice/list_all";
	}
	
	// 공지사항 수정 폼
	@RequestMapping(value="/modify_form", method=RequestMethod.GET)
	public String updateNoticeForm(int bno, Model model) {
		System.out.println("NoticeController, updateNoticeForm, bno:" + bno);
		NoticeVo noticeVo = noticeService.selectByBno(bno);
		model.addAttribute("noticeVo", noticeVo);
		return "notice/modify_form";
	}
	
	// 공지사항 수정처리
	@RequestMapping(value="/modify_run", method=RequestMethod.POST)
	public String updateNoticeRun(NoticeVo noticeVo) {
		System.out.println("NoticeController, updateNoticeRun, noticeVo: " + noticeVo);
		noticeService.updateNotice(noticeVo);
		return "redirect:/notice/list_all";
	}
	
	// 공지사항 삭제
	@RequestMapping(value="/deleteNotice", method=RequestMethod.GET)
	public String deleteNotice(int bno) {
		System.out.println("bno:" + bno);
		noticeService.deleteNotice(bno);
		
		return "redirect:/notice/list_all";
	}
	
	// 공지사항 상세보기
	@RequestMapping(value="/notice_detail", method=RequestMethod.GET)
	public String noticeDetail(int bno, Model model) {
		System.out.println("NoticeController, noticeDetail , bno:" + bno);
		NoticeVo noticeVo = noticeService.getNotice(bno);
		model.addAttribute("noticeVo", noticeVo);
		return "notice/notice_detail";
		
	}
}

package com.kh.daydream.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.daydream.service.ReviewService;
import com.kh.daydream.util.MyFileUploadUtil;
import com.kh.daydream.vo.AttendClassVo;
import com.kh.daydream.vo.MemberVo;
import com.kh.daydream.vo.ReviewVo;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	private static final String UPLOAD_PATH = "D:/upload";
	private static final String RESERVED = "1";
	private static final String INCLASS = "2";
	private static final String FINISH = "3";
	
	@Inject
	private ReviewService reviewService;
	
	@RequestMapping(value="/reviewList", method=RequestMethod.GET)
	public String reviewList(HttpSession session, Model model) {
//		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
//		String user_id = memberVo.getUser_id();
		String user_id = "hong";
		List<AttendClassVo> reviewList= reviewService.reviewList(user_id, FINISH);
		model.addAttribute("reviewList", reviewList);
		return "review/reviewList";
	}
	
	// 리뷰쓰기 폼 (/review/review_regist)
	@RequestMapping(value="/review_regist", method=RequestMethod.GET)
		public String reviewRegistForm(int class_no) {
			System.out.println("ReviewController, reviewRegistForm, class_no: " + class_no);
			return "review/review_regist";
		}
		
	// 리뷰쓰기 처리(/review/review_regist_run)
	@RequestMapping(value="/review_regist_run", method=RequestMethod.POST)
		public String reviewRegistRun(ReviewVo reviewVo) {
		System.out.println("ReviewController, reviewRegistRun, reviewVo:" + reviewVo);
		reviewService.insertReview(reviewVo);
		return "redirect:/review/mypage.jsp";
	}
	
	// 리뷰 수정 폼
	@RequestMapping(value="/review_modify", method=RequestMethod.GET)
	public String updateReviewForm(int bno, Model model) {
		System.out.println("ReviewController, updateReviewForm, bno: " + bno);
//		ReviewVo reviewVo = reviewService.selectById(bno);
//		model.addAttribute("ReviewVo", reviewVo);
		return "review/review_modify";
	}
	
	// 리뷰 수정처리
	@RequestMapping(value="/review_modify_run", method=RequestMethod.POST)
	public String updateReviewRun(ReviewVo reviewVo) {
		System.out.println("ReviewController, updateReviewRun, reviewVo:" + reviewVo);
		reviewService.updateReview(reviewVo);
		return "redirect:/review/mypage.jsp";
	}
	
	// 리뷰 삭제처리
	@RequestMapping(value="/deleteReview", method=RequestMethod.GET)
	public String deleteReview(int bno) {
		System.out.println("ReviewController, deleteReview");
		String[] filenames = reviewService.deleteReview(bno);
		for (String filename : filenames) {
			MyFileUploadUtil.deleteFile(UPLOAD_PATH + filename);
		}
		return "redirect:/review/mypage.jsp";
	}
}

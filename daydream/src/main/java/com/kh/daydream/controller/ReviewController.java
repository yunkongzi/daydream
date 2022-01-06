package com.kh.daydream.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.daydream.service.ReviewService;
import com.kh.daydream.vo.ReviewVo;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Inject
	private ReviewService reviewService;
	
	// 리뷰쓰기 폼 (/review/review_regist)
	@RequestMapping(value="/review_regist", method=RequestMethod.GET)
		public String reviewRegistForm() {
			return "review/review_regist";
		}
		
	// 리뷰쓰기 처리(/review/review_regist_run)
	@RequestMapping(value="/review_regist_run", method=RequestMethod.POST)
		public String reviewRegistRun(ReviewVo reviewVo) {
		System.out.println("ReviewController, reviewRegistRun, reviewVo:" + reviewVo);
		reviewService.insertReview(reviewVo);
		return "redirect:/review/list_all";
	}
	
	// 리뷰 수정 폼
	@RequestMapping(value="/review_modify", method=RequestMethod.GET)
	public String updateReviewForm(int bno, Model model) {
		ReviewVo reviewVo = reviewService.selectById(bno);
		model.addAttribute("ReviewVo", reviewVo);
		return "review/review_modify";
	}
	
	// 리뷰 수정처리
	@RequestMapping(value="/review_modify_run", method=RequestMethod.POST)
	public String updateReviewRun(ReviewVo reviewVo) {
		System.out.println("ReviewController, updateReviewRun, reviewVo:" + reviewVo);
		reviewService.updateReview(reviewVo);
		return "redirect:/review/review_list";
	}
}

package com.kh.daydream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	// 글쓰기 폼 (/review/review_regist)
		@RequestMapping(value="/review_regist", method=RequestMethod.GET)
		public String reviewRegistForm() {
			return "review/review_regist";
		}

}

package com.kh.daydream.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.daydream.service.ProgramService;
import com.kh.daydream.service.ReviewService;
import com.kh.daydream.util.MyFileUploadUtil;
import com.kh.daydream.vo.AttendClassVo;
import com.kh.daydream.vo.MemberVo;
import com.kh.daydream.vo.PagingDto;
import com.kh.daydream.vo.ProgramVo;
import com.kh.daydream.vo.ReviewVo;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	private static final String UPLOAD_PATH = "//192.168.0.80/reviewpic";
//	private static final String RESERVED = "1";
//	private static final String INCLASS = "2";
	private static final String FINISH = "3";
	
	@Inject
	private ReviewService reviewService;
	
	@Inject
	private ProgramService programService;
	
	
	@RequestMapping(value="/reviewList_all", method=RequestMethod.GET)
	public String reviewListAll(HttpSession session, Model model, PagingDto pagingDto) {
		
		int count = reviewService.getCount(pagingDto);
		pagingDto.setCount(count);
		pagingDto.setPageInfo();
		System.out.println("ReivewControler, reviewListAll, pagingDto:" + pagingDto);
		List<ReviewVo> list = reviewService.selectAll(pagingDto);
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
//		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
//		String user_id = memberVo.getUser_id();
		String user_id = "hong";
		List<AttendClassVo> reviewList_all= reviewService.reviewListAll(user_id, FINISH);
		model.addAttribute("reviewList_all", reviewList_all);
		return "review/reviewList_all";
	}
	
	// 리뷰쓰기 폼 (/review/review_regist)
	@RequestMapping(value="/review_regist", method=RequestMethod.GET)
		public void reviewRegistForm(int class_no, Model model, HttpSession session) {
//		MemberVo memberVo  = (MemberVo)session.getAttribute("memberVo");
//		if (memberVo == null) {
//			return "redirect:/main";
//		}
		System.out.println("ReviewController, reviewRegistForm, class_no: " + class_no);
			ProgramVo programVo = programService.selectByClassNo(class_no);
			String class_name = programVo.getClass_name();
			model.addAttribute("class_name", class_name);
			model.addAttribute("class_no", class_no);
		}

		public String reviewRegistForm(String class_name) {
			System.out.println("ReviewController, reviewRegistForm, class_name: " + class_name);

			return "review/review_regist";
		}
		
	// 리뷰쓰기 처리(/review/review_regist_run)
	@RequestMapping(value="/regist_run", method=RequestMethod.POST)
		public String reviewRegistRun(ReviewVo reviewVo, RedirectAttributes rttr, HttpSession session) {
		System.out.println("ReviewController, reviewRegistRun");
//		MemberVo memberVo  = (MemberVo)session.getAttribute("memberVo");
//		if (memberVo == null) {
//			return "redirect:/main";
//		}
//		
		System.out.println("ReviewController, reviewRegistRun, reviewVo:" + reviewVo);
//		String user_id = memberVo.getUser_id();
		String user_id = "hong";
		reviewVo.setUser_id(user_id);
		System.out.println("ReviewController, reviewRegistRun, reviewVo:" + reviewVo);
		reviewService.insertReview(reviewVo);
		rttr.addFlashAttribute("message", "regist_success");
		return "redirect:/review/reviewList_all";
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
		return "review/reviewList";
	}
	
	// 리뷰 삭제처리
	@RequestMapping(value="/deleteReview", method=RequestMethod.GET)
	public String deleteReview(int bno) {
		System.out.println("ReviewController, deleteReview");
		String[] filenames = reviewService.deleteReview(bno);
		for (String filename : filenames) {
			MyFileUploadUtil.deleteFile(UPLOAD_PATH + filename);
		}
		return "review/reviewList";
	}
	
	// 파일 업로드 처리
	@RequestMapping(value="/uploadAjax" , method=RequestMethod.POST,
			produces = "application/text;charset=utf-8")
	
	@ResponseBody
	public String uploadAjax(MultipartFile file) throws IOException {
		System.out.println("UploadController, uploadAjax, file: " + file);
		String originalName = file.getOriginalFilename();
		System.out.println("UploadController, uploadAjax, originalName:" + originalName);
		String filePath = MyFileUploadUtil.uploadFile(UPLOAD_PATH, originalName, file.getBytes());
		boolean isImage = MyFileUploadUtil.isImage(originalName);
		if(isImage) {
			boolean result = MyFileUploadUtil.makeThumbnail(filePath);
			if(!result) {
				return "fail";
			} 
		}
		
		return filePath.substring(UPLOAD_PATH.length());
		
	}
	// 썸네일 이미지
	@RequestMapping(value="/displayImage", method=RequestMethod.GET) 
	@ResponseBody
	public byte[] displayImage(String fileName) throws Exception {
//		System.out.println("ReviewController, displayImage, fileName: " + fileName);
//		int slashIndex = fileName.lastIndexOf("/");
//		String front = fileName.substring(0, slashIndex + 1);
//		String rear = fileName.substring(slashIndex + 1);
//		FileInputStream fis = new FileInputStream(
//				UPLOAD_PATH + front + "sm_" + rear);
		byte[] bytes = MyFileUploadUtil.displayImage(UPLOAD_PATH, fileName);
		return bytes;
	}
	
	// 파일 삭제
	@RequestMapping(value="/deleteFile", method=RequestMethod.GET)
	@ResponseBody
	public String deleteFile(String fileName) {
		System.out.println("UploadController, deleteFile, fileName:" + fileName);
		boolean result = MyFileUploadUtil.deleteFile(UPLOAD_PATH + fileName);
		if (result == true) {
			return "success";
		}
		return "fail";
	}
}

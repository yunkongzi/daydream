package com.kh.daydream.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	// 리뷰 목록보기
	@RequestMapping(value="/reviewList_all", method=RequestMethod.GET)
	public String reviewListAll(HttpSession session, Model model, PagingDto pagingDto) {
		
		int count = reviewService.getCount(pagingDto);
		pagingDto.setCount(count);
		pagingDto.setPageInfo();
		System.out.println("ReivewControler, reviewListAll, pagingDto:" + pagingDto);
		List<ReviewVo> list = reviewService.selectAll(pagingDto);
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		String user_id = memberVo.getUser_id();
//		String user_id = "hong";
		List<AttendClassVo> reviewList_all= reviewService.reviewListAll(user_id, FINISH);
		model.addAttribute("reviewList_all", reviewList_all);
		return "review/reviewList_all";
	}
	
	// 리뷰쓰기 폼 (/review/review_regist)
	@RequestMapping(value="/review_regist", method=RequestMethod.GET)
	public String reviewRegistForm(int class_no, Model model, HttpSession session) {
		MemberVo memberVo  = (MemberVo)session.getAttribute("memberVo");
		if (memberVo == null) {
			return "redirect:/main";
		}
		System.out.println("ReviewController, reviewRegistForm, class_no: " + class_no);
		ProgramVo programVo = programService.selectByClassNo(class_no);
		String class_name = programVo.getClass_name();
		model.addAttribute("class_name", class_name);
		model.addAttribute("class_no", class_no);
		return "review/review_regist";
	}

//		public String reviewRegistForm(String class_name) {
//			System.out.println("ReviewController, reviewRegistForm, class_name: " + class_name);
//
//			return "review/review_regist";
//		}
		
	// 리뷰쓰기 처리(/review/review_regist_run)
	@RequestMapping(value="/regist_run", method=RequestMethod.POST)
		public String reviewRegistRun(ReviewVo reviewVo, RedirectAttributes rttr, HttpSession session) {
		System.out.println("ReviewController, reviewRegistRun");
		MemberVo memberVo  = (MemberVo)session.getAttribute("memberVo");
		if (memberVo == null) {
			return "redirect:/main";
		}
		
		System.out.println("ReviewController, reviewRegistRun, reviewVo:" + reviewVo);
		String user_id = memberVo.getUser_id();
//		String user_id = "hong";
		reviewVo.setUser_id(user_id);
		System.out.println("ReviewController, reviewRegistRun, reviewVo:" + reviewVo);
		reviewService.insertReview(reviewVo);
		rttr.addFlashAttribute("message", "regist_success");
		return "redirect:/review/reviewList_all";
	}
	
	// 상세보기
	@RequestMapping(value="/content", method=RequestMethod.GET)
	public String reviewContent(int bno, PagingDto pagingDto, Model model) {
		System.out.println("ReviewController, reviewContent, bno: " + bno);
		ReviewVo reviewVo = reviewService.getReview(bno);
		model.addAttribute("reviewVo", reviewVo);
		model.addAttribute("pagingDto", pagingDto);
		return "review/content";
	}
	
	// 리뷰 수정처리
	@RequestMapping(value="/modify_run", method=RequestMethod.POST)
	public String modifyReview(ReviewVo reviewVo, PagingDto pagingDto,
								  RedirectAttributes rttr) {
		System.out.println("ReviewController, modifyReview, reviewVo:" + reviewVo);
		System.out.println("ReviewController, modifyReview, pagingDto:" + pagingDto);
		reviewService.modifyReview(reviewVo);
		rttr.addFlashAttribute("message", "modify_success");
		return "redirect:/review/content?bno=" + reviewVo.getBno() +
				"&page=" + pagingDto.getPage() +
				"&perPage=" + pagingDto.getPerPage() +
				"&searchType=" + pagingDto.getSearchType() +
				"&keyword=" + pagingDto.getKeyword();
	}
	
	// 리뷰 삭제처리
	@RequestMapping(value="/deleteReview", method=RequestMethod.GET)
	public String deleteReview(int bno, PagingDto pagingDto, RedirectAttributes rttr) {
		System.out.println("ReviewController, deleteReview, pagingDto:" + pagingDto);
		String[] filenames = reviewService.deleteReview(bno);
		for (String filename : filenames) {
			MyFileUploadUtil.deleteFile(UPLOAD_PATH + filename);
		}
		rttr.addFlashAttribute("message", "delete_success");
		return "redirect:/review/reviewList_all?page=" + pagingDto.getPage() + 
				"&perPage=" + pagingDto.getPerPage() +
				"&searchType=" + pagingDto.getSearchType() +
				"&keyword=" + pagingDto.getKeyword();
	}
	
	// 파일 업로드 처리
	@RequestMapping(value="/uploadAjax" , method=RequestMethod.POST,
			produces = "application/text;charset=utf-8")
	
	@ResponseBody
	public String uploadAjax(MultipartFile file) throws IOException {
		System.out.println("ReviewController, uploadAjax, file: " + file);
		String originalName = file.getOriginalFilename();
		System.out.println("ReviewController, uploadAjax, originalName:" + originalName);
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
		System.out.println("ReviewController, deleteFile, fileName:" + fileName);
		boolean result = MyFileUploadUtil.deleteFile(UPLOAD_PATH + fileName);
		if (result == true) {
			return "success";
		}
		return "fail";
	}
	
	// 상세보기
//	@RequestMapping(value="/detail/{bno}", method=RequestMethod.GET)
//	public void content(@PathVariable("bno") int bno, Model model) {
//		System.out.println("ReviewController, content, bno:	" + bno);
//		ReviewVo reviewVo = reviewService.selectByBno(bno);
//		model.addAttribute("ReviewVo", reviewVo);
//	}
}

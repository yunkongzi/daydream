package com.kh.daydream.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.daydream.dao.ReviewDao;
import com.kh.daydream.vo.ReviewVo;

@Service
public class ReviewService {
	
	@Inject
	private ReviewDao reviewDao;
	
	// 리뷰 추가
	public void insertReview (ReviewVo reviewVo) {
		reviewDao.insertReview(reviewVo);
	}
	
	// 특정 리뷰 조회
	public ReviewVo selectById(int bno) {
		ReviewVo reviewVo = reviewDao.selectById(bno);
		return reviewVo;
	}
	
	// 리뷰 정보 수정
	public void updateReview(ReviewVo reviewVo) {
		reviewDao.updateReview(reviewVo);
	}
	
//	// 첨부파일 정보 등록
//	@Transactional
//	@Override
//	public void addAttach(ReviewVo reviewVo) throws Exception{
//		String title = reviewVo.getTitle();
//		String content = reviewVo.getContent();
//		title = title.replace("<", "&lt;");
//		title = title.replace("<", "&gt;");
//		title = title.replace(" ",  "nbsp;&nbsp;");
//		content = content.replace("\n","<br>");
//		reviewVo.getTitle();
//		reviewVo.getContent();
//		reviewDao.create(reviewVo);
//		// 게시물의 첨부파일 정보 등록
//		String[] files = reviewVo.getFiles(); // 첨부파일 배열
//		if(files == null) return; // 첨부파일이 없으면 메서드 종료
//		// 첨부파일들의 정보를 tbl_attach 테이블에 insert
//		for(String name : files){
//			reviewDao.addAttach(name);
//		}
//	}

}

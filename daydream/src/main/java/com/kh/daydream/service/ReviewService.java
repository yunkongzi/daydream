package com.kh.daydream.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

}

package com.kh.daydream.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.daydream.dao.ReviewDao;
import com.kh.daydream.vo.ReviewVo;

@Service
public class ReviewService {
	
	@Inject
	private ReviewDao reviewDao;
	
	public void insertReview (ReviewVo reviewVo) {
		reviewDao.insertReview(reviewVo);
	}

}

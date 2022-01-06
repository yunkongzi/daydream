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
	@Transactional
	public void insertReview (ReviewVo reviewVo) {
//		int bno = reviewDao.getBnoNextVal();// seq_bno.nextval
//		reviewVo.setBno(bno);
		reviewDao.insertReview(reviewVo);
		String [] files = reviewVo.getFiles();
		if(files != null && files.length > 0) {
			for(String file_name : files) {
//				reviewDao.insertAttach(file_name, bno);
			}
		}
		
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

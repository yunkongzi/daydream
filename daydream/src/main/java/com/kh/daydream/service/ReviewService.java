package com.kh.daydream.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.daydream.dao.ReviewDao;
import com.kh.daydream.vo.AttendClassVo;
import com.kh.daydream.vo.PagingDto;
import com.kh.daydream.vo.ReviewVo;



@Service
public class ReviewService {
	
	@Inject
	private ReviewDao reviewDao;
	
	
	public List<ReviewVo> selectAll(PagingDto pagingDto) {
		List<ReviewVo> list = reviewDao.selectAll(pagingDto);
		return list;
	}
	
	// 리뷰 추가
	@Transactional
	public void insertReview(ReviewVo reviewVo) {
		int bno = reviewDao.getBnoNextVal(); // seq_bno.nextval
		reviewVo.setBno(bno);
		reviewDao.insertReview(reviewVo); // tbl_review
		String[] files = reviewVo.getFiles();
		if(files != null && files.length > 0) {
			for (String file_name : files) {
				reviewDao.insertAttach(file_name, bno); // tbl_attach
			}
		}
	}
	
	public ReviewVo getReview(int bno) {
		reviewDao.updateViewcnt(bno);
		ReviewVo reviewVo = reviewDao.getReview(bno);
		String [] filenames = reviewDao.getFilenames(bno);
		reviewVo.setFiles(filenames);
		return reviewVo;
	}
	
	// 리뷰 삭제
	@Transactional
	public String[] deleteReview(int bno) {
		String[] filenames = reviewDao.getFilenames(bno);
		reviewDao.deleteAttach(bno); // 첨부파일 데이터 삭제
		reviewDao.deleteReview(bno); // 리뷰글 삭제
		return filenames;
	}
	
	public void modifyReview(ReviewVo reviewVo) {
		reviewDao.modifyReveiw(reviewVo);
	}
	
	public int getCount(PagingDto pagingDto) {
		int count = reviewDao.getCount(pagingDto);
		return count;
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
	
	// 리뷰 리스트 
	public List<AttendClassVo> reviewListAll(String user_id, String status) {
		List<AttendClassVo> list = reviewDao.reviewListAll(user_id, status);
		return list;
	}
	

}

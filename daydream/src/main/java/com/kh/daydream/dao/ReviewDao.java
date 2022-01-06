package com.kh.daydream.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.daydream.vo.ReviewVo;

@Repository
public class ReviewDao {
	private static final String NAMESPACE = "com.kh.daydream.mappers.review.";
	
	@Inject
	private SqlSession sqlsession;
	
	// 리뷰 추가
	public void insertReview (ReviewVo reviewVo) {
		sqlsession.insert(NAMESPACE + "insertReview", reviewVo);
	}
	
	// 리뷰 정보 보기
	public ReviewVo selectById(int bno) {
		ReviewVo reviewVo = sqlsession.selectOne(NAMESPACE + "selectById", bno);
		return reviewVo;
	}
	
	// 리뷰 수정
	public void updateReview(ReviewVo reviewVo) {
		sqlsession.update(NAMESPACE + "updateReview", reviewVo);
	}
	
	
	
}

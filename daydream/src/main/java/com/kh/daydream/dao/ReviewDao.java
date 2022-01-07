package com.kh.daydream.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.daydream.vo.ReviewVo;
import com.kh.daydream.vo.ReviewVo;
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
	
	// 리뷰 삭제
	public void deleteReview(int bno) {
		sqlsession.delete(NAMESPACE + "deleteReview", bno);
	}
	
	public void modifyReveiw(ReviewVo reviewVo) {
		sqlsession.update(NAMESPACE + "modifyBoard", reviewVo);
	}
	
	// 조회수 
	public void updateViewcnt(int bno) {
		sqlsession.update(NAMESPACE + "updateViewcnt" , bno);
	}
	
	public ReviewVo getReview(int bno) {
		ReviewVo boardVo = sqlsession.selectOne(NAMESPACE + "getReview", bno);
		return boardVo;
	}
	
	public String[] getFilenames(int bno) {
		List<String> fileNames = sqlsession.selectList(
				NAMESPACE + "getFilenames", bno);
		String[] arr = new String[fileNames.size()];
		for(int i = 0; i < arr.length; i++) {
			arr[i] = fileNames.get(i);
		}
		return arr;
	}
	
	public int getBnoNextVal() {
		int bno = sqlsession.selectOne(NAMESPACE + "getBnoNextVal");
		return bno;
	}
	
	// 파일 업로드 
	public void insrtAttach(String file_name, int bno) {
		Map<String,Object> map = new HashMap<>();
		map.put("file_name", file_name);
		map.put("bno", bno);
		sqlsession.insert(NAMESPACE + "insrtAttach", map);
	}
	
	public void deleteAttach(int bno) {
		sqlsession.delete(NAMESPACE + "deleteAttach", bno);
	}
	
}

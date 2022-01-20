package com.kh.daydream.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.daydream.vo.AttendClassVo;
import com.kh.daydream.vo.PagingDto;
import com.kh.daydream.vo.ReviewVo;


@Repository
public class ReviewDao {
	private static final String NAMESPACE = "com.kh.daydream.mappers.review.";
	
	@Inject
	private SqlSession sqlsession;
	
	public List<ReviewVo> selectAll(PagingDto pagingDto) {
		System.out.println("ReviewDao, selectAll, pagingDto: " + pagingDto);
		List<ReviewVo> list = sqlsession.selectList(NAMESPACE + "selectAll", pagingDto);
		return list;
	}
	
	// 리뷰 추가
	public void insertReview (ReviewVo reviewVo) {
		sqlsession.insert(NAMESPACE + "insertReview", reviewVo);
	}
	
	// 리뷰 수정
	public void updateReview(ReviewVo reviewVo) {
		sqlsession.update(NAMESPACE + "updateReview", reviewVo);
	}
	
	// 리뷰 삭제
	public void deleteReview(int bno) {
		sqlsession.delete(NAMESPACE + "deleteReview", bno);
	}
	// 리뷰 수정처리
	public void modifyReveiw(ReviewVo reviewVo) {
		sqlsession.update(NAMESPACE + "modifyBoard", reviewVo);
	}
	
	public int getCount(PagingDto pagingDto) {
		int count = sqlsession.selectOne(NAMESPACE + "getCount", pagingDto);
		return count;
	}
	
	// 조회수 
	public void updateViewcnt(int bno) {
		sqlsession.update(NAMESPACE + "updateViewcnt" , bno);
	}
	
	// 리뷰 상세보기
	public ReviewVo getReview(int bno) {
		ReviewVo reviewVo = sqlsession.selectOne(NAMESPACE + "getReview", bno);
		return reviewVo;
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
	public void insertAttach(String file_name, int bno) {
		Map<String, Object> map = new HashMap<>();
		map.put("file_name", file_name);
		map.put("bno", bno);
		sqlsession.insert(NAMESPACE + "insertAttach", map);
	}
	// 파일 삭제
	public void deleteAttach(int bno) {
		sqlsession.delete(NAMESPACE + "deleteAttach", bno);
	}
	
	// 리뷰 리스트
	public List<AttendClassVo> reviewListAll(String user_id, String status) {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("status", status);
		List<AttendClassVo> list = sqlsession.selectList(NAMESPACE + "reviewListAll", map);
		return list;
	}
	
}

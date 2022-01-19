package com.kh.daydream.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.daydream.vo.NoticeVo;

@Repository
public class NoticeDao {
	private static final String NAMESPACE = 
			"com.kh.daydream.mappers.notice.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 공지사항 추가
	public void insertNotice(NoticeVo noticeVo)	{
		sqlSession.insert(NAMESPACE + "insertNotice", noticeVo);
	}
	
	public NoticeVo selectByBno(int bno) {
		NoticeVo noticeVo = sqlSession.selectOne(NAMESPACE + "selectByBno" , bno);
		return noticeVo;
	}
	
	// bno 얻기
	public int getBnoNextVal() {
		int bno = sqlSession.selectOne(NAMESPACE + "getBnoNextVal");
		return bno;
	}
	
	// 공지사항 전체 목록
	public List<NoticeVo> selectAll() {
		List<NoticeVo> list = sqlSession.selectList(NAMESPACE + "selectAll");
		return list;
	}
	
	// 공지사항 상세보기
	public NoticeVo getNotice(int bno) {
		NoticeVo noticeVo = sqlSession.selectOne(NAMESPACE + "getNotice", bno);
		return noticeVo;
	}
	
	// 공지사항 수정
	public void updateNotice(NoticeVo noticeVo) {
		sqlSession.update(NAMESPACE + "updateNotice", noticeVo);
	}
	
	// 공지사항 삭제
	public void deleteNotice(int bno) {
		sqlSession.delete(NAMESPACE + "deleteNotice", bno);
	}
}

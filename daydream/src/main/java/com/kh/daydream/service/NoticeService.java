package com.kh.daydream.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.daydream.dao.NoticeDao;
import com.kh.daydream.vo.NoticeVo;

@Service
public class NoticeService {

	@Inject
	private NoticeDao noticeDao;
	
	// 공지사항 추가
	public void insertNotice(NoticeVo noticeVo) {
		noticeDao.insertNotice(noticeVo);
	}
	
	public NoticeVo selectByBno(int bno) {
		NoticeVo noticeVo = noticeDao.selectByBno(bno);
		return noticeVo;
	}
	
	// 공지사항 조회
	public List<NoticeVo> selectAll() {
		List<NoticeVo> list = noticeDao.selectAll();
		return list;
	}
	
	// 공지사항 상세보기
	public NoticeVo getNotice(int bno) {
		NoticeVo noticeVo = noticeDao.getNotice(bno);
		return noticeVo;
	}
	// 공지사항 수정하기
	public void updateNotice(NoticeVo noticeVo) {
		noticeDao.updateNotice(noticeVo);
	}
	// 공지사항 삭제하기
	public void deleteNotice(int bno) {
		noticeDao.deleteNotice(bno);
	}
}

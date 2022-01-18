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
	
	public NoticeVo selectById(int bno) {
		NoticeVo noticeVo = noticeDao.selectById(bno);
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
}

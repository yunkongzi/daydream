package com.kh.daydream.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.daydream.dao.TeacherDao;
import com.kh.daydream.vo.TeacherMemberVo;
import com.kh.daydream.vo.TeacherVo;

@Service
public class TeacherService {
	@Inject
	private TeacherDao teacherDao;
	private TeacherVo list;
	
	// 강사 추가
	public void insertTeacher(TeacherVo teacherVo) {
		teacherDao.insertTeacher(teacherVo);
	}
	// 특정 강사 조회
		public TeacherVo selectByTno(String tno) {
			TeacherVo teacherVo = teacherDao.selectByTno(tno);
			return teacherVo;
		}	
	// 모든 강사 조회
	public List<TeacherVo> selectAll() {
		List<TeacherVo> list = teacherDao.selectAll();
		return list;
	}	
	// 강사정보 수정
	public void updateTeacher(TeacherVo teacherVo) {
		teacherDao.updateTeacher(teacherVo);		
	}	
	// 강사 정보 삭제
	public void deleteTeacher(String tno) {
		teacherDao.deleteTeacher(tno);
	}	
	//수락
	public void updateStatus(String tno) {
		teacherDao.updateStatus(tno);
	}
	//status리스트
	public List<TeacherMemberVo> statusList(String status) {
		List<TeacherMemberVo> statusList = teacherDao.statusList(status);
		return statusList;
	}
}
	
	
	


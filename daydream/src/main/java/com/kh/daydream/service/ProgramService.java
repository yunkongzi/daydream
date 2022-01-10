package com.kh.daydream.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.daydream.dao.ProgramDao;
import com.kh.daydream.vo.ClassTimeVo;
import com.kh.daydream.vo.ProgramVo;

@Service
public class ProgramService {

	@Inject
	private ProgramDao programDao;

	// 프로그램 등록
	@Transactional
	public void insertProgram(ProgramVo programVo) {
		int class_no = programDao.selectClassNo();
		programVo.setClass_no(class_no);
		System.out.println("ProgramService, insertProgram, programVo:" + programVo);
		programDao.insertProgram(programVo);

		int timeCount = programVo.getTime_no().length;
		for (int i = 0; i < timeCount; i++) {
			int program_time = programVo.getTime_no()[i];
			System.out.println("program_time:" + program_time);
			programDao.insertProgramSub(class_no, program_time);
		}

	}

	// 모든 프로그램 조회
	public List<ProgramVo> selectAll() {
		List<ProgramVo> list = programDao.selectAll();
		return list;
	}

	public List<ClassTimeVo> selectTimeList() {
		List<ClassTimeVo> list = programDao.selectTimeList();

		return list;
	}

	// 클래스 번호로 조회
	public ProgramVo selectByClassNo(int class_no) {
		ProgramVo programVo = programDao.selectByClassNo(class_no);
		return programVo;
	}

	// 프로그램 수정 처리
	public ProgramVo updateProgram(ProgramVo programVo) {
		programDao.updateProgram(programVo);
		return programVo;

	}

	// 프로그램 삭제 처리
	public void deleteProgram(int class_no) {
		programDao.deleteProgram(class_no);

	}

}

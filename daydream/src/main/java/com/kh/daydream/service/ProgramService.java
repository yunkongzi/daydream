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
		for (int i = 0 ; i < timeCount; i++) {
			int program_time =  programVo.getTime_no()[i];
			System.out.println("program_time:" + program_time);
			programDao.insertProgramSub(class_no, program_time);
		}
		
	}
	
	// 모든 회원 조회
	public List<ProgramVo> selectAll() {
		List<ProgramVo> list = programDao.selectAll();
		return list;
	}
	
	public List<ClassTimeVo> selectTimeList(){
		List<ClassTimeVo> list = programDao.selectTimeList();
		
		return list;
	}
	
	
}

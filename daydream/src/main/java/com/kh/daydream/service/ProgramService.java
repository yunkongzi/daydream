package com.kh.daydream.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.daydream.dao.ProgramDao;
import com.kh.daydream.vo.ProgramVo;

@Service
public class ProgramService {

	@Inject
	private ProgramDao programDao;
	
	// 프로그램 등록
	public void insertProgram(ProgramVo programVo) {
		programDao.insertProgram(programVo);
	}
	
	// 모든 회원 조회
	public List<ProgramVo> selectAll() {
		List<ProgramVo> list = programDao.selectAll();
		return list;
	}
	
	
}

package com.kh.daydream.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.daydream.dao.ProgramDao;
import com.kh.daydream.vo.ProgramVo;

@Service
public class ProgramService {

	@Inject
	private ProgramDao programDao;
	
	public void insertProgram(ProgramVo programVo) {
		programDao.insertProgram(programVo);
	}
	
	
}

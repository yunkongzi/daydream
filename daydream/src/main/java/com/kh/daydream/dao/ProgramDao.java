package com.kh.daydream.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.daydream.vo.ProgramVo;

@Repository
public class ProgramDao {
	private static final String NAMESPACE = "com.kh.daydream.mappers.program.";

	@Inject
	private SqlSession sqlSession;
	
	public void insertProgram(ProgramVo programVo) {
		sqlSession.insert(NAMESPACE + "insertProgram", programVo);
	}
}

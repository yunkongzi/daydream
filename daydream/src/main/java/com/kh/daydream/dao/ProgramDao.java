package com.kh.daydream.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.daydream.vo.ProgramVo;

@Repository
public class ProgramDao {
	private static final String NAMESPACE = "com.kh.daydream.mappers.program.";

	@Inject
	private SqlSession sqlSession;
	
	// 프로그램 등록
	public void insertProgram(ProgramVo programVo) {
		sqlSession.insert(NAMESPACE + "insertProgram", programVo);
	}
	
	// 프로그램 전체 목록
	public List<ProgramVo> selectAll(){
		List<ProgramVo> list = sqlSession.selectList(NAMESPACE + "selectAll");
		return list;
	}
}

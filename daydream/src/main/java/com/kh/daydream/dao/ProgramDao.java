package com.kh.daydream.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.daydream.vo.ClassTimeVo;
import com.kh.daydream.vo.ProgramVo;

@Repository
public class ProgramDao {
	private static final String NAMESPACE = "com.kh.daydream.mappers.program.";

	@Inject
	private SqlSession sqlSession;
	
	public int selectClassNo() {
		int class_no = sqlSession.selectOne(NAMESPACE + "selectClassNo");
		return class_no;
	}
	
	// 프로그램 등록
	public void insertProgram(ProgramVo programVo) {
		sqlSession.insert(NAMESPACE + "insertProgram", programVo);
	}
	// 서브 프로그램
	public void insertProgramSub(int class_no, int program_time) {
		Map<String, Integer> map = new HashMap<>();
		map.put("class_no", class_no);
		map.put("program_time", program_time);
		sqlSession.insert(NAMESPACE + "insertProgramSub", map);
	}
	
	// 클래스 번호로 조회
	public ProgramVo selectByClassNo(int class_no) {
		ProgramVo programVo = sqlSession.selectOne(NAMESPACE + "selectByClassNo", class_no);
		System.out.println("ProgramDao, selectByClassNo, programVo:" + programVo);
		return programVo;
	}
	
	// 프로그램 전체 목록
	public List<ProgramVo> selectAll(){
		List<ProgramVo> list = sqlSession.selectList(NAMESPACE + "selectAll");
		
		return list;
	}
	
	public List<ClassTimeVo> selectTimeList(){
		List<ClassTimeVo> list = sqlSession.selectList(NAMESPACE + "selectTimeList");
		
		return list;
	}
}

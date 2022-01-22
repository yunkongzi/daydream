package com.kh.daydream.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.daydream.vo.ClassTimeVo;
import com.kh.daydream.vo.ProgramListVo;
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
		ProgramVo programVo = sqlSession.selectOne(NAMESPACE + "selectProgramByClassNo", class_no);
		System.out.println("ProgramDao, selectByClassNo, programVo:" + programVo);
		return programVo;
	}
	
	// 개설된 타임 리스트 - openedTimeList
//	public List<Integer> openedTimeList()
	
	// 프로그램 전체 목록
	public List<ProgramListVo> selectProgramList(){
		List<ProgramListVo> list = sqlSession.selectList(NAMESPACE + "selectProgramList");
		
		return list;
	}
	
	// 개설된 프로그램 목록 - selectOpenedProgramList
	public List<ProgramVo> selectOpenedProgramList(){
		List<ProgramVo> list = sqlSession.selectList(NAMESPACE + "selectOpenedProgramList");
		System.out.println("ProgramDao, selectOpenedProgramList, list:" + list);
		return list;
	}
	
	// 클래스별 개설된 시간 - openedTimeList
	public List<Integer> openedTimeList(int class_no){
		List<Integer> list = sqlSession.selectList(NAMESPACE + "openedTimeList", class_no);
		
		return list;
	}
	
	public List<ClassTimeVo> selectTimeList(){
		List<ClassTimeVo> list = sqlSession.selectList(NAMESPACE + "selectTimeList");
		
		return list;
	}
	
	// 프로그램 수정 처리
	public void updateProgram(ProgramVo programVo) {
		sqlSession.update(NAMESPACE + "updateProgram", programVo); 
		
	}
	
	// 프로그램 삭제 처리
	public void deleteProgram(int class_no) {
		sqlSession.delete(NAMESPACE + "deleteProgram", class_no);
	}
	
	// 프로그램 상세 페이지로 넘기기
	public ProgramVo contentDetail(int class_no) {
		ProgramVo programVo = sqlSession.selectOne(NAMESPACE + "contentDetail", class_no);
		return programVo;
	}
	

	
}

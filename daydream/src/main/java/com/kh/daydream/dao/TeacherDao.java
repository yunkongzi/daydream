package com.kh.daydream.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.daydream.vo.TeacherVo;

@Repository
public class TeacherDao {
	private static final String NAMESPACE = "com.kh.daydream.mappers.teacher.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 회원 추가
	public void insertTeacher(TeacherVo teacherVo) {
		sqlSession.insert(NAMESPACE + "insertMember", teacherVo);
	}
	
	// 회원 정보 보기
	public TeacherVo selectByTno(String tno) {
		TeacherVo teacherVo = sqlSession.selectOne(
				NAMESPACE + "selectByTno", tno);
		return teacherVo;
	}
	
	// 회원 전체 목록
	public List<TeacherVo> selectAll() {
		// java.util.List
		List<TeacherVo> list = sqlSession.selectList(NAMESPACE + "selectAll");
		return list;
	}
	
	// 회원 정보 수정
	public void updateTeacher(TeacherVo teacherVo) {
		sqlSession.update(NAMESPACE + "updateTeacher", teacherVo);
	}
	
	// 회원 정보 삭제
	public void deleteTeacher(String tno) {
		sqlSession.delete(NAMESPACE + "deleteTeacher", tno);
	}

}
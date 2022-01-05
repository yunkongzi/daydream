package com.kh.daydream.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.daydream.vo.MemberVo;

@Repository
public class MemberDao {
	private static final String NAMESPACE =
			"com.kh.daydream.mappers.member.";
	
	@Inject
	private SqlSession sqlSession;
	
	//회원 추가
	public void insertMember(MemberVo memberVo) {
		sqlSession.insert(NAMESPACE + "insertMember", memberVo);
	}
	
	//아이디 중복 확인
	public int checkDupId(String user_id) {
		int count = sqlSession.selectOne(NAMESPACE + "checkDupId", user_id);
		return count;
	}
	
	// 로그인
		public MemberVo login(String user_id, String user_pw) {
			Map<String, String> paramMap = new HashMap<>();
			paramMap.put("user_id", user_id);
			paramMap.put("user_pw", user_pw);
			MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "login", paramMap);
			return memberVo;
		}

}

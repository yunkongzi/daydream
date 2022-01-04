package com.kh.daydream.dao;

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

}

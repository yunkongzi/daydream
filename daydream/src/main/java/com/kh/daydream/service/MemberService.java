package com.kh.daydream.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.daydream.dao.MemberDao;
import com.kh.daydream.vo.MemberVo;

@Service
public class MemberService {
	
	@Inject
	private MemberDao memberDao;
	
	//회원 추가
	public void insertMember(MemberVo memberVo) {
		memberDao.insertMember(memberVo);
	}
	
	//아이디 중복확인
	public int checkDupId(String user_id) {
		int count = memberDao.checkDupId(user_id);
		return count;
	}
	
	// 로그인
		public MemberVo login(String user_id, String user_pw) {
			MemberVo memberVo = memberDao.login(user_id, user_pw);
			return memberVo;
		}

	
}

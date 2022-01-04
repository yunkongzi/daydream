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

	
}

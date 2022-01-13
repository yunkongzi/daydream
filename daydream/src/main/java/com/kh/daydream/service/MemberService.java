package com.kh.daydream.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.daydream.dao.MemberDao;
import com.kh.daydream.vo.MemberVo;
import com.kh.daydream.vo.MyReservationVo;

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

		// 리뷰 리스트 
		public List<MyReservationVo> reservationList(String user_id) {
			List<MyReservationVo> list = memberDao.reservationList(user_id);
			return list;
		}
		
	//회원 정보 수정
		public void updateMember(MemberVo memberVo) {
			memberDao.updateMember(memberVo);
		}
		
	//회원 탈퇴
		public void deleteMember(String user_id) {
			memberDao.deleteMember(user_id);
		}
}

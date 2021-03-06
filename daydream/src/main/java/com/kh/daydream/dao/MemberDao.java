package com.kh.daydream.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.daydream.vo.MemberVo;
import com.kh.daydream.vo.MyReservationVo;
import com.kh.daydream.vo.ReviewVo;
import com.kh.daydream.vo.TeacherVo;

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
		
	//마이페이지 예약현황
		// 리뷰 리스트
		public List<MyReservationVo> reservationList(String user_id) {
			List<MyReservationVo> list = sqlSession.selectList(NAMESPACE + "reservationList", user_id);
			return list;
		}
		
		// 후기 리스트
		public List<ReviewVo> myReviewList(String user_id) {
			List<ReviewVo> list = sqlSession.selectList(NAMESPACE + "myReviewList", user_id);
			return list;
		}
		
		// 강사지원 리스트
		public List<TeacherVo> myTeacherList(String user_id) {
			List<TeacherVo> list = sqlSession.selectList(NAMESPACE + "myTeacherList", user_id);
			return list;
		}
		
	//회원정보 수정
		public void updateMember(MemberVo memberVo) {
			sqlSession.update(NAMESPACE + "updateMember", memberVo);
		}
		
	//회원 탈퇴
		public void deleteMember(String user_id) {
			sqlSession.delete(NAMESPACE + "deleteMember", user_id);
		}
		
	//예약취소
		public void deleteReservation(int rno) {
			sqlSession.delete(NAMESPACE+"deleteReservation",rno);
		}
}

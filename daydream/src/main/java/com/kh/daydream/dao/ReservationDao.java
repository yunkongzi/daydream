package com.kh.daydream.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.daydream.vo.ReservationListVo;
import com.kh.daydream.vo.ReservationTimeVo;
import com.kh.daydream.vo.ReservationVo;
import com.kh.daydream.vo.StatusVo;

@Repository
public class ReservationDao {

	private static final String NAMESPACE = "com.kh.daydream.mappers.reservation.";

	@Inject
	private SqlSession sqlSession;

	// 예약등록
	public void insertReservation(ReservationVo reservationVo) {
		sqlSession.insert(NAMESPACE + "insertReservation", reservationVo);
	}

	// 클래스 시간 목록
	public List<ReservationTimeVo> selectTimeList(int class_no) {
		List<ReservationTimeVo> timelist = sqlSession.selectList(NAMESPACE + "selectTimeList", class_no);
		return timelist;
	}

	// 예약 번호
	public int getRnoNextVal() {
		int rno = sqlSession.selectOne(NAMESPACE + "getRnoNextVal");
		return rno;
	}

	public List<ReservationListVo> selectAll() {
		
		List<ReservationListVo> list = sqlSession.selectList(NAMESPACE+"reservationList");
		System.out.println("ReservationDao, selectAll, list: " + list);
		return list;
	}
	
//	// 예약 수정
//	public void updateReservation(ReservationListVo reservationListVo) {
//		sqlSession.update(NAMESPACE+"updateReservation"+reservationListVo);
//		return;
//	}

	// 예약 삭제
	public void deleteReservation(int rno) {
		sqlSession.delete(NAMESPACE+"deleteReservation", rno);
		return;
	}
	
	// 상태 코드 리스트
	public List<StatusVo> statusList() {
		return sqlSession.selectList(NAMESPACE+"statusList");
	}
	//상태수정
	public void updateStatus(int rno, String status_code) {
		Map<String, Object> map = new HashMap<>();
		map.put("rno", rno);
		map.put("status_code", status_code);
		sqlSession.update(NAMESPACE+"updateStatus",map);
		
	}

}

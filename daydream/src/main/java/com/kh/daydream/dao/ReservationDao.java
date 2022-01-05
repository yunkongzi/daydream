package com.kh.daydream.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.kh.daydream.vo.ReservationVo;

@Repository
public class ReservationDao {
	
	private static final String NAMESPACE = "com.kh.daydream.mappers.reservation.";

	@Inject
	private SqlSession sqlSession;

	//예약등록
	public void insertReservation(ReservationVo reservationVo) {
		sqlSession.insert(NAMESPACE + "insertReservation", reservationVo);
	}
}

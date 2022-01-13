package com.kh.daydream.dao;




import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.daydream.vo.ClassTimeVo;
import com.kh.daydream.vo.ReservationTimeVo;
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
	//클래스 시간 목록
	public List<ReservationTimeVo> selectTimeList(int class_no) {
		List<ReservationTimeVo> list = sqlSession.selectList(NAMESPACE + "selectTimeList", class_no);
		return list;
	}
	
	
	
	


}

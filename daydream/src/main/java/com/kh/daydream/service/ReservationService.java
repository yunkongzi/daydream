package com.kh.daydream.service;




import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.daydream.dao.ReservationDao;
import com.kh.daydream.vo.ReservationTimeVo;
import com.kh.daydream.vo.ReservationVo;

@Service
public class ReservationService {
	
	@Inject
	private ReservationDao reservationDao;
	//예약등록
	public void insertReservation(ReservationVo reservationVo) {
		reservationDao.insertReservation(reservationVo);
	}
	
	//클래스 시간 목록
	public List<ReservationTimeVo> selectTimeList(int class_no) {
		List<ReservationTimeVo> list = reservationDao.selectTimeList(class_no);
		return list;
	}
	
}

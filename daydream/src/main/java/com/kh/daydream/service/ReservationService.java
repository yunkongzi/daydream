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
		List<ReservationTimeVo> timeList = reservationDao.selectTimeList(class_no);
		return timeList;
	}
	//예약자 목록
	public List<ReservationVo> resvList(String user_id, String finish) {
		List<ReservationTimeVo> resvList = reservationDao.resvList(user_id);
		return null;
	}
	
}

package com.kh.daydream.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.daydream.dao.ReservationDao;
import com.kh.daydream.vo.ReservationVo;

@Service
public class ReservationService {
	
	@Inject
	private ReservationDao reservationDao;
	//예약등록
	public void insertReservation(ReservationVo reservationVo) {
		reservationDao.insertReservation(reservationVo);
	}
	/*//클래스 목록
	public List<ReservationVo> classList(int class_no) {
		List<ReservationVo> list = reservationDao.classList(class_no);
		System.out.println("ReservationDao, classList, list" + list);
		return null;
	}*/
}

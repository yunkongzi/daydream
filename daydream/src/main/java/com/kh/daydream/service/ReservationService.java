package com.kh.daydream.service;

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
}

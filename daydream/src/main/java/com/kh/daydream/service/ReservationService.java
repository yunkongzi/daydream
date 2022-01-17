package com.kh.daydream.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.daydream.dao.ReservationDao;

import com.kh.daydream.vo.ProgramListVo;
import com.kh.daydream.vo.ProgramVo;
import com.kh.daydream.vo.ReservationListVo;

import com.kh.daydream.vo.ReservationTimeVo;
import com.kh.daydream.vo.ReservationVo;

@Service
public class ReservationService {

	@Inject
	private ReservationDao reservationDao;

	// 예약등록
	public void insertReservation(ReservationVo reservationVo) {
		int rno = reservationDao.getRnoNextVal();
		reservationVo.setRno(rno);
		reservationDao.insertReservation(reservationVo);
	}

	// 클래스 시간 목록
	public List<ReservationTimeVo> selectTimeList(int class_no) {
		List<ReservationTimeVo> timelist = reservationDao.selectTimeList(class_no);
		return timelist;
	}

//	//예약 현황
//	public List<ReservationListVo> reservationList() {
//		List<ReservationListVo> allList = reservationDao.reservationList();
//		return allList;
//	}
	//예약 수정
	public void updateReservation(ReservationVo reservationVo) {

		return;
	}
	//예약 삭제
	public void deleteReservation(int class_no) {

		return;
	}



	

}

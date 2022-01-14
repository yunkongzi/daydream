package com.kh.daydream.service;




import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.daydream.dao.ReservationDao;
import com.kh.daydream.vo.ProgramListVo;
import com.kh.daydream.vo.ProgramVo;
import com.kh.daydream.vo.ReservationTimeVo;
import com.kh.daydream.vo.ReservationVo;

@Service
public class ReservationService {
	
	@Inject
	private ReservationDao reservationDao;
	//예약등록
	public void insertReservation(ReservationVo reservationVo) {
		int rno = reservationDao.getRnoNextVal(); // seq_rno.nextval
		reservationVo.setRno(rno);
		reservationDao.insertReservation(reservationVo);
	}
	
	//클래스 시간 목록
	public List<ReservationTimeVo> selectTimeList(int class_no) {
		List<ReservationTimeVo> timeList = reservationDao.selectTimeList(class_no);
		return timeList;
	}
	public List<ReservationVo> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	

	public ProgramVo selectByClassNo(int class_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateReservation(ReservationVo reservationVo) {
		
		return;
	}

	public void deleteReservation(int class_no) {
		
		return;
	}

	


	
}

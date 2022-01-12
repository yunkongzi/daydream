package com.kh.daydream.vo;

import java.util.Arrays;

public class ReservationVo {
	private String user_id;
	private String res_date;
	private int[] time_no;
	private int rno;
	private int class_sub_no;
	private int count;
	private String status;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getClass_sub_no() {
		return class_sub_no;
	}

	public void setClass_sub_no(int class_sub_no) {
		this.class_sub_no = class_sub_no;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int[] getTime_no() {
		return time_no;
	}

	public void setTime_no(int[] time_no) {
		this.time_no = time_no;
	}

	@Override
	public String toString() {
		return "ReservationVo [user_id=" + user_id + ", res_date=" + res_date + ", time_no=" + Arrays.toString(time_no)
				+ ", rno=" + rno + ", class_sub_no=" + class_sub_no + ", count=" + count + ", status=" + status + "]";
	}

	

	
}

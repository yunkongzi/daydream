package com.kh.daydream.vo;

public class ReservationVo {
	private String user_id;
	private String res_date;
	private int rno;
	private int class_no;
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
	public int getClass_no() {
		return class_no;
	}
	public void setClass_no(int class_no) {
		this.class_no = class_no;
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
	@Override
	public String toString() {
		return "ReservationVo [user_id=" + user_id + ", res_date=" + res_date + ", rno=" + rno + ", class_no="
				+ class_no + ", count=" + count + ", status=" + status + "]";
	}

	

}

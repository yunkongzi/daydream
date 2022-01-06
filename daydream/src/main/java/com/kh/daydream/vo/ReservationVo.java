package com.kh.daydream.vo;



public class ReservationVo {
	private String user_id;
	private String user_name;
	private String user_phone;
	private String class_name;
	private String res_time;
	private String res_date;
	private int rno;
	private int class_no;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getRes_time() {
		return res_time;
	}
	public void setRes_time(String res_time) {
		this.res_time = res_time;
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
	@Override
	public String toString() {
		return "ReservationVo [user_id=" + user_id + ", user_name=" + user_name + ", user_phone=" + user_phone
				+ ", class_name=" + class_name + ", res_time=" + res_time + ", res_date=" + res_date + ", rno=" + rno
				+ ", class_no=" + class_no + "]";
	}

	

	


}

package com.kh.daydream.vo;

public class ReservationListVo {
	private int rno;
	private String user_id;
	private String res_date;
	private String user_name;
	private String user_phone;
	private int class_no;
	private String class_name;
	private int count;
	private int status;
	private String status_name;
	private int program_time;
	private int time_no;
	private String time_start;
	private String time_end;

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

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

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getTime_no() {
		return time_no;
	}

	public void setTime_no(int time_no) {
		this.time_no = time_no;
	}

	public String getTime_start() {
		return time_start;
	}

	public void setTime_start(String time_start) {
		this.time_start = time_start;
	}

	public String getTime_end() {
		return time_end;
	}

	public void setTime_end(String time_end) {
		this.time_end = time_end;
	}

	public int getProgram_time() {
		return program_time;
	}

	public void setProgram_time(int program_time) {
		this.program_time = program_time;
	}

	@Override
	public String toString() {
		return "ReservationListVo [rno=" + rno + ", user_id=" + user_id + ", res_date=" + res_date + ", user_name="
				+ user_name + ", user_phone=" + user_phone + ", class_no=" + class_no + ", class_name=" + class_name
				+ ", count=" + count + ", status=" + status + ", status_name=" + status_name + ", program_time="
				+ program_time + ", time_no=" + time_no + ", time_start=" + time_start + ", time_end=" + time_end + "]";
	}

}

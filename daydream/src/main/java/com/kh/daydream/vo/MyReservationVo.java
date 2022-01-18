package com.kh.daydream.vo;

public class MyReservationVo {
	private int rno;
	private String res_date;
	private String class_name;
	private String program_time;
	private String count;
	private String status;
	private String class_no;
	private String status_name;

	public MyReservationVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MyReservationVo(int rno, String res_date, String class_name, String program_time, String count,
			String status, String class_no, String status_name) {
		super();
		this.rno = rno;
		this.res_date = res_date;
		this.class_name = class_name;
		this.program_time = program_time;
		this.count = count;
		this.status = status;
		this.class_no = class_no;
		this.status_name = status_name;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getProgram_time() {
		return program_time;
	}

	public void setProgram_time(String program_time) {
		this.program_time = program_time;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getClass_no() {
		return class_no;
	}

	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	@Override
	public String toString() {
		return "MyReservationVo [rno=" + rno + ", res_date=" + res_date + ", class_name=" + class_name
				+ ", program_time=" + program_time + ", count=" + count + ", status=" + status + ", class_no="
				+ class_no + ", status_name=" + status_name + "]";
	}

}

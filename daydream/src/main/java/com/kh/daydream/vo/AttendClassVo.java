package com.kh.daydream.vo;

public class AttendClassVo {
	private String user_id;
	private String res_date;
	private String class_name;
	private String program_time;
	private String status;
	private String class_no;

	/**
	 * 
	 */
	public AttendClassVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param user_id
	 * @param res_date
	 * @param class_name
	 * @param program_time
	 * @param status
	 * @param class_no
	 */
	public AttendClassVo(String user_id, String res_date, String class_name, String program_time, String status,
			String class_no) {
		super();
		this.user_id = user_id;
		this.res_date = res_date;
		this.class_name = class_name;
		this.program_time = program_time;
		this.status = status;
		this.class_no = class_no;
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

	@Override
	public String toString() {
		return "AttendClassVo [user_id=" + user_id + ", res_date=" + res_date + ", class_name=" + class_name
				+ ", program_time=" + program_time + ", status=" + status + ", class_no=" + class_no + "]";
	}

}

package com.kh.daydream.vo;

import java.sql.Timestamp;

public class Teacher {

	private String tno;
	private String gender;
	private String user_phone;
	private String address;
	private Timestamp joindate;
	private String content;
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Timestamp getJoindate() {
		return joindate;
	}
	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Teacher [tno=" + tno + ", gender=" + gender + ", user_phone=" + user_phone + ", address=" + address
				+ ", joindate=" + joindate + ", content=" + content + "]";
	}
}

package com.kh.daydream.vo;

import java.sql.Timestamp;

public class NoticeVo {

	private int bno;
	private String title;
	private String content;
	private String user_id;
	private Timestamp regdate;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "NoticeVo [bno=" + bno + ", title=" + title + ", content=" + content + ", user_id=" + user_id
				+ ", regdate=" + regdate + "]";
	}

}

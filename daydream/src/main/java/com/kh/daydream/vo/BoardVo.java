package com.kh.daydream.vo;

import java.sql.Timestamp;

public class BoardVo {

	private int bno;
	private String user_id;
	private String title;
	private String content;
	private Timestamp regdate;
	private int viewcnt;

	public BoardVo() {
		super();
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public BoardVo(int bno, String user_id, String title, String content, Timestamp regdate, int viewcnt) {
		super();
		this.bno = bno;
		this.user_id = user_id;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
	}

	@Override
	public String toString() {
		return "BoardVo [bno=" + bno + ", user_id=" + user_id + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + "]";
	}

}

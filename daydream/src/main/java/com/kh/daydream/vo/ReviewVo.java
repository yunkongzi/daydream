package com.kh.daydream.vo;

import java.sql.Timestamp;
import java.util.Arrays;

public class ReviewVo {

	private int bno;
	private String user_id;
	private String title;
	private String content;
	private Timestamp regdate;
	private int viewcnt;
	private int class_no;
	private String[] files;

	public ReviewVo() {
		super();
	}

	/**
	 * @param bno
	 * @param user_id
	 * @param title
	 * @param content
	 * @param regdate
	 * @param viewcnt
	 * @param class_no
	 */
	public ReviewVo(int bno, String user_id, String title, String content, Timestamp regdate, int viewcnt,
			int class_no) {
		super();
		this.bno = bno;
		this.user_id = user_id;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
		this.class_no = class_no;
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

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	@Override
	public String toString() {
		return "ReviewVo [bno=" + bno + ", user_id=" + user_id + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", class_no=" + class_no + ", files="
				+ Arrays.toString(files) + "]";
	}

}

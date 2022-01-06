package com.kh.daydream.vo;

public class ClassTimeVo {
	private int time_no;
	private String time_start;
	private String time_end;

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

	@Override
	public String toString() {
		return "ClassTimeVo [time_no=" + time_no + ", time_start=" + time_start + ", time_end=" + time_end + "]";
	}

}

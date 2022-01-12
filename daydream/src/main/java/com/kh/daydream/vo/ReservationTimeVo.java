package com.kh.daydream.vo;

public class ReservationTimeVo {
	private int time_no;
	private String time_start;
	private String time_end;
	private int remain_count;

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

	public int getRemain_count() {
		return remain_count;
	}

	public void setRemain_count(int remain_count) {
		this.remain_count = remain_count;
	}

	@Override
	public String toString() {
		return "ReservationTimeVo [time_no=" + time_no + ", time_start=" + time_start + ", time_end=" + time_end
				+ ", ramain_count=" + remain_count + "]";
	}

}

package com.kh.daydream.vo;

public class StatusVo {
	private int status_code;
	private String status_name;
	
	public StatusVo() {
		super();
	}

	public StatusVo(int status_code, String status_name) {
		super();
		this.status_code = status_code;
		this.status_name = status_name;
	}

	public int getStatus_code() {
		return status_code;
	}

	public void setStatus_code(int status_code) {
		this.status_code = status_code;
	}

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	@Override
	public String toString() {
		return "StatusVo [status_code=" + status_code + ", status_name=" + status_name + "]";
	}
	
	
	
}

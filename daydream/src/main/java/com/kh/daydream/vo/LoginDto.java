package com.kh.daydream.vo;


public class LoginDto {
	private String user_id;
	private String user_pw;
	private String save_Id;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getSave_Id() {
		return save_Id;
	}
	public void setSave_Id(String save_Id) {
		this.save_Id = save_Id;
	}
	@Override
	public String toString() {
		return "LoginDto [user_id=" + user_id + ", user_pw=" + user_pw + ", save_Id=" + save_Id + "]";
	}

	
}

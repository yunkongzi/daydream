package com.kh.daydream.vo;

public class TeacherMemberVo {
	private String user_id;
	private String user_name;
	private String tno;
	private String class_name;
	private String price;
	private String personnel;
	private String target;
	private String user_phone;
	private String certificate;
	private String introduce;
	private String status;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getTno() {
		return tno;
	}

	public void setTno(String tno) {
		this.tno = tno;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPersonnel() {
		return personnel;
	}

	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "TeacherMemberVo [user_id=" + user_id + ", user_name=" + user_name + ", tno=" + tno + ", class_name="
				+ class_name + ", price=" + price + ", personnel=" + personnel + ", target=" + target + ", user_phone="
				+ user_phone + ", certificate=" + certificate + ", introduce=" + introduce + ", status=" + status + "]";
	}
}

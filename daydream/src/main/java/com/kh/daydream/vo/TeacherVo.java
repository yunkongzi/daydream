package com.kh.daydream.vo;

import java.sql.Timestamp;

public class TeacherVo {
 
	private String tno;
	private String class_name;
	private String price;
	private String personnel;
	private String target;
	private String introduce;
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
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	@Override
	public String toString() {
		return "Teacher [tno=" + tno + ", class_name=" + class_name + ", price=" + price + ", personnel=" + personnel
				+ ", target=" + target + ", introduce=" + introduce + "]";
	}
}
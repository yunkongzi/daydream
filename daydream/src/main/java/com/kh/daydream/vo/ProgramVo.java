package com.kh.daydream.vo;

public class ProgramVo {
	
	private String class_name;
	private String price;
	private String target;
	private String personnel;
	private String class_intro;
	private int class_no;
	private int status;
	
	public ProgramVo() {
		super();
	}

	public ProgramVo(String class_name, String price, String target, String personnel, String class_intro, int class_no,
			int status) {
		super();
		this.class_name = class_name;
		this.price = price;
		this.target = target;
		this.personnel = personnel;
		this.class_intro = class_intro;
		this.class_no = class_no;
		this.status = status;
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

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getPersonnel() {
		return personnel;
	}

	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}

	public String getClass_intro() {
		return class_intro;
	}

	public void setClass_intro(String class_intro) {
		this.class_intro = class_intro;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ProgramVo [class_name=" + class_name + ", price=" + price + ", target=" + target + ", personnel="
				+ personnel + ", class_intro=" + class_intro + ", class_no=" + class_no + ", status=" + status + "]";
	}


}
package com.kh.daydream.vo;

public class ProgramVo {

	private String class_name;
	private int price;
	private String target;
	private int personnel;
	private String class_intro;
	
	public ProgramVo() {
		super();
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public int getPersonnel() {
		return personnel;
	}

	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}

	public String getClass_intro() {
		return class_intro;
	}

	public void setClass_intro(String class_intro) {
		this.class_intro = class_intro;
	}

	@Override
	public String toString() {
		return "Program [class_name=" + class_name + ", price=" + price + ", target=" + target + ", personnel="
				+ personnel + ", class_intro=" + class_intro + "]";
	}
	
	
	
	
}
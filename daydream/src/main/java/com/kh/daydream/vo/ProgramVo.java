package com.kh.daydream.vo;

import java.util.Arrays;

public class ProgramVo {
	
	private String class_name;
	private String price;
	private String target;
	private String personnel;
	private String class_intro;
	private int class_no;
	private int[] time_no;
	private String file_image;
	private String class_content;
	


	public ProgramVo() {
		super();
	}
	
	

	public ProgramVo(String class_name, String price, String target, String personnel, String class_intro, int class_no,
			int[] time_no, String file_image, String class_content) {
		super();
		this.class_name = class_name;
		this.price = price;
		this.target = target;
		this.personnel = personnel;
		this.class_intro = class_intro;
		this.class_no = class_no;
		this.time_no = time_no;
		this.file_image = file_image;
		this.class_content = class_content;
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

	public int[] getTime_no() {
		return time_no;
	}

	public void setTime_no(int[] time_no) {
		this.time_no = time_no;
	}
	

	public String getFile_image() {
		return file_image;
	}

	public void setFile_image(String file_image) {
		this.file_image = file_image;
	}
	
	public String getClass_content() {
		return class_content;
	}

	public void setClass_content(String class_content) {
		this.class_content = class_content;
	}



	@Override
	public String toString() {
		return "ProgramVo [class_name=" + class_name + ", price=" + price + ", target=" + target + ", personnel="
				+ personnel + ", class_intro=" + class_intro + ", class_no=" + class_no + ", time_no="
				+ Arrays.toString(time_no) + ", file_image=" + file_image + ", class_content=" + class_content + "]";
	}








	

	


}
package com.kh.daydream.controller;

import java.io.FileInputStream;
import java.io.IOException;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.daydream.util.MyFileUploadUtil;

@Controller
@RequestMapping("/upload")
public class UploadController {

	private static final String UPLOAD_PATH = "//192.168.0.80/reviewpic";
	
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String fileName) throws Exception {
		// 서버의 파일을 다운로드하기 위한 스트림
		System.out.println("UploadController, displayFile, fileName: " + fileName);
		int slashIndex = fileName.lastIndexOf("/");
		String front = fileName.substring(0, slashIndex + 1);
		String rear = fileName.substring(slashIndex + 1);
		FileInputStream fis = new FileInputStream(
				UPLOAD_PATH + front + "sm_" + rear);
		byte[] bytes = IOUtils.toByteArray(fis);
		return bytes;
	}
	
	@RequestMapping(value="/deleteFile", method=RequestMethod.GET)
	@ResponseBody
	public String deleteFile(String fileName) {
		System.out.println("UploadController, deleteFile, fileName:" + fileName);
		boolean result = MyFileUploadUtil.deleteFile(UPLOAD_PATH + fileName);
		if (result == true) {
			return "success";
		}
		return "fail";
	}
}

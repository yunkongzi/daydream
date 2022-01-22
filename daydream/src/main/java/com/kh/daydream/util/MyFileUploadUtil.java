package com.kh.daydream.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.IOUtils;
import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class MyFileUploadUtil {
	
	public static String uploadFile(
			String uploadPath, 
			String originalName, byte[] fileData) {
		UUID uuid = UUID.randomUUID();
		String datePath = calcPath(uploadPath);
		// -> D:/upload/2022/01/07
		String filePath = datePath + "/" + uuid + "_" + originalName;
		// -> D:/upload/2022/01/07/(uuid)_smile.jpg
		File target = new File(filePath);
		try {
			FileCopyUtils.copy(fileData, target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return filePath;
	}

	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int date = cal.get(Calendar.DATE);

		String dateString = year + "/" + month + "/" + date;
		// -> 2022/01/07
		String datePath = uploadPath + "/" + dateString;

		File f = new File(datePath);
		if (!f.exists()) {
			f.mkdirs();
		}

		return datePath;
	}

	public static boolean makeThumbnail(String filePath) {
		int slashIndex = filePath.lastIndexOf("/");
		String front = filePath.substring(0, slashIndex + 1);
		String rear = filePath.substring(slashIndex + 1);
		String thumbnailPath = front + "sm_" + rear;

		// 원본 이미지에 대한 파일 객체
		File orgFile = new File(filePath);
		System.out.println("orgFile:" + orgFile);
		// 썸네일 이미지에 대한 파일 객체
		File thumbFile = new File(thumbnailPath);
		System.out.println("thumbFile:" + thumbFile);

		// 원본이미지를 메모리에 로딩해서 작은 이미지로 변환(메모리에서)
		// 메모리의 작은이미지를 파일로 저장
		// java.awt.BufferedImage, javax.imageio.ImageIO
		try {
			BufferedImage srcImage = ImageIO.read(orgFile);
			// org.imgscalr.Scalr
			BufferedImage descImage = Scalr.resize(
					srcImage, 
					Scalr.Method.AUTOMATIC, 
					Scalr.Mode.FIT_TO_HEIGHT, 
					100); 
																														
			ImageIO.write(descImage, getExtName(rear), thumbFile);

		} catch (Exception e) {
			// e.printStackTrace();
			return false;
		}
		return true;
	}

	private static String getExtName(String fileName) {
		// uuid_name.jpg -> JPG
		int dotIndex = fileName.lastIndexOf(".");
		String extName = fileName.substring(dotIndex + 1);
		return extName.toUpperCase();
	}

	public static boolean isImage(String fileName) {
		String extName = getExtName(fileName);
		if (extName.equals("JPG") || 
				extName.equals("PNG") || 
				extName.equals("GIF")) {
			return true;
		}
		return false;
	}

	public static String getShortName(String filename) {
		// /2021/12/28/60eaf495-4941-432b-b4f9-9eee65c25d0f_1.png
		int underIndex = filename.lastIndexOf("_");
		String shortName = filename.substring(underIndex + 1);
		return shortName;

	}

	public static boolean deleteFile(String fileName) {
		File f = new File(fileName);
		if (f.exists()) {
			f.delete();
			System.out.println("삭제");
			if (isImage(fileName)) {
				String thumbnailPath = getThumbnailPath(fileName);
				File f2 = new File(thumbnailPath);
				if (f2.exists()) {
					while (true) {
						boolean b = f2.delete();
						System.out.println("썸삭제");
						if (b == true) {
							break;
						}

						try {
							Thread.sleep(1000);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					}
				}
			}
			return true;
		}

		return false;

	}

	private static String getThumbnailPath(String filePath) {
		int slashIndex = filePath.lastIndexOf("/");
		String front = filePath.substring(0, slashIndex + 1);
		String rear = filePath.substring(slashIndex + 1);
		String thumbnailPath = front + "sm_" + rear;
		return thumbnailPath;
	}
	
	public static byte[] displayImage(String uploadPath, String fileName) throws Exception {
		// 서버의 파일을 다운로드하기 위한 스트림
		System.out.println("UploadController, displayFile, fileName: " + fileName);
		int slashIndex = fileName.lastIndexOf("/");
		String front = fileName.substring(0, slashIndex + 1);
		String rear = fileName.substring(slashIndex + 1);
		FileInputStream fis = new FileInputStream(
				uploadPath + front + "sm_" + rear);
		byte[] bytes = IOUtils.toByteArray(fis);
		return bytes;
	}

} // class
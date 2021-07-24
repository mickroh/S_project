package com.care.root.board.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class BoardFileServiceImpl implements BoardFileService{
	public String getMessage(int num, HttpServletRequest req) {
		String path = req.getContextPath();
		String message = null;
		if(num == 1) {
			message = "<script>alert('새글이 추가되었습니다');";
			message += "location.href='"+path+"/board/boardAllList';</script>";
		} else {
			message = "<script>alert('문제가 발생했습니다!');";
			message += "location.href='"+path+"/board/boardwriteForm';</script>";
		}
		return message;
	}
	public String saveFile(MultipartFile file) {
		SimpleDateFormat simple = new SimpleDateFormat("yyyyMMddHHmmss-");
		Calendar calendar = Calendar.getInstance();
		String sysFileName = simple.format(calendar.getTime()) + file.getOriginalFilename();
		File saveFile = new File(IMAGE_REPO + "/" + sysFileName);
		try {
			file.transferTo(saveFile); //해당 위치에 파일 저장
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return sysFileName;
	}
	public String getMessage(String msg, String path) {
		return "<script>alert('"+msg+"'); location.href='"+path+"';</script>";
	}
	public void deleteImage(String fileName) {
		File deleteFile = new File(IMAGE_REPO +"/" + fileName);
		deleteFile.delete();
	}
}

package com.care.root.board.controller;

import java.io.File;
import java.io.FileInputStream;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.service.BoardFileService;
import com.care.root.board.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired BoardService bs;
	@RequestMapping("boardAllList")
	public String selectAllBoardList(Model model,
			@RequestParam(value="num", required=false, defaultValue="1")int num) {
		bs.selectAllBoardList(model, num);
		
		return "board/boardAllList";
	}
	@RequestMapping("writeForm")
	public String writeFrom(){
		return "board/writeForm";
	}
	@PostMapping("writeSave")
	public void writeSave(MultipartHttpServletRequest mul, 
			HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		String messasge = bs.writeSave(mul, request);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(messasge);
	}
	@GetMapping("contentView")
	public String contentView(@RequestParam int writeNo, Model model) {
		bs.contentView(writeNo, model);
		return "board/contentView";
	}
	@GetMapping("download")
	public void download(@RequestParam String imageFileName, 
						 HttpServletResponse response) throws Exception {
		response.addHeader("content-disposition", "attachment;imageFileName="+imageFileName);
		File file = new File(BoardFileService.IMAGE_REPO+"/"+imageFileName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	@GetMapping("modify_form")
	public String modify_form(@RequestParam int writeNo, Model model) {
		bs.contentView(writeNo, model);
		return "board/modify_form";
	}
	@PostMapping("modify")
	public void modify(MultipartHttpServletRequest mul, 
						HttpServletResponse response,
						HttpServletRequest request)throws Exception {
		String message = bs.modify(mul, request);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
		out.close();
	}
	@GetMapping("delete")
	public void boardDelete(@RequestParam int writeNo, 
							@RequestParam String imageFileName,
							HttpServletResponse response,
							HttpServletRequest request)throws Exception{
		String message = bs.boardDelete(writeNo, imageFileName, request);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
	}
}

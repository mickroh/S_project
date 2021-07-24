package com.care.root.board.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.dto.BoardDTO;
import com.care.root.board.dto.BoardRepDTO;
import com.care.root.member.session_name.MemberSessionName;
import com.care.root.mybatis.board.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired BoardMapper mapper;
	public String selectAllBoardList(Model model, int num) {
		int pageLetter = 5; //한 페이지 몇개의 글을 보여줄지
		int allCount = mapper.selectBoardCount();
		int repeat = allCount / pageLetter;
		if (allCount / pageLetter != 0) {
			repeat += 1;
		}
		
		int end = num * pageLetter; 
		int start = end + 1 - pageLetter; 
		
		model.addAttribute("num",num);
		model.addAttribute("repeat",repeat);
		
		model.addAttribute("boardList", mapper.selectAllBoardList(start,end));
		
		return "board/boardAllList";
	}
	
	public String writeSave(MultipartHttpServletRequest mul, 
			HttpServletRequest request) {
		BoardDTO dto = new BoardDTO();
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		HttpSession session = request.getSession();
		dto.setId((String)session.getAttribute(MemberSessionName.LOGIN));
		MultipartFile file = mul.getFile("image_file_name");
		BoardFileService bfs = new BoardFileServiceImpl();
		if(file.getSize() != 0) {
			dto.setImageFileName(bfs.saveFile(file));
		}else {
			dto.setImageFileName("nan");
		}
		return bfs.getMessage(mapper.writeSave(dto), request);
	}
	public void contentView(int writeNo, Model model) {
		model.addAttribute("personalData", mapper.contentView(writeNo));
		
		upHit(writeNo);
	}
	private void upHit(int writeNo) {
		mapper.upHit(writeNo);
	}
	public String modify(MultipartHttpServletRequest mul, 
			HttpServletRequest request) {
		BoardDTO dto = new BoardDTO();
		dto.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")) );
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		
		MultipartFile file = mul.getFile("imageFileName");
		BoardFileService bfs = new BoardFileServiceImpl();
		
		if(file.getSize() != 0) {
			dto.setImageFileName(bfs.saveFile(file));
			bfs.deleteImage(mul.getParameter("originFileName"));
		} else {
			dto.setImageFileName(mul.getParameter("originFileName"));
		}
		int result = mapper.modify(dto);
		String msg = null, path = request.getContextPath();
		
		if(result == 1) {
			msg = "성공적으로 수정되었습니다";
			path += "/board/boardAllList";
		} else {
			msg = "수정중 문제가 발생했습니다";
			path += "/board/modify_form";
		}
		return bfs.getMessage(msg, path);
	}
	public String boardDelete(int writeNo, String imageFileName, 
			HttpServletRequest request) {
		BoardFileService bfs = new BoardFileServiceImpl();
		String msg = null, path = request.getContextPath();
		int result = mapper.delete(writeNo);
		
		if (result == 1) {
			bfs.deleteImage(imageFileName);
			msg = "성공적으로 삭제 되었습니다";
			path += "/board/boardAllList";
		} else {
			msg = "삭제 중 문제가 발생되었습니다!";
			path += "/board/contentView";
		}
		return bfs.getMessage(msg, path);
	}
	public void addReply(BoardRepDTO dto) {
		mapper.addReply(dto);
	}
	public List<BoardRepDTO> getRepList(int write_group) {
		return mapper.getRepList(write_group);
	}
}

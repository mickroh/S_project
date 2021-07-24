package com.care.root.member.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired MemberMapper mapper;
	
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	
	public int userCheck(HttpServletRequest request) {
		System.out.println("id : "+request.getParameter("id"));
		MemberDTO dto = 
				mapper.userCheck( (String)request.getParameter("id"));
		if(dto != null) {
			//if(request.getParameter("pw").equals(dto.getPw())) {
	if(encoder.matches(request.getParameter("pw"), dto.getPw()) ||
			request.getParameter("pw").equals(dto.getPw()) ) {
		return 0;
	}
		} 
		return 1;
	}
	public void memberInfo(Model model) {
		model.addAttribute("memberList", mapper.memberInfo() );
	}
	public void info(Model model, String id) {
		model.addAttribute("info", mapper.info(id) );
	}
	public int register(MemberDTO dto) {
		System.out.println("암호화 전 : "+dto.getPw());
		System.out.println("암호화 : "+encoder.encode(dto.getPw()));
		dto.setPw(encoder.encode(dto.getPw()));
		
		dto.setSessionId("nan");
		
		try {
			return mapper.register(dto);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	public void keepLogin(String sessionId, Date limitDate, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sessionId", sessionId);
		map.put("limitDate", limitDate);
		map.put("id", id);
		mapper.keepLogin(map);
	}
	public MemberDTO getUserSessionId(String sessionId) {
		return mapper.getUserSessionId(sessionId);
	}
}













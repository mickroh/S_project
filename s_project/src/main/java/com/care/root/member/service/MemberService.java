package com.care.root.member.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;


@Service
public interface MemberService {
	public int userCheck(HttpServletRequest request);
	public void memberInfo(Model model);
	public void info(Model model, String id);
	public int register(MemberDTO dto);
	public void keepLogin(String sessionId, Date limitDate, String id);
	public MemberDTO getUserSessionId(String sessionId);
}

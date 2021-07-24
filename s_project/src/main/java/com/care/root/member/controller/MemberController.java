package com.care.root.member.controller;

import java.sql.Date;
import java.util.Calendar;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;
import com.care.root.member.session_name.MemberSessionName;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName{
	@Autowired MemberService ms;
	@GetMapping("login")
	public String login()
	{
		return "member/login";
	}
	@PostMapping("user_check")
	public String userCheck(HttpServletRequest request, RedirectAttributes rs)
	{
		int result = ms.userCheck(request);
		if(result == 0) {
			rs.addAttribute("id",request.getParameter("id"));
			rs.addAttribute("autoLogin",request.getParameter("autoLogin"));
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
	@RequestMapping("successLogin")
	public String successLogin(@RequestParam("id") String id, 
			@RequestParam(value="autoLogin", required=false) String autoLogin, HttpServletResponse response, HttpSession session) 
	{
		session.setAttribute(LOGIN, id);
		if(autoLogin != null) {
			int limitTime = 60*60*24*90;
			Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				response.addCookie(loginCookie);
				
				Calendar cal = Calendar.getInstance();
				cal.setTime(new java.util.Date());
				cal.add(Calendar.MONTH, 3);
				Date limitDate = new Date(cal.getTimeInMillis());
				ms.keepLogin(session.getId(), limitDate, id);
		}
		return "member/successLogin";
	}
	@RequestMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response, 
			@CookieValue(value="loginCookie", required=false) Cookie loginCookie) 
	{
		if(session.getAttribute(LOGIN) != null) {
			if(loginCookie != null) {
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				ms.keepLogin("nan",
						new Date(System.currentTimeMillis()), 
						(String)session.getAttribute(LOGIN));
			}
			session.invalidate();
		}
		return "redirect:/index";
	}
	@GetMapping("memberInfo")
	public String memberInfo(Model model)
	{
		ms.memberInfo(model);
		return "member/memberInfo";
	}
	@GetMapping("info")
	public String info(@RequestParam String id, Model model) {
		ms.info(model, id);
		return "member/info";
	}
	@GetMapping("register_form")
	public String registerForm() {
		return "member/register";
	}
	@PostMapping("register")
	public String register(MemberDTO dto) {
		System.out.println(dto.getId());
		System.out.println(dto.getAddr());
		System.out.println(dto.getPw());
		int result = ms.register(dto);
		
		if (result == 1) {
			return "redirect:login";
		}
		return "redirect:register_form";
	}
	
}

package com.care.root.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.care.root.member.session_name.MemberSessionName;



public class MemberInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute(MemberSessionName.LOGIN) == null) {
			//response.sendRedirect("login");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
out.print("<script>alert('로그인이 필요합니다');location.href='member/login';</script>");
			return false;
		}
		System.out.println("prehandle 실행");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("posthandle 실행");
	}
	
}

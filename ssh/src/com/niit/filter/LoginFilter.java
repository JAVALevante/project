package com.niit.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginFilter implements HandlerInterceptor
{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception
	{
		System.out.println("afterCompletion");
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception
	{
		System.out.println("postHandle");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception
	{
		String url = request.getRequestURI();
		if (url.indexOf("login.mvc") > 0 || url.indexOf("register.mvc") > 0)
		{
			return true;
		}
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		if (name != null)
		{
			return true;

		}
		System.out.println("preHandle");
		request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
		return false;
	}

}

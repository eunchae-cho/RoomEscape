package com.sdc.escape.web.interceptor;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class AuthAdminInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest req,
														HttpServletResponse res,
														Object handler) throws Exception {
		if (req.getSession().getAttribute("loginAdmin") != null) {
					return true;
		}
			ServletContext servletContext = req.getServletContext();
			String contextRootPath = servletContext.getContextPath();
			res.sendRedirect(contextRootPath + "/admin/login");
			return false;
	}
							
}

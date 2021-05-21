package com.sdc.escape.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {
	
	FilterConfig config;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		config = filterConfig;
	}

	@Override
	public void doFilter(
			ServletRequest req,
			ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		req.setCharacterEncoding(config.getInitParameter("encoding"));
		chain.doFilter(req, res);
	}
}

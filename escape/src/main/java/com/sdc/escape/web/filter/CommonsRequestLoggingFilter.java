package com.sdc.escape.web.filter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.filter.AbstractRequestLoggingFilter;

public class CommonsRequestLoggingFilter extends AbstractRequestLoggingFilter {
	@Override
	protected boolean shouldLog(HttpServletRequest request) {
		return logger.isDebugEnabled();
	}
	
	@Override
	protected void beforeRequest(HttpServletRequest request, String message) {
		logger.debug(message);
	}
	
	@Override
	protected void afterRequest(HttpServletRequest request, String message) {
		logger.debug(message);
	}
}

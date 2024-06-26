package com.green.light.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AccessLogFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	        throws IOException, ServletException {
	    log.debug("Client의 로그: 필터를 통해서 WAS에 접속한 정보를 확인한다");
	    
	    HttpServletRequest req = (HttpServletRequest) request;
	    HttpServletResponse res = (HttpServletResponse) response;
	    
	    String remoteAddr = req.getRemoteAddr();
	    String uri = req.getRequestURI();
	    String queryString = (req.getQueryString() == null) ? "" : req.getQueryString();
	    
	    String referer = StringUtils.defaultIfEmpty(req.getHeader("Referer"), "-");
	    String agent = StringUtils.defaultIfEmpty(req.getHeader("User-Agent"), "-");
	    
	    log.debug("요청된 주소: {}", remoteAddr.concat(":").concat(uri).concat("?").concat(queryString));
	    log.debug("유입경로: {}", referer);
	    log.debug("유입소프트웨어정보: {}", agent);
	    
	    try {
	        chain.doFilter(request, response);
	    } catch (Exception e) {
	        // 500 에러가 발생하면 로그인 페이지로 리다이렉트
	        res.sendRedirect("/GreenLight"); 
	    }
	}


}

package com.green.light.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		log.info("login Success");
		
		List<String> roleNames = new ArrayList<String>();
	
		
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});

		log.info("ROLE NAME : {}", roleNames);

		// 관리자 로그인 시
		if(roleNames.contains("00")) {
			response.sendRedirect("./admin.do");
			return;
		}

		// 사용자 로그인 시
		if(roleNames.contains("01") || roleNames.contains("02")) {
			response.sendRedirect("./member.do");
			return;
		}

		response.sendRedirect("./login.do");
	}

}

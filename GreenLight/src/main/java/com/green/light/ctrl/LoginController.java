package com.green.light.ctrl;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.light.model.service.IEmployeeService;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
//	@Autowired
//	private JavaMailSender mailSender;
	
	@Autowired
	private IEmployeeService service;

	@PostMapping("/login.do")
	public String login(String id, String password, HttpSession session, Model model) {
		log.info("EmployeeController POST login.do 로그인 : {}/{}", id, password);
		Map<String, Object> map = new HashMap<String, Object>(){{
			put("id", id);
			put("password", password);
		}};
		EmployeeVo vo = service.getLogin(map);
		if(vo != null) {
			model.addAttribute("loginVo", vo);
			session.setAttribute("loginVo", vo);
			if(vo.getAuth().equals("00")) {
				log.info("관리자 로그인 성공");
				return "include/admin";
			}else {
				log.info("직원 로그인 성공");
				return "main";
			}
			
		}else {
			return "redirect:/loginForm.do";
		}
	}
	
	@GetMapping("/loginForm.do")
	public String loginForm() {
		log.info("EmployeeController GET loginForm.do 로그인 화면으로 이동");
		return "login";
	}
	
	@GetMapping("/findPassword.do")
	public String findPassword() {
		log.info("EmployeeController GET findPassword.do 비밀번호 찾기 화면으로 이동");
		return "findPassword";
	}
	
	/*
	@PostMapping("/getPassword.do")
	public String getPassword(String id, String email) {
		log.info("EmployeeController POST getPassword.do 비밀번호 찾기: {}/{}", id, email);
		Map<String, Object> map = new HashMap<String, Object>(){{
			put("id", id);
			put("email", email);
		}};
		EmployeeVo vo = service.getPassword(map);
		log.info("입력받은 vo: {}",vo);
		if(vo != null) {
			String from = "deveasy@naver.com";
			MimeMessage message = mailSender.createMimeMessage();
			
			try {
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(from);
				messageHelper.setTo(email);
				messageHelper.setSubject("[주의] 그린라이트 비밀번호");
				messageHelper.setText(vo.getPassword()+"\n", false);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			return "login";
		}else {
			return "redirect:/getPassword.do";
		}
	}*/

}

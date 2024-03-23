package com.green.light.ctrl;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
//	@Autowired
//	private JavaMailSender mailSender;
	
	@GetMapping("/main.do")
	public String login() {
		log.info("EmployeeController GET main.do 로그인 후 메인으로 이동");
		return "main";
	}
	
	@GetMapping("/admin.do")
	public String loginAdmin() {
		log.info("EmployeeController GET admin.do 로그인 후 관리자 메인으로 이동");
		return "admin";
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

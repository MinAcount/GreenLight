package com.green.light.ctrl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.light.model.service.IEmployeeService;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EmployeeController {
	
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
		return "login";
	}
}

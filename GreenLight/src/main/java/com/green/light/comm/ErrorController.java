package com.green.light.comm;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ErrorController {
	
	@GetMapping("/accessError.do")
	public String accessDenied(Authentication auth, Model model) {
		log.info("권한없음 : {}", auth);
		
		model.addAttribute("msg","권한 제한됨");
		return "accessError";
	}


}

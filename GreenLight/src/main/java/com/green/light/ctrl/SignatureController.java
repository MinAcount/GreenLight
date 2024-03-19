package com.green.light.ctrl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.light.model.service.ISignService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SignatureController {
	
	
	@Autowired
	private ISignService service;
	
	@GetMapping(value = "/signature.do")
	public String signature(Model model, HttpSession session) {
//		log.info("SignatureController GET signature 서명 리스트 loginVo = {}");
		session.getAttribute("loginVo");
		return "signature";
	}

}

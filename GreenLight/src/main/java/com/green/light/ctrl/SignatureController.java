package com.green.light.ctrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.light.model.service.ISignService;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.SignVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SignatureController {
	
	
	@Autowired
	private ISignService service;
	
	@GetMapping(value = "/signature.do")
	public String signature(Model model, HttpSession session) {
		log.info("SignatureController GET signature 서명 리스트");
		EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
	    if (loginVo == null) {
	        // loginVo가 null이면 로그인 페이지로 리다이렉트 또는 다른 처리
	        return "redirect:/";
	    }
		String id = loginVo.getId();
		List<SignVo> signlist = service.selectAllSign(id);
//		List<SignVo> signlist =service.selectAllSign(loginVo.getId());
		model.addAttribute("signlist",signlist);
		return "signature";
	}

}

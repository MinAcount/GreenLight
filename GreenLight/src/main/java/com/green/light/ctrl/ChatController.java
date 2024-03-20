package com.green.light.ctrl;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {

//	private ServletContext servletContext;
//	
//	@Autowired
//	public ChatController(ServletContext servletContext) {
//		this.servletContext = servletContext;
//	}
	
	@GetMapping(value = "/chatGroup.do")
	public String chatGroup() {
		log.info("ChatController chatGroup 그룹채팅 화면 이동");
		return "chatGroup";
	}
}










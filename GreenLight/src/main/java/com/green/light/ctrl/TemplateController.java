package com.green.light.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TemplateController {
	
	@GetMapping(value = "/templateAdd.do")
	public String templateAdd() {
		log.info("TemplateController templateAdd.do");
		return "templateAdd";
	}
	
	@GetMapping(value = "/templateList.do")
	public String templateList() {
		log.info("TemplateController templateList.do");
		return "templateList";
	}
}

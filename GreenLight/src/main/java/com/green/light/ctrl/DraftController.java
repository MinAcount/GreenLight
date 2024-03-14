package com.green.light.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DraftController {
	
	@GetMapping(value = "/draftForm.do")
	public String draftForm() {
		log.info("DraftController draftForm GET /draftForm.do");
		
		return null;
	}
}

package com.green.light.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.vo.DocumentVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DocumentController {
	
	@PostMapping(value = "/insertDocument.do")
	@ResponseBody
	public String insertDocument(@RequestParam(value = "") DocumentVo DocVo) {
		log.info("DocumentController insertDocument POST /insertDocument.do : {}", DocVo);
		
		return null;
	}
	
	@GetMapping(value = "/draftDetail.do")
	public String draftDetail() {
		return "draftDetail";
	}
}

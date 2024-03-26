package com.green.light.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.service.ITemplateService;
import com.green.light.vo.TemplateVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TemplateController {
	@Autowired
	private ITemplateService service;
	
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
	
	@GetMapping(value = "/selectMainTemplate.do")
	@ResponseBody
	public TemplateVo selectMainTemplate(@RequestParam String tempno) {
		log.info("JsTreeControllerv selectMainTemplate /selectMainTemplate.do 대표 문서양식 조회 : {}", tempno);
		TemplateVo vo = service.selectMainTemplate(tempno);
		
		return vo;
	}
}

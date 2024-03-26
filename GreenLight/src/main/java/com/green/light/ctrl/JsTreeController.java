package com.green.light.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.green.light.model.service.IJsTreeService;
import com.green.light.vo.JsTreeVo;
import com.green.light.vo.TemplateVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class JsTreeController {
	@Autowired
	private IJsTreeService service;
	
	@GetMapping(value = "/JTSelectTemplate.do")
	@ResponseBody
	public String JTSelectTemplate() {
		log.info("JsTreeControllerv JTSelectTemplate /JTSelectTemplate.do JsTree용 문서양식 조회");
		List<JsTreeVo> lists = service.JTSelectTemplate();
		Gson gson = new Gson();
		String jsonLists = gson.toJson(lists);
		
		return jsonLists;
	}
	
}

package com.green.light.ctrl;

import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.service.IFileStorageService;
import com.green.light.model.service.ISignService;
import com.green.light.model.service.ITemplateService;
import com.green.light.vo.FileStorageVo;
import com.green.light.vo.SignVo;
import com.green.light.vo.TemplateVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TemplateController {
	@Autowired
	private ITemplateService service;
	@Autowired
	private ISignService signService;
	@Autowired
	private IFileStorageService fileService;
	
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
	public ResponseEntity<?> selectMainTemplate(@RequestParam String tempno, @RequestParam(required = false) String id) {
		log.info("JsTreeControllerv selectMainTemplate /selectMainTemplate.do 대표 문서양식 조회 : {}, {}", tempno, id);
		
		Map<String, Object> map = new HashedMap<String, Object>();
		TemplateVo vo = service.selectMainTemplate(tempno);
		FileStorageVo fVo = fileService.selectTemplateImg(tempno);
		if(id != null) {
			SignVo sVo = signService.selectMainSign(id);
			map.put("sVo", sVo);
		}
		
		map.put("vo", vo);
		map.put("fVo", fVo);
		System.out.println(map);
		return ResponseEntity.ok(map);
	}
}

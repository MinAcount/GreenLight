package com.green.light.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EmpDocumentController {

//	@Autowired
//	IEmpDocumentService service;
	
	@GetMapping(value = "/employeeDocument.do")
	public String employeeDocument() {
		log.info("EmpDocumentController employeeDocument 직원인사서류관리페이지 접근");
		
		return "employeeDocument";
	}
	
	
	
}

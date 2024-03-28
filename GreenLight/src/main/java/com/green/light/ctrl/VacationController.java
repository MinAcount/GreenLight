package com.green.light.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.light.model.service.IVacationService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class VacationController {
	
//	@Autowired
//	private IVacationService service;
	
	@GetMapping(value = "/myVacation.do")
	public String myVacation() {
		log.info("VacationController myVacation 내 휴가관리 페이지 이동");
		
		return "myVacation";
	}
	

	@GetMapping(value = "/employeeVacation.do")
	public String employeeVacation() {
		log.info("VacationController employeeVacation 직원 휴가관리 페이지 이동");
		
		return "employeeVacation";
	}
	
	
	

}

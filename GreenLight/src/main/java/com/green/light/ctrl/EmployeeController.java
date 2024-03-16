package com.green.light.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.light.model.service.IEmployeeService;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EmployeeController {
	
	@Autowired
	private IEmployeeService service;
	
	@GetMapping("/employeeList.do")
	public String employeeList(Model model) {
		log.info("EmployeeController GET employeeList 직원 정보 리스트");
		List<EmployeeVo> list = service.getAllEmployee();
		model.addAttribute("list",list);
		return "employeeList";
	}
	
	@GetMapping("/employeeAddForm.do")
	public String employeeAddForm(Model model) {
		log.info("EmployeeController GET employeeAddForm 직원 추가 페이지 이동");
		List<EmployeeVo> list = service.getAllEmployee();
		model.addAttribute("list",list);
		return "employeeAddForm";
	}
	
	
}

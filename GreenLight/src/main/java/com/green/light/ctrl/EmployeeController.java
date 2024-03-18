package com.green.light.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.green.light.model.service.IDepartmentService;
import com.green.light.model.service.IEmployeeService;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EmployeeController {
	
	@Autowired
	private IEmployeeService employeeService;
	
	@Autowired
	private IDepartmentService departmentService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("/employeeList.do")
	public String employeeList(Model model) {
		log.info("EmployeeController GET employeeList 직원 정보 리스트");
		List<EmployeeVo> list = employeeService.getAllEmployee();
		model.addAttribute("list",list);
		return "employeeList";
	}
	
	@GetMapping("/employeeAddForm.do")
	public String employeeAddForm(Model model) {
		log.info("EmployeeController GET employeeAddForm 직원 추가 페이지 이동");
		List<DepartmentVo> deptList = departmentService.getAllDept();
		model.addAttribute("deptList",deptList);
		return "employeeAddForm";
	}
	
	@PostMapping("/employeeAdd.do")
	public String employeeAdd(EmployeeVo vo) {
		log.info("EmployeeController POST employeeAdd 직원 추가 : {}", vo);
		String encodePassword = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(encodePassword);
		boolean isc = employeeService.insertEmployee(vo);
		log.info("성공여부 : {}",isc);
		return "redirect:/employeeList.do";
	}
	
}

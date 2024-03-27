package com.green.light.ctrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.light.model.service.IDepartmentService;
import com.green.light.model.service.IEmployeeService;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	private IDepartmentService deptService;
	
	@Autowired
	private IEmployeeService empService;
	
	@GetMapping(value = "/mypage.do")
	public String mypage(Model model, HttpSession session) {
		log.info("HomeController GET mypage 마이페이지로 이동");
		EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
		List<DepartmentVo> list = deptService.getAllDept();
		EmployeeVo empVo = empService.getOneEmployee(loginVo.getId());
		model.addAttribute("list",list);
		model.addAttribute("empVo",empVo);
		return "mypage";
	}
	
	@GetMapping(value = "/modifyPassword.do")
	public String modifyPassword() {
		log.info("HomeController GET modifyPassword 비밀번호 변경 페이지로 이동");
		return "modifyPassword";
	}
}

package com.green.light.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.light.model.service.IDepartmentService;
import com.green.light.vo.DepartmentVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	
	@Autowired
	private IDepartmentService deptService;
	
	@GetMapping(value = "/mypage.do")
	public String mypage(Model model) {
		log.info("HomeController GET mypage 마이페이지로 이동");
		List<DepartmentVo> list = deptService.getAllDept();
		model.addAttribute("list",list);
		return "mypage";
	}
	
	@GetMapping(value = "/modifyPassword.do")
	public String modifyPassword() {
		log.info("HomeController GET modifyPassword 비밀번호 변경 페이지로 이동");
		return "modifyPassword";
	}
}

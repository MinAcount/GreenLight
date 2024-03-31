package com.green.light.ctrl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.light.model.service.IAttendanceService;
import com.green.light.vo.AttendanceVo;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
	
	@Autowired
	IAttendanceService attendanceService;
	
	@GetMapping("/main.do")
	public String login(Model model, HttpSession session) {
		log.info("LoginController GET main.do 로그인 후 메인으로 이동");
		EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo"); 
		String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		AttendanceVo parameterVo = new AttendanceVo();
		parameterVo.setId(loginVo.getId());
		parameterVo.setIn_date(currentDate);
		AttendanceVo resultVo = attendanceService.getAttendance(parameterVo);
		model.addAttribute("attVo", resultVo);
		return "main";
	}
	
	@GetMapping("/admin.do")
	public String loginAdmin() {
		log.info("LoginController GET admin.do 로그인 후 관리자 메인으로 이동");
		return "admin";
	}
	
	@GetMapping("/loginForm.do")
	public String loginForm() {
		log.info("LoginController GET loginForm.do 로그인 화면으로 이동");
		return "login";
	}
	
	@GetMapping("/findPassword.do")
	public String findPassword() {
		log.info("LoginController GET findPassword.do 비밀번호 찾기 화면으로 이동");
		return "findPassword";
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		log.info("LoginController GET logout.do 로그아웃");
		session.removeAttribute("loginVo");
		return "redirect:/";
	}
	
}

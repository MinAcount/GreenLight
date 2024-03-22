package com.green.light.ctrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.light.model.service.IScheduleService;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.ScheduleVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ScheduleController {

	@Autowired
	private IScheduleService service;
	
	@GetMapping(value = "/month.do")
	public String MonthSchedule(Model model, HttpSession session) {
		log.info("ScheduleController GET month.do 일정조회(월)");
		EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
		System.out.println(loginVo);
		String userId = loginVo.getId();
		List<ScheduleVo> lists = service.monthSchedule(userId);
		model.addAttribute("lists", lists);
		return "month";
	}
}

package com.green.light.ctrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.light.model.service.IReserveService;
import com.green.light.vo.CheckListVo;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReserveController {

	@Autowired
	private IReserveService service;
	
	@GetMapping(value = "/myReserve.do")
	public String MyReserve(Model model, HttpSession session) {
		log.info("ReserveController GET myReserve.do 나의 예약 현황");
		EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
		String applicant = loginVo.getId();
		List<CheckListVo> lists = service.getMyReserve(applicant);
		model.addAttribute("lists", lists);
		return "myReserve";
	}
}

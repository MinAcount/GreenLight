package com.green.light.ctrl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.light.model.service.IVacationService;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.VacationVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class VacationController {
	
	@Autowired
	private IVacationService service;
	
	
	
	@GetMapping(value = "/myVacation.do")
	public String myVacation(HttpSession session, Model model, String in_date) {
		log.info("VacationController myVacation 내 휴가관리 페이지 이동");
		EmployeeVo EVo = (EmployeeVo) session.getAttribute("loginVo");
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("id", EVo.getId());
		
		if(in_date == null) {
		LocalDate toDay = LocalDate.now();
        String year = toDay.format(DateTimeFormatter.ofPattern("yyyy"));
        String month = toDay.format(DateTimeFormatter.ofPattern("yyyy-MM"));
        parameterMap.put("select_year", year);
        parameterMap.put("select_day", month);
        model.addAttribute("month",month);
		}else if(in_date != null) {
		parameterMap.put("select_year", in_date.substring(0,3));
		parameterMap.put("select_day", in_date);
        model.addAttribute("month",in_date);
        }
		
		VacationVo lists = service.selectRemainingLeaveByMonth(parameterMap);
		VacationVo parameterVo = new VacationVo();
		parameterVo.setId(EVo.getId());
		parameterVo.setStart_day((String)parameterMap.get("select_day"));
		List<VacationVo> vacationList = service.selectVacationHistory(parameterVo);
		model.addAttribute("lists",lists);
		System.out.println("lists "+lists);
		model.addAttribute("vacationList",vacationList);
		return "myVacation";
	}
	

	@GetMapping(value = "/employeeVacation.do")
	public String employeeVacation(HttpSession session, Model model) {
		log.info("VacationController employeeVacation 직원 휴가관리 페이지 이동");
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("select_year", "2024");
		parameterMap.put("select_day", "2024-03");
		List<VacationVo> lists= service.selectAllEmployeeVacation(parameterMap);
		model.addAttribute("lists",lists);
		return "employeeVacation";
	}
	
	@GetMapping(value = "/employeeVacDetails.do")
	public String employeeVacDetails(String id, Model model) {
		log.info("VacationController employeeVacDetails 직원 휴가관리 상세페이지 페이지 이동");
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("id", id);
		parameterMap.put("select_year", "2024");
		parameterMap.put("select_day", "2024-03");
		VacationVo vacVo= service.selectRemainingLeaveByMonth(parameterMap);
		
		VacationVo parameterVo = new VacationVo();
		parameterVo.setId(id);
		parameterVo.setStart_day((String)parameterMap.get("select_day"));
		List<VacationVo> vacationList = service.selectVacationHistory(parameterVo);
		
		System.out.println(vacVo);
		model.addAttribute("vacVo",vacVo);
		model.addAttribute("vacationList",vacationList);
		return "employeeVacDetails";
	}
	
	
	

}

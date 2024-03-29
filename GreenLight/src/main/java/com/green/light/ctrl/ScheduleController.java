package com.green.light.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.mapper.IDepartmentDao;
import com.green.light.model.service.DepartmentServiceImpl;
import com.green.light.model.service.IDepartmentService;
import com.green.light.model.service.IScheduleService;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.ScheduleVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ScheduleController {

	@Autowired
	private IScheduleService service;
	
	@Autowired
	private IDepartmentService deptservice;

	@GetMapping(value = "/month.do")
	public String MonthSchedule(HttpSession session, Model model) {
		log.info("ScheduleController GET month.do 일정화면");
		EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
	    String dname = deptservice.getOneDept(loginVo.getDeptno()).getDname();
	    model.addAttribute("dname", dname);
		return "month";
	}
	
	@GetMapping(value = "/ajaxView.do")
	@ResponseBody
	public List<ScheduleVo> AjaxView(@RequestParam("viewmonth") String viewmonth, Model model, HttpSession session) {
	    log.info("ScheduleController GET AjaxView.do 일정 전체조회");
	    EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
	    String user_id = loginVo.getId();
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("user_id", user_id);
	    map.put("viewmonth", viewmonth);
	    
	    System.out.println(map);
	    log.info("ScheduleController GET AjaxView.do 일정 조회년월 : {}", viewmonth);
	    List<ScheduleVo> lists = service.monthSchedule(map);
	    return lists;
	}

	
	@PostMapping(value = "/detailView.do")
	@ResponseBody
	@CrossOrigin(origins = "http://allowed-origin.com")
	public ScheduleVo DetailView(@RequestParam("schedule_id") String schedule_id, Model model){
		log.info("ScheduleController POST detailView.do 일정 상세조회 : {}", schedule_id);
		ScheduleVo vo = service.daySchedule(schedule_id);
		System.out.println(vo);
		return vo;
	}
	
	
	@PostMapping(value = "/insertSchedule.do")
	@ResponseBody
	public int InsertSchedule(@RequestBody ScheduleVo vo,  HttpSession session) {
		log.info("ScheduleController POST insertSchedule.do 일정등록 : {}", vo);
		EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
	    vo.setCno(loginVo.getId());
	    vo.setCreator(loginVo.getName());
		int isc = service.insertSchedule(vo);
		log.info((isc>0)?"insert : 성공":"insert : 실패");
		return isc;
	}
}

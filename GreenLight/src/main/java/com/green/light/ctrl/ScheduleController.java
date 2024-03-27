package com.green.light.ctrl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		log.info("ScheduleController GET month.do 일정화면");
		return "month";
	}
	
	@GetMapping(value = "/ajaxView.do")
	@ResponseBody
	public List<ScheduleVo> AjaxView(Model model, HttpSession session) {
	    log.info("ScheduleController GET AjaxView.do 일정 전체조회");
	    EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
	    String userId = loginVo.getId();
	    List<ScheduleVo> lists = service.monthSchedule(userId);
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
	public int InsertSchedule(@RequestParam ScheduleVo vo) {
		log.info("ScheduleController POST insertSchedule.do 일정등록 : {}", vo);
		int isc = service.insertSchedule(vo);
		log.info(isc == 1?"insert : 성공":"insert : 실패");
		return isc;
	}
}

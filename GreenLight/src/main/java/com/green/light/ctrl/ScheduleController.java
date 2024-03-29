package com.green.light.ctrl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.service.ICommonService;
import com.green.light.model.service.IDepartmentService;
import com.green.light.model.service.IScheduleService;
import com.green.light.vo.CommonVo;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.ScheduleVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ScheduleController {

	@Autowired
	private IScheduleService service;

	@Autowired
	private ICommonService commservice;

	@Autowired
	private IDepartmentService deptservice;

	@GetMapping(value = "/month.do")
	public String MonthSchedule(Model model, HttpSession session) {
		log.info("ScheduleController GET month.do 일정화면");
		EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
		String dname = deptservice.getOneDept(loginVo.getDeptno()).getDname();
		model.addAttribute("dname", dname);

		List<CommonVo> commList = commservice.getCommonList();
		model.addAttribute("commList", commList);

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
	public ScheduleVo DetailView(@RequestParam("schedule_id") String schedule_id, Model model) {
		log.info("ScheduleController POST detailView.do 일정 상세조회 : {}", schedule_id);
		ScheduleVo vo = service.daySchedule(schedule_id);
		System.out.println(vo);
		return vo;
	}

	@PostMapping(value = "/insertSchedule.do")
	@ResponseBody
	public int InsertSchedule(@RequestParam Map<String, Object> map, HttpSession session) throws ParseException {
		log.info("ScheduleController POST insertSchedule.do 일정등록 : {}", map);

		EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
		if (loginVo != null) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date start_date = dateFormat.parse((String) map.get("start_date"));
			Date end_date = dateFormat.parse((String) map.get("end_date"));

			ScheduleVo vo = new ScheduleVo();
			vo.setCno(loginVo.getId());
			vo.setCreator(loginVo.getName());
			vo.setPhone(loginVo.getPhone());
			vo.setLabel_name((String) map.get("label_name"));
			vo.setCategory((String) map.get("label_name"));
			vo.setTitle((String) map.get("title"));
			vo.setMemo((String) map.get("memo"));
			vo.setStart_date(start_date); // 변환된 Date 객체 설정
			vo.setEnd_date(end_date); // 변환된 Date 객체 설정
			vo.setLocation((String) map.get("location"));
			vo.setPriority((String) map.get("priority"));
			vo.setRecur((String) map.get("recur"));
			vo.setVisibility((String) map.get("visibility"));
			vo.setPermission((String) map.get("permission"));
			vo.setAlarm((String) map.get("alarm"));
			vo.setParticipants((String) map.get("participants"));

			int isc = service.insertSchedule(vo);
			log.info((isc > 0) ? "일정 등록 성공" : "일정 등록 실패");

			return isc;
		} else {
			log.error("로그인 정보가 없습니다.");
			throw new IllegalStateException("로그인 정보가 없습니다.");
		}
	}

}

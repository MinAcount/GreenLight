package com.green.light.ctrl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		if (!lists.isEmpty()) {
	        Date reserveDate = lists.get(0).getReservationVo().getReserve_date(); // 첫 번째 예약 정보의 날짜 가져오기
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(reserveDate);
	        calendar.add(Calendar.HOUR_OF_DAY, 2); // 시간을 2시간 추가
	        Date endDate = calendar.getTime();
	        model.addAttribute("endDate", endDate); // 모델에 추가
	    }

		Date currentdate = new Date();
	    model.addAttribute("currentdate", currentdate);
		return "myReserve";
	}
	
	@PostMapping(value = "/myReserve.do")
	 @ResponseBody
	 public ResponseEntity<?> allDraftList(@RequestBody Map<String, Object> map) {
		 log.info("ReserveController POST myReserve.do 기안문서함 전체조회 {}", map);
		 List<CheckListVo> lists = service.getMyReserve(String.valueOf(map.get("id")));
		 return ResponseEntity.ok(lists);
	 }
	
	@GetMapping(value = "/oneReserve.do")
	@ResponseBody
	public CheckListVo OneReserve(@RequestParam String reserveno) {
		log.info("ReserveController GET OneReserve.do 예약 상세 보기");
	    CheckListVo vo = service.getOneReserve(reserveno);
		return vo;
	}
	
	
}

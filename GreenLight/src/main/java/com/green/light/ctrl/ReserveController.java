package com.green.light.ctrl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.service.IConferenceService;
import com.green.light.model.service.IReserveService;
import com.green.light.vo.CheckListVo;
import com.green.light.vo.ConferenceVo;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.ReservationVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReserveController {

	@Autowired
	private IReserveService service;
	
	@Autowired
	private IConferenceService roomservice;

	@GetMapping(value = "/myReserve.do")
	public String MyReserve(Model model, HttpSession session) {
		log.info("ReserveController GET myReserve.do 나의 예약현황");
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

//	@PostMapping(value = "/myReserve.do")
//	@ResponseBody
//	public ResponseEntity<?> MyReserveSelect(@RequestBody Map<String, Object> map) {
//		log.info("ReserveController POST myReserve.do 상태별 나의 예약현황 {}", map);
//		List<CheckListVo> lists = service.getMyReserve(String.valueOf(map.get("id")));
//		return ResponseEntity.ok(lists);
//	}

	@GetMapping(value = "/oneReserve.do")
	@ResponseBody
	public CheckListVo OneReserve(@RequestParam("reserveno") String reserveno) {
		log.info("ReserveController GET OneReserve.do 예약 상세조회 {}", reserveno);
		CheckListVo vo = service.getOneReserve(reserveno);
		return vo;
	}

	@PostMapping(value = "/insertReserve.do")
	@ResponseBody
	public int ProInsertReserve(@RequestBody Map<String, Object> parameters, HttpSession session) {
		log.info("ReserveController GET insertReserve.do 예약 {}", parameters);
		EmployeeVo loginVo = (EmployeeVo) session.getAttribute("loginVo");
		
		parameters.put("applicant", loginVo.getId());
		parameters.put("phone", loginVo.getPhone());
		parameters.put("reserve_date", java.sql.Timestamp.valueOf((String) parameters.get("reserve_date")));
		
		int returnStatus = service.insertReserve(parameters);
		returnStatus = (int) parameters.get("v_count");

		if (returnStatus == 1) {
			System.out.println("INSERT가 성공적으로 이루어졌습니다.");
		} else if (returnStatus == -1) {
			System.out.println("중복된 예약이 있어 INSERT를 수행할 수 없습니다.");
		} else if (returnStatus == 0) {
			System.out.println("주어진 회의실 정보가 없습니다.");
		} else {
			System.out.println("문제가 발생했습니다.");
		}
		return returnStatus;
	}

	@GetMapping(value = "/updateReserve.do")
	@ResponseBody
	public int UpdateReserve(@RequestBody ReservationVo vo) {
		log.info("ReserveController GET updateReserve.do 예약수정 {}", vo);
		int cnt = service.updateReserve(vo);
		return cnt;
	}

	@GetMapping(value = "/deleteReserve.do")
	@ResponseBody
	public int DeleteReserve(@RequestParam("reserveno") String reserveno) {
		log.info("ReserveController GET deleteReserve.do 예약삭제 {}", reserveno);
		int cnt = service.deleteReserve(reserveno);
		return cnt;
	}

	@GetMapping(value = "/reserveList.do")
	public String AllReserve(Model model) {
	    log.info("ReserveController GET reserveList.do 예약 전체조회");
	    List<CheckListVo> lists = service.getAllReserve();
	    model.addAttribute("lists", lists); 
	    return "reserveList";
	}

	@PostMapping(value = "/reserveListView.do")
	@ResponseBody
	@CrossOrigin(origins = "http://allowed-origin.com")
	public List<CheckListVo> postAllReserveList() {
	    log.info("ReserveController POST reserveList.do 예약 전체조회 FullCalender");
	    List<CheckListVo> lists = service.getAllReserve();
	    log.info("예약 리스트: {}", lists);
	    return lists;
	}
	
	
	@GetMapping(value = "/reserveAble.do")
	public String AbleReserve(Model model) {
	    log.info("ReserveController GET reserveAble.do 사용 가능 예약 조회");
	    List<ConferenceVo> confLists = roomservice.getAllRoom();
		System.out.println(confLists);
		model.addAttribute("confLists", confLists);
	    return "reserveAble";
	}

	@GetMapping(value = "/reserveConf.do")
	public String ConfReserve(@RequestParam("conf_id") String conf_id) {
		log.info("ReserveController GET reserveConf.do 회의실 선택 예약조회 {}");
		List<CheckListVo> lists = service.confListReserve(conf_id);
		System.out.println(lists);
		return "reserveConf";
	}

	@GetMapping(value = "/reserveDate.do")
	public String DateReserve(@RequestParam("reserve_day") String reserve_day) {
		log.info("ReserveController GET dateReserve.do 날짜 선택 예약조회 {}");
		List<CheckListVo> lists = service.dateListReserve(reserve_day);
		System.out.println(lists);
		return "reserveDate";
	}

	@GetMapping(value = "/reserveTime.do")
	@ResponseBody
	public List<CheckListVo> TimeReserve(@RequestParam("reserve_day") String reserve_day, 
								         @RequestParam("timeslot") String timeslot, 
								         @RequestParam("floor") String floor, 
								         @RequestParam("capacity") int capacity) {
		log.info("ReserveController GET timeReserve.do 시간 선택 예약조회 {} {} {} {}" , reserve_day, timeslot, floor, capacity);
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("reserve_day", reserve_day);
	    map.put("timeslot", timeslot);
	    map.put("floor", floor);
	    map.put("capacity", capacity);
	    map.put("status", "예약가능");
	    List<CheckListVo> lists = service.timeListReserve(map);
	    System.out.println(lists);
		return lists;
	}

}

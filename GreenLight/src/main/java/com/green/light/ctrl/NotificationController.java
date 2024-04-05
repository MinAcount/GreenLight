package com.green.light.ctrl;

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

import com.green.light.model.service.INotificationService;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.NotificationVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class NotificationController {
	
	@Autowired
	private INotificationService notiService;
	
	@PostMapping("/readNoti.do")
	@ResponseBody
	public ResponseEntity<?> readNoti(@RequestBody Map<String, Object> map, HttpSession session){
		log.info("NotificationController POST readNoti.do 알림 읽기 {}",map);
		int n = notiService.updateRead(map);
		List<NotificationVo> notiList = notiService.getCurrNoti((String)map.get("id"));
		session.setAttribute("notiList", notiList);
		if(n>0) {
			return ResponseEntity.ok(notiList);
		}else {
			return ResponseEntity.ok("\"isc\":\"fail\"");
		}
	}
	
	@PostMapping("/allReadNoti.do")
	@ResponseBody
	public ResponseEntity<?> allReadNoti(@RequestBody String id, HttpSession session){
		log.info("NotificationController POST allReadNoti.do 알림 전체 읽기 {}",id);
		int n = notiService.updateAllRead(id);
		List<NotificationVo> notiList = notiService.getCurrNoti(id);
		session.setAttribute("notiList", notiList);
		if(n>0) {
			return ResponseEntity.ok("success");
		}else {
			return ResponseEntity.ok("fail");
		}
	}
	
	@GetMapping("allNoti.do")
	public String allNoti(Model model, HttpSession session) {
		log.info("NotificationController POST allNoti.do 알림 센터로 이동(알림 전체 보기)");
		EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
		List<NotificationVo> notiList = notiService.getAllNoti(loginVo.getId());
		model.addAttribute("allNoti", notiList);
		return "notiCenter";
	}
}

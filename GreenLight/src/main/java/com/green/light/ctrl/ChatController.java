package com.green.light.ctrl;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.mapper.IDocumentDao;
import com.green.light.model.mapper.IMessageDao;
import com.green.light.vo.DocumentVo;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.MessageVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {

	@Autowired
	private IMessageDao dao;
	
	@GetMapping(value = "/chatGroup.do")
	public String chatGroup() {
		log.info("ChatController chatGroup 그룹채팅 화면 이동");
		return "chatGroup";
	}
	
	@PostMapping(value = "/chatList.do")
	@ResponseBody
	public ResponseEntity<?> chatList(@RequestBody Map<String, Object> map, Model model) {
		 log.info("ChatController chatList 그룹채팅 화면 이동 후 채팅방 목록 조회 {}", map);
		 List<MessageVo> lists = dao.getAllChat(String.valueOf(map.get("id")));
		 return ResponseEntity.ok(lists);
	 }
	
	@PostMapping(value = "/insideChat.do")
	@ResponseBody
	public ResponseEntity<?> insideChat(@RequestBody Map<String, Object> map){
		log.info("ChatController insideChat 채팅방 내부 화면 {}", map);
		List<MessageVo> lists = dao.getViewInsideChat(String.valueOf(map.get("id")));
		System.out.println("lists" + lists);
		return ResponseEntity.ok(lists);
	}
	
	@GetMapping(value = "/socketOpenGr.do")
	public String socketOpenGr(String chat_id, String id, HttpSession session) {
		log.info("ChatController socketOpenGr 채팅방 아이디 {}, 사원번호 {}", chat_id, id);
		
		session.setAttribute("chat_id", chat_id);
		session.setAttribute("id", id);
		
		return "chatGroup";
	}
	
	@PostMapping(value = "/updateNoti.do")
	@ResponseBody
	public ResponseEntity<?> updateNoti(@RequestBody Map<String, Object> map){
		log.info("ChatController updateNoti 채팅방 알림 {}", map);
		String chat_id = (String)map.get("chat_id").toString();
		String id = (String)map.get("id").toString();
		String noti = (String)map.get("noti").toString();
		log.info("ChatController updateNoti 채팅방 알림 {} {} {}", chat_id, id, noti);
		int n = dao.updateNoti(map);
		return ResponseEntity.ok(n);
	}
	
	@PostMapping(value = "/updateFavor.do")
	@ResponseBody
	public ResponseEntity<?> updateFavor(@RequestBody Map<String, Object> map){
		log.info("ChatController updateFavor 채팅방 즐겨찾기 {}", map);
		String chat_id = (String)map.get("chat_id").toString();
		String id = (String)map.get("id").toString();
		String favor = (String)map.get("favor").toString();
		log.info("ChatController updateFavor 채팅방 즐겨찾기 {} {} {}", chat_id, id, favor);
		int n = dao.updateFavor(map);
		return ResponseEntity.ok(n);
	}
	
	@PostMapping(value = "/updateChatName.do")
	@ResponseBody
	public ResponseEntity<?> updateChatName(@RequestBody Map<String, Object> map){
		String chat_id = (String)map.get("chat_id").toString();
		String roomname = (String)map.get("roomname").toString();
		log.info("ChatController updateChatName 채팅방 이름수정 {} {}", chat_id, roomname);
		int n = dao.updateChatName(map);
		return ResponseEntity.ok(n);
	}
}










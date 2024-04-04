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
import com.green.light.model.service.IMessageService;
import com.green.light.vo.DocumentVo;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.GroupMemberVo;
import com.green.light.vo.MessageVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ChatController {

	@Autowired
	private IMessageService service;
	
	@GetMapping(value = "/chatGroup.do")
	public String chatGroup() {
		log.info("ChatController chatGroup 그룹채팅 화면 이동");
		return "chatGroup";
	}
	
	@PostMapping(value = "/chatList.do")
	@ResponseBody
	public ResponseEntity<?> chatList(@RequestBody Map<String, Object> map, Model model) {
		 log.info("ChatController chatList 그룹채팅 화면 이동 후 채팅방 목록 조회 {}", map);
		 List<MessageVo> lists = service.getAllChat(String.valueOf(map.get("id")));
		 System.out.println(lists);
		 return ResponseEntity.ok(lists);
	 }
	
	@PostMapping(value = "/insideChat.do")
	@ResponseBody
	public ResponseEntity<?> insideChat(@RequestBody Map<String, Object> map){
		log.info("ChatController insideChat 채팅방 내부 화면 {}", map);
		List<MessageVo> lists = service.getViewInsideChat(String.valueOf(map.get("id")));
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
		int n = service.updateNoti(map);
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
		int n = service.updateFavor(map);
		return ResponseEntity.ok(n);
	}
	
	@PostMapping(value = "/updateChatName.do")
	@ResponseBody
	public ResponseEntity<?> updateChatName(@RequestBody Map<String, Object> map){
		String chat_id = (String)map.get("chat_id").toString();
		String roomname = (String)map.get("roomname").toString();
		log.info("ChatController updateChatName 채팅방 이름수정 {} {}", chat_id, roomname);
		int n = service.updateChatName(map);
		return ResponseEntity.ok(n);
	}
	
	@PostMapping(value = "/insertSendMessage.do")
	@ResponseBody
	public ResponseEntity<?> insertSendMessage(@RequestBody MessageVo vo){
		String chat_id = vo.getChat_id();
		String writter = vo.getWritter();
		String content = vo.getContent();
		log.info("ChatController insertSendMessage 메시지 전송 {} {} {}", chat_id, writter, content);
		int n = service.insertSendMessage(vo);
		return ResponseEntity.ok(n);
	}
	
	@PostMapping(value = "/insertChat.do")
	@ResponseBody
	public ResponseEntity<?> insertChat(@RequestBody GroupMemberVo gmvo){
		String groupno = gmvo.getGroupno();
		String roomname = gmvo.getRoomname();
		String id = gmvo.getId();
		log.info("ChatController insertChat 채팅방 생성 {} {} {}", groupno, roomname, id);
		int n = service.insertChat(gmvo);
		return ResponseEntity.ok(n);
	}
}










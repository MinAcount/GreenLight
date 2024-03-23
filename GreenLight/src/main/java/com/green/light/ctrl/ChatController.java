package com.green.light.ctrl;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public String chatGroup(Model model, HttpSession session) {
		log.info("ChatController chatGroup 그룹채팅 화면 이동");
//		EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
//		String id = loginVo.getId();
//		List<MessageVo> lists = dao.getAllChat(id);
//		model.addAttribute("lists", lists);
//		log.info("@@@@@@@@@@@@@@@@@@@@@@@@ {}", lists);
		return "chatGroup";
	}
	
	@PostMapping(value = "/chatList.do")
	@ResponseBody
	public ResponseEntity<?> chatList(@RequestBody Map<String, Object> map) {
		 log.info("ChatController chatList 그룹채팅 화면 이동 후 채팅방 목록 조회 {}", map);
		 List<MessageVo> lists = dao.getAllChat(String.valueOf(map.get("id")));
		 return ResponseEntity.ok(lists);
	 }
}










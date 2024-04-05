package com.green.light.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.light.model.mapper.IMessageDao;
import com.green.light.vo.GroupMemberVo;
import com.green.light.vo.MessageVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MessageServiceImpl implements IMessageService {
	
	@Autowired
	private IMessageDao dao;
	
	@Override
	public List<MessageVo> getAllChat(String id) {
		log.info("MessageServiceImpl getAllChat 채팅방 목록 조회");
		List<MessageVo> list = dao.getAllChat(id);
		return list;
	}

	@Override
	public List<MessageVo> getViewInsideChat(String chat_id) {
		log.info("MessageServiceImpl getViewInsideChat 채팅방 세부 조회");
		List<MessageVo> list = dao.getViewInsideChat(chat_id);
		return list;
	}

	@Override
	public int updateChatName(Map<String, Object> map) {
		log.info("MessageServiceImpl updateChatName 채팅방 이름 수정");
		int n = dao.updateChatName(map);
		return n;
	}

	@Override
	public int updateFavor(Map<String, Object> map) {
		log.info("MessageServiceImpl updateFavor 즐겨찾기");
		int n = dao.updateFavor(map);
		return n;
	}

	@Override
	public int updateNoti(Map<String, Object> map) {
		log.info("MessageServiceImpl updateNoti 알림여부");
		int n = dao.updateNoti(map);
		return n;
	}

	@Transactional
	@Override
	public int insertSendMessage(MessageVo vo) {
		log.info("MessageServiceImpl insertSendMessage 메시지 전송 insert");
		int n = dao.insertSendMessage(vo);
		int m = dao.updateSendMessage(vo.getChat_id());
		return n + m > 0 ? 1 : 0;
	}

	@Override
	public int insertChat(Map<String, Object> groupMap) {
		log.info("MessageServiceImpl insertChat 채팅방 생성");
		int n = dao.insertChat(groupMap); 
		return n;
	}

	@Override
	public String getChatIdFound() {
		log.info("MessageServiceImpl getChatIdFound 채팅방 아이디 찾기");
		String chat_id = dao.getChatIdFound();
		return chat_id;
	}
}

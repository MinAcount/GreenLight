package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import com.green.light.vo.GroupMemberVo;
import com.green.light.vo.MessageVo;

public interface IMessageService {

		// 채팅방 목록 조회 getAllChat
		public List<MessageVo> getAllChat(String id);
		// 채팅방 목록 검색 getSearchChat
		
		// 채팅방 생성 (Message 테이블 추가) insertChat
		public int insertChat(Map<String, Object> groupMap);
		// 채팅방 아이디 찾기 getChatIdFound
		public String getChatIdFound();
		// 채팅방 세부 조회 getViewInsideChat
		public List<MessageVo> getViewInsideChat(String chat_id);
		// 채팅방 이름 수정 updateChatName
		public int updateChatName(Map<String, Object> map);
		// 채팅방 나가기 getOutChat
		
		// 채팅방 초대하기 insertInviteChat
		
		// 즐겨찾기 updateFavor
		public int updateFavor(Map<String, Object> map);
		// 알림여부 updateNoti
		public int updateNoti(Map<String, Object> map);
		// 메시지 전송 insertSendMessage
		public int insertSendMessage(MessageVo vo);
}

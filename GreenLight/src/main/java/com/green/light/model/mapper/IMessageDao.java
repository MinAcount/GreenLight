package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import com.green.light.vo.GroupMemberVo;
import com.green.light.vo.MessageVo;

public interface IMessageDao {

	// 채팅방 목록 조회 getAllChat
	public List<MessageVo> getAllChat(String id);
	// 채팅방 목록 검색 getSearchChat
	
	// 채팅방 생성 insertChat
	public int insertChat(Map<String, Object> map);
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
	// 메시지 전송 updateSendMessage
	public int updateSendMessage(String chat_id);
}

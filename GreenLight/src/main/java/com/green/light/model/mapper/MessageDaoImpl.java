package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.GroupMemberVo;
import com.green.light.vo.MessageVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MessageDaoImpl implements IMessageDao {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private final String NS = "com.green.light.model.mapper.MessageDaoImpl.";
	
	@Override
	public List<MessageVo> getAllChat(String id) {
		log.info("getAllChat {}", id);
		return sqlsession.selectList(NS + "getAllChat", id);
	}

	@Override
	public List<MessageVo> getViewInsideChat(String chat_id) {
		log.info("getViewInsideChat {}", chat_id);
		return sqlsession.selectList(NS + "getViewInsideChat", chat_id);
	}

	@Override
	public int updateNoti(Map<String, Object> map) {
		log.info("updateNoti {}", map);
		return sqlsession.update(NS + "updateNoti", map);
	}

	@Override
	public int updateFavor(Map<String, Object> map) {
		log.info("updateFavor {}", map);
		return sqlsession.update(NS + "updateFavor", map);
	}

	@Override
	public int updateChatName(Map<String, Object> map) {
		log.info("updateChatName {}", map);
		return sqlsession.update(NS + "updateChatName", map);
	}

	@Override
	public int insertSendMessage(MessageVo vo) {
		log.info("insertSendMessage {}", vo);
		return sqlsession.insert(NS + "insertSendMessage", vo);
	}

	@Override
	public int updateSendMessage(String chat_id) {
		log.info("updateSendMessage {}", chat_id);
		return sqlsession.update(NS + "updateSendMessage", chat_id);
	}

	@Override
	public int insertChat(GroupMemberVo gmvo) {
		log.info("insertChat {}", gmvo);
		return sqlsession.insert(NS + "insertChat", gmvo);
	}

}

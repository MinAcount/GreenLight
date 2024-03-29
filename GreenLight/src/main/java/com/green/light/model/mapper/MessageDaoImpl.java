package com.green.light.model.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}

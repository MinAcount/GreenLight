package com.green.light.model.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.MessageVo;

@Repository
public class MessageDaoImpl implements IMessageDao {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private final String NS = "com.green.light.model.mapper.MessageDaoImpl.";
	
	@Override
	public List<MessageVo> getAllChat(String id) {
		return sqlsession.selectList(NS + "getAllChat", id);
	}

}

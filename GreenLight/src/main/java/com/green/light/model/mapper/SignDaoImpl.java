package com.green.light.model.mapper;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.SignVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class SignDaoImpl implements ISignDao {

	@Autowired
	private SqlSessionTemplate session;
	
	private final String NS = "com.green.light.model.mapper.SignatureDaoImpl.";

	
	
	@Override
	public List<SignVo> selectAllSign(String id) {
		log.info("SignDaoImpl selectAllSign동작");
		return session.selectList(NS+"selectAllSign");
	}



	@Override
	public int insertSign(SignVo signVo) {
		log.info("SignDaoImpl insertSign동작");
		return session.insert(NS+"insertSign", signVo);
	}



	@Override
	public int delSign(SignVo signVo) {
		log.info("SignDaoImpl delSign동작");
		return session.delete(NS+"delSign", signVo);
	}



	@Override
	public int changeMainSign(String id) {
		log.info("SignDaoImpl changeMainSign동작");
		return session.update(NS+"changeMainSign", id);
	}



	@Override
	public int setMainSign(Map<String, Object> map) {
		log.info("SignDaoImpl setMainSign동작");
		return session.update(NS+"setMainSign", map);
	}


}

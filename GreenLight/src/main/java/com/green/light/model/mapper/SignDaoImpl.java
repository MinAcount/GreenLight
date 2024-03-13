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
	private SqlSessionTemplate sessionTemplate;
	
	private final String NS = "com.green.light.model.mapper.SignatureDaoImpl.";

	
	
	@Override
	public List<SignVo> selectAllSign() {
		log.info("SignDaoImpl selectAllSign동작");
		return sessionTemplate.selectList(NS+"selectAllSign");
	}

	@Override
	public int insertSign(SignVo signVo) {
		// TODO Auto-generated method stub
		return 0;
	}

}

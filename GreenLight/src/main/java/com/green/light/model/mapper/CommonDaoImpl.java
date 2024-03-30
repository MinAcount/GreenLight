package com.green.light.model.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.CommonVo;

@Repository
public class CommonDaoImpl implements ICommonDao{
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private final String NS = "com.green.light.model.mapper.CommonDaoImpl.";

	@Override
	public List<CommonVo> getCommonList() {
		return sqlsession.selectList(NS+"getCommonList");
	}

}

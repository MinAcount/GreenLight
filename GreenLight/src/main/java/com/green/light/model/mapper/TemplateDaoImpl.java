package com.green.light.model.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.TemplateVo;

@Repository
public class TemplateDaoImpl implements ITemplateDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "com.green.light.model.mapper.TemplateDaoImpl.";
	
	@Override
	public TemplateVo selectMainTemplate(String tempno) {
		return sqlSession.selectOne(NS+"selectMainTemplate", tempno);
	}
	
	@Override
	public int insertTemplate(TemplateVo vo) {
		return sqlSession.insert(NS+"insertTemplate",vo);
	}

}

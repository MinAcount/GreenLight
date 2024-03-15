package com.green.light.model.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.DocumentVo;

@Repository
public class DocumentDaoImpl implements IDocumentDao{

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private final String NS = "com.green.light.model.mapper.DocumentDaoImpl.";

	@Override
	public List<DocumentVo> getAllDraftDocument(String id) {
		return sqlsession.selectList(NS+"getAllDraftDocument",id);
	}
}

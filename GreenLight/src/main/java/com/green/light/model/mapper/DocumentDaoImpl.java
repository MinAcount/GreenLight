package com.green.light.model.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<DocumentVo> getAllDraft(String id) {
		return sqlsession.selectList(NS+"getAllDraft",id);
	}

	@Override
	public List<DocumentVo> getAllDraftByDocStatus(Map<String,  Object> map) {
		return sqlsession.selectList(NS+"getAllDraftByDocStatus",map);
	}
	
	@Override
	public List<DocumentVo> getAllTempDraft(String id) {
		return sqlsession.selectList(NS+"getAllTempDraft",id);
	}

	@Override
	public List<DocumentVo> getAllApprovalDraft(String id) {
		return sqlsession.selectList(NS+"getAllApprovalDraft",id);
	}
	
	@Override
	public List<DocumentVo> getAllApprDraftByDocStatus(Map<String, Object> map) {
		return sqlsession.selectList(NS+"getAllApprDraftByDocStatus", map);
	}

	@Override
	public List<DocumentVo> getAllReferenceDraft(String id) {
		return sqlsession.selectList(NS+"getAllReferenceDraft",id);
	}


}

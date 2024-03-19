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
	public List<DocumentVo> getAllDraftByDocStatus(String id, String doc_status) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		params.put("doc_status", doc_status);
		return sqlsession.selectList(NS+"getAllDraftByDocStatus",params);
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
	public List<DocumentVo> getAllReferenceDraft(String id) {
		return sqlsession.selectList(NS+"getAllReferenceDraft",id);
	}

}

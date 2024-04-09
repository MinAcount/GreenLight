package com.green.light.model.mapper;

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
	public int getNextSequenceValue() {
		return sqlsession.selectOne(NS+"getNextSequenceValue");
	}
   
	@Override
	public int insertDocument(DocumentVo docVo) {
		return sqlsession.insert(NS+"insertDocument", docVo);
	}
   
   @Override
   public List<DocumentVo> getAllPendingApprovalDraft(String id) {
      return sqlsession.selectList(NS+"getAllPendingApprovalDraft", id);
   }
   
   @Override
	public List<DocumentVo> getAllPendingApprovalDraftLimit(String id) {
		return sqlsession.selectList(NS+"getAllPendingApprovalDraftLimit",id);
	}
   
   @Override
   public List<DocumentVo> getAllPendingApprovalDraftUrgency(String id) {
	   return sqlsession.selectList(NS+"getAllPendingApprovalDraftUrgency",id);
   }
   
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

   @Override
   public List<DocumentVo> getAllRefDraftByDocStatus(Map<String, Object> map) {
      return sqlsession.selectList(NS+"getAllRefDraftByDocStatus", map);
   }

	@Override
	public DocumentVo getDocumentDetail(String docno) {
		return sqlsession.selectOne(NS+"getDocumentDetail", docno);
	}

	@Override
	public int updateDocStatus(Map<String, Object> map) {
		return sqlsession.update(NS+"updateDocStatus",map);
	}

	@Override
	public int updateContent(Map<String, Object> map) {
		return sqlsession.update(NS+"updateContent",map);
	}

	

	
}

package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.light.model.mapper.IDocumentDao;
import com.green.light.vo.DocumentVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DocumentServiceImpl implements IDocumentService{

	@Autowired
	private IDocumentDao dao;
	

	@Override
	public List<DocumentVo> getAllPendingApprovalDraft(String id) {
		log.info("DocumentServiceImpl getAllPendingApprovalDraft 결재대기문서함 전체조회 : {}", id);
		return dao.getAllPendingApprovalDraft(id);
	}


	@Override
	public List<DocumentVo> getAllDraft(String id) {
		log.info("DocumentServiceImpl getAllDraft 기안문서 전체조회 : {}", id);
		return dao.getAllDraft(id);
	}


	@Override
	public List<DocumentVo> getAllDraftByDocStatus(Map<String, Object> map) {
		log.info("DocumentServiceImpl getAllDraftByDocStatus 기안문서함 기안서상태별 전체조회 : {}", map);
		return dao.getAllDraftByDocStatus(map);
	}


	@Override
	public List<DocumentVo> getAllTempDraft(String id) {
		log.info("DocumentServiceImpl getAllTempDraft 임시저장함 전체조회 : {}", id);
		return dao.getAllTempDraft(id);
	}


	@Override
	public List<DocumentVo> getAllApprovalDraft(String id) {
		log.info("DocumentServiceImpl getAllApprovalDraft 결재문서함 전체조회 : {}", id);
		return dao.getAllApprovalDraft(id);
	}


	@Override
	public List<DocumentVo> getAllApprDraftByDocStatus(Map<String, Object> map) {
		log.info("DocumentServiceImpl getAllApprDraftByDocStatus 결재문서함 기안서상태별 전체조회 : {}", map);
		return dao.getAllApprDraftByDocStatus(map);
	}


	@Override
	public List<DocumentVo> getAllReferenceDraft(String id) {
		log.info("DocumentServiceImpl getAllReferenceDraft 참조문서함 전체조회 : {}", id);
		return dao.getAllReferenceDraft(id);
	}


	@Override
	public List<DocumentVo> getAllRefDraftByDocStatus(Map<String, Object> map) {
		log.info("DocumentServiceImpl getAllRefDraftByDocStatus 참조문서함 기안서상태별 전체조회 : {}", map);
		return dao.getAllRefDraftByDocStatus(map);
	}
	
	
	
}

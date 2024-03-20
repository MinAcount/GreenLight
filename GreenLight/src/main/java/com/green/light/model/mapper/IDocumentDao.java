package com.green.light.model.mapper;

import java.util.List;

import com.green.light.vo.DocumentVo;

public interface IDocumentDao {

	// 기안문서 전체조회 getAllDraft
	public List<DocumentVo> getAllDraft(String id);
	
	// 기안문서함 기안서상태별 전체조회 getAllDraftByDocStatus
	public List<DocumentVo> getAllDraftByDocStatus(String id, String doc_status);
	
	// 임시저장함 전체조회 getAllTempDraft
	public List<DocumentVo> getAllTempDraft(String id);
	
	// 결재문서함 전체조회 getAllApprovalDraft
	public List<DocumentVo> getAllApprovalDraft(String id);
	
	// 참조문서함 전체조회 getAllReferenceDraft
	public List<DocumentVo> getAllReferenceDraft(String id);
	
}

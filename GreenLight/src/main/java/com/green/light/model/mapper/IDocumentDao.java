package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import com.green.light.vo.DocumentVo;

public interface IDocumentDao {
	// 시퀀스 조회 getNextSequenceValue
	public int getNextSequenceValue();
	
	// 기안서 상신 insertDocument
	public int insertDocument(DocumentVo docVo);
	
	// 결재대기문서함 페이징용 기안서 갯수 조회 getAllPendingApprovalDraftCount
	public int getAllPendingApprovalDraftCount(String id);
	
	// 결재대기문서함 페이징용 getAllPendingApprovalDraftForPaging
	public List<DocumentVo> getAllPendingApprovalDraftForPaging(Map<String, Object> map);
	
	// 결재대기문서함 전체조회 getAllPendingApprovalDraft
	public List<DocumentVo> getAllPendingApprovalDraft(String id);

	// 기안문서 전체조회 getAllDraft
	public List<DocumentVo> getAllDraft(String id);

	// 기안문서함 기안서상태별 전체조회 getAllDraftByDocStatus
	public List<DocumentVo> getAllDraftByDocStatus(Map<String, Object> map);

	// 임시저장함 전체조회 getAllTempDraft
	public List<DocumentVo> getAllTempDraft(String id);

	// 결재문서함 전체조회 getAllApprovalDraft
	public List<DocumentVo> getAllApprovalDraft(String id);
	
	// 결재문서함 4줄 getAllPendingApprovalDraftLimit
	public List<DocumentVo> getAllPendingApprovalDraftLimit(String id);
	
	// 결재문서함 긴급순 2줄 getAllPendingApprovalDraftUrgency
	public List<DocumentVo> getAllPendingApprovalDraftUrgency(String id);

	// 결재문서함 기안서상태별 전체조회 getAllApprDraftByDocStatus
	public List<DocumentVo> getAllApprDraftByDocStatus(Map<String, Object> map);

	// 참조문서함 전체조회 getAllReferenceDraft
	public List<DocumentVo> getAllReferenceDraft(String id);

	// 참조문서함 기안서상태별 전체조회 getAllRefDraftByDocStatus
	public List<DocumentVo> getAllRefDraftByDocStatus(Map<String, Object> map);
	
	// 기안서 상세조회 getDocumentDetail
	public DocumentVo getDocumentDetail(String docno);
	
	// 기안서 상태 업데이트
	public int updateDocStatus(Map<String, Object> map);
	
	// 기안서 내용 업데이트
	public int updateContent(Map<String, Object> map);

}
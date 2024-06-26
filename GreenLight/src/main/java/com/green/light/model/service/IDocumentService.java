package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import com.green.light.vo.ApprovalVo;
import com.green.light.vo.DocumentVo;
import com.green.light.vo.FileStorageVo;
import com.green.light.vo.ScheduleVo;
import com.green.light.vo.VacationVo;

public interface IDocumentService {
	
	// vacation, schedule 등록
	public int afterApprove(VacationVo vVo, ScheduleVo scVo);

	// 기안서 상신 + 파일 등록 + 결재자/참조자 등록
	public int insertDraft(DocumentVo docVo, List<FileStorageVo> files, List<ApprovalVo> approval);
	
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
	
	// 기안문서 상세조회 getDocumentDetail
	public DocumentVo getDocumentDetail(String docno);
	
	// 기안서 상태 업데이트
	public int updateDocStatus(Map<String, Object> map);
	
	// 기안서 내용 업데이트
	public int updateContent(Map<String, Object> map);
	
	// 임시저장
	public int insertTempDraft(DocumentVo dVo);

}

package com.green.light.model.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.light.model.mapper.IApprovalDao;
import com.green.light.model.mapper.IDocumentDao;
import com.green.light.model.mapper.IFileStorageDao;
import com.green.light.vo.ApprovalVo;
import com.green.light.vo.DocumentVo;
import com.green.light.vo.FileStorageVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DocumentServiceImpl implements IDocumentService{

	@Autowired
	private IDocumentDao dao;
	@Autowired
	private IFileStorageDao fDao;
	@Autowired
	private IApprovalDao aDao;
	
	@Override
	@Transactional
	public int insertDraft(DocumentVo docVo, List<FileStorageVo> files, List<ApprovalVo> approval) {
		log.info("DocumentServiceImpl insertDraft 게시글, 파일 업로드 : {}, {}, {}", docVo, files, approval);
		int cnt = 0;
		
		cnt += dao.insertDocument(docVo);
		System.out.println("=================================== insertDocument 실행");
		
		for(int i = 0; i < files.size(); i++) {
			cnt += fDao.insertFile(files.get(i));
			System.out.println("=================================== insertFile 실행");
		}
		
		System.out.println("====================================approval:"+approval);
		cnt += aDao.insertApproval(approval);
		System.out.println("=================================== insertApproval 실행");
		
		return cnt;
	}
	
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

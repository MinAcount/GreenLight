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
import com.green.light.model.mapper.ISignDao;
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
	@Autowired
	private ISignDao sDao;
	
	@Override
	@Transactional
	public int insertDraft(DocumentVo dVo, List<FileStorageVo> fVos, List<ApprovalVo> apprVos) {
		log.info("DocumentServiceImpl insertDraft 게시글, 파일 업로드 : {}, {}, {}", dVo, fVos, apprVos);
		
		// 성공한 쿼리문의 갯수
		int cnt = 0;
		
		try {
			// 기안서 상신
			System.out.println("==== insertDocument() ====");
			System.out.println("==== dVo : " + dVo + " ====");
			cnt += dao.insertDocument(dVo);
			
			// 파일 다중 등록
			for(int i = 0; i < fVos.size(); i++) {
				System.out.println("==== insertFile() ====");
				System.out.println("==== fVo : " + fVos.get(i) + " ====");
				cnt += fDao.insertFile(fVos.get(i));
			}
			
			// 결재자 다중 등록
			for(int i = 0; i < apprVos.size(); i++) {
				System.out.println("==== insertApproval() ====");
				System.out.println("==== apprVo : " + apprVos.get(i) + " ====");
				cnt += aDao.insertApproval(apprVos.get(i));
			}
			
			// 트랜잭션 쿼리 실패시 롤백 되는지 확인용 
//			ApprovalVo forErrorApprVo = new ApprovalVo();
//			forErrorApprVo.setDocno(null);
//			cnt += aDao.insertApproval(forErrorApprVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
  
	
	
	
	@Override
	public int insertTempDraft(DocumentVo dVo) {
		log.info("DocumentServiceImpl insertTempDraft 게시글 : {}", dVo);
		
		// 성공한 쿼리문의 갯수
		int cnt = 0;
		
		try {
			// 기안서 상신
			System.out.println("==== insertTempDocument() ====");
			System.out.println("==== dVo : " + dVo + " ====");
			cnt += dao.insertDocument(dVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
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


	@Override
	public DocumentVo getDocumentDetail(String docno) {
		log.info("DocumentServiceImpl getDocumentDetail 기안문서 상세조회 : {}", docno);
		return dao.getDocumentDetail(docno);
	}


	@Override
	public int updateDocStatus(Map<String, Object> map) {
		log.info("DocumentServiceImpl updateDocStatus 기안서 상태 업데이트 : {}", map);
		return dao.updateDocStatus(map);
	}


	@Override
	public int updateContent(Map<String, Object> map) {
		log.info("DocumentServiceImpl updateContent 기안서 내용 업데이트 : {}", map);
		return dao.updateContent(map);
	}

	


	
}

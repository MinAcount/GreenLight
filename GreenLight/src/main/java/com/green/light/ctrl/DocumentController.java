package com.green.light.ctrl;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.light.model.mapper.IDocumentDao;
import com.green.light.model.service.IApprovalService;
import com.green.light.model.service.IDocumentService;
import com.green.light.vo.ApprovalVo;
import com.green.light.vo.DocumentVo;
import com.green.light.vo.FileStorageVo;
import com.green.light.vo.VacationVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DocumentController {
	@Autowired
	private IDocumentService service;
	@Autowired
	private IApprovalService apprService;
	@Autowired
	private IDocumentDao dao;
	
	@PostMapping(value = "/insertDocument.do")
	@ResponseBody
	public ResponseEntity<?> insertDocument(@RequestParam Map<String, Object> map, MultipartFile[] files) throws Exception {
	    log.info("DocumentController insertDocument POST /insertDocument.do : {}, {}", map, files);
	    
	    // docVo에 값 넣어주기
	    DocumentVo docVo = new DocumentVo("",
	    		(String)map.get("writer_id"), 
	    		(String)map.get("title"), 
	    		(String)map.get("content"), 
    									"", 
				(String)map.get("urgency"), 
				(String)map.get("tempcode"), 
    									"01");
	    System.out.println("==== docVo : " + docVo + " ====");
	    
	    // insert될 docno 값 생성
	    int seq = dao.getNextSequenceValue() + 1;
		String currentYear = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy"));
		String docno = currentYear + String.format("%05d", seq);
		System.out.println("==== docno : " + docno + " ====");
	    
		// fileVo에 값 넣어주기
	    List<FileStorageVo> fileVos = new ArrayList<FileStorageVo>();
	    for(int i = 0; i < files.length; i++) {
	    	byte[] byteArr = files[i].getBytes();
	    	FileStorageVo fileVo = new FileStorageVo(docno,
	    											"01", 
	    											files[i].getOriginalFilename(), 
	    											"stored_name 준비중..", 
	    											Base64.getEncoder().encodeToString(byteArr), 
	    											(int)files[i].getSize(), 
	    											"", 
	    											"");
	    	System.out.println("==== fileVo : " + fileVo + " ====");
	    	fileVos.add(fileVo);
	    }
	    
	    
	    // apprVo에 값 넣어주기
	    String jsonString = (String) map.get("apprLine");
	      ObjectMapper objectMapper = new ObjectMapper();
	      
	      List<ApprovalVo> apprVos = new ArrayList<ApprovalVo>();
	      
	      List<Map<String, String>> jsonArray = objectMapper.readValue(jsonString, new TypeReference<List<Map<String, String>>>() {
		  
	      });
	         
			// 각 요소를 순회하면서 JSON 배열을 출력합니다.
			for (Map<String, String> element : jsonArray) { // {},{},{} =>vo
	            System.out.println("==== jsonArray에 들어있는 객체 : " + element + " ====");
				ApprovalVo apprVo = new ApprovalVo();
				apprVo.setApprno("");
				apprVo.setDocno(docno);
				apprVo.setWriter_id((String) map.get("writer_id"));
				apprVo.setAtype(element.get("atype"));
				apprVo.setEmp_id(element.get("emp_id"));
				apprVo.setAppr_status("");
				apprVo.setOrderno(Integer.parseInt((String) element.get("orderno")));
				apprVo.setAppr_date("");
				apprVo.setSignature("");
				apprVo.setComment("");
//	            apprService.insertApproval(apprVo);
				System.out.println("==== apprVo : " + apprVo + " ====");
				apprVos.add(apprVo);
			}
			
			
			
			
			
			
			// refVo에 값 넣어주기
		    String jsonRefString = (String) map.get("refLine");
		      ObjectMapper objectMapper2 = new ObjectMapper();
		      
		      
		      List<Map<String, String>> jsonRefArray = objectMapper2.readValue(jsonRefString, new TypeReference<List<Map<String, String>>>() {
			  
		      });
		         
				// 각 요소를 순회하면서 JSON 배열을 출력합니다.
				for (Map<String, String> element : jsonRefArray) { // {},{},{} =>vo
		            System.out.println("==== jsonArray에 들어있는 객체 : " + element + " ====");
					ApprovalVo refVo = new ApprovalVo();
					refVo.setApprno("");
					refVo.setDocno(docno);
					refVo.setWriter_id((String) map.get("writer_id"));
					refVo.setAtype(element.get("atype"));
					refVo.setEmp_id(element.get("emp_id"));
					refVo.setAppr_status("");
					refVo.setAppr_date("");
//					refVo.setOrderno();
					refVo.setSignature("");
					refVo.setComment("");
//		            apprService.insertApproval(refVo);
					System.out.println("==== apprVo : " + refVo + " ====");
					apprVos.add(refVo);
				}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
//	         int n = apprService.insertApproval(approval);
//	         System.out.println("몇개나 성공했니?:"+n);

		// 기안서 상신 + 파일 등록 + 결재선 등록	
	    int n =service.insertDraft(docVo, fileVos, apprVos);
	    System.out.println("==== 성공한 쿼리문의 갯수 : " + n + "개 ====");
	    
//	    return ResponseEntity.ok().build();
//	    return ResponseEntity.ok("{\"isc\":\"true\"}");
//	    if(row == 1) { // 성공
//	    	return ResponseEntity.ok("{\"isc\":\"true\"}");
//	    } else {
//	    	return ResponseEntity.ok("{\"isc\":\"false\"}");
//	    }
	    return ResponseEntity.ok("{\"isc\":\"true\"}");
	}
	
	@GetMapping(value = "/draftDetail.do")
	public String draftDetail() {
		return "draftDetail";
	}
}

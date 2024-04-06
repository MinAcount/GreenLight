package com.green.light.ctrl;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.light.model.mapper.IDocumentDao;
import com.green.light.model.mapper.INotificationDao;
import com.green.light.model.service.IApprovalService;
import com.green.light.model.service.IDocumentService;
import com.green.light.model.service.IEmployeeService;
import com.green.light.model.service.ISignService;
import com.green.light.model.service.INotificationService;
import com.green.light.vo.ApprovalVo;
import com.green.light.vo.DocumentVo;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.FileStorageVo;
import com.green.light.vo.SignVo;
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
	@Autowired
	private ISignService signService;
  @Autowired
	private INotificationService notiService;
  
	@PostMapping(value = "/insertDocument.do")
   @ResponseBody
   public ResponseEntity<?> insertDocument(@RequestParam Map<String, Object> map,
         /* @RequestParam(name = "files", required = false) */ MultipartFile[] files) throws Exception {
       log.info("DocumentController insertDocument POST /insertDocument.do 기안서를 상신/임시저장하는 기능 : {}, {}", map, files);
       
       // docVo에 값 넣어주기
       DocumentVo docVo = new DocumentVo("",
             (String)map.get("writer_id"), 
             (String)map.get("title"), 
             (String)map.get("content"), 
                               "", 
            (String)map.get("urgency"), 
            (String)map.get("tempcode"), 
            (String)map.get("doc_status"));
       System.out.println("==== docVo : " + docVo + " ====");
       
       // insert될 docno 값 생성
       int seq = dao.getNextSequenceValue() + 1;
      String currentYear = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy"));
      String docno = currentYear + String.format("%05d", seq);
      System.out.println("==== docno : " + docno + " ====");
       
      
      
      
    	// fileVo에 값 넣어주기
          List<FileStorageVo> fileVos = new ArrayList<FileStorageVo>();
          if(files != null) {
             for(int i = 0; i < files.length; i++) {
                byte[] byteArr = files[i].getBytes();
                FileStorageVo fileVo = new FileStorageVo(docno,
                                              "01", 
                                              files[i].getOriginalFilename(), 
                                              "stored_name 준비중..", 
                                              Base64.getEncoder().encodeToString(byteArr), 
                                              (int)files[i].getSize(), 
                                              "", 
                                              "",
                                              null);
                System.out.println("==== fileVo : " + fileVo + " ====");
                fileVos.add(fileVo);
             }
          }
          
          
          // apprVo에 값 넣어주기
          String jsonString = (String) map.get("apprLine");
            ObjectMapper objectMapper = new ObjectMapper();
            
            List<ApprovalVo> apprVos = new ArrayList<ApprovalVo>();
            
            List<Map<String, String>> jsonArray = objectMapper.readValue(jsonString, new TypeReference<List<Map<String, String>>>() {
           
            });
            
          //알림 추가 : 결재자
             Map<String, Object> notiMapApprover = new HashMap<String, Object>();
             notiMapApprover.put("noti_id", "");
             notiMapApprover.put("gubun", docno);
             notiMapApprover.put("ntype", "03");
             notiMapApprover.put("sender", (String) map.get("writer_id"));
             notiMapApprover.put("content", "["+(String)map.get("title")+"] 문서를 결재할 순서입니다.");
               
            // 각 요소를 순회하면서 JSON 배열을 출력합니다.
            for (Map<String, String> element : jsonArray) { // {},{},{} =>vo
                  System.out.println("==== jsonArray에 들어있는 객체 : " + element + " ====");
               ApprovalVo apprVo = new ApprovalVo();
               apprVo.setApprno("");
               apprVo.setDocno(docno);
               apprVo.setWriter_id((String) element.get("writer_id"));
               apprVo.setAtype(element.get("atype"));
               apprVo.setEmp_id(element.get("emp_id"));
               apprVo.setAppr_status(element.get("appr_status"));
               apprVo.setOrderno(Integer.parseInt((String) element.get("orderno")));
               apprVo.setAppr_date("");
               apprVo.setSignature("");
               apprVo.setComment("");
//                  apprService.insertApproval(apprVo);
               System.out.println("==== apprVo : " + apprVo + " ====");
               apprVos.add(apprVo);
               //알림 추가 : 결재 순서가 1번인 사람
               if(((String) element.get("orderno")).equals("1")) {
                  List<String> approverId = new ArrayList<String>();
                  approverId.add((String)element.get("emp_id"));
                  notiService.insertNoti(notiMapApprover, approverId);
               }
            }
            
            
            
            
            
            
            // refVo에 값 넣어주기
             String jsonRefString = (String) map.get("refLine");
               ObjectMapper objectMapper2 = new ObjectMapper();
               
               
               List<Map<String, String>> jsonRefArray = objectMapper2.readValue(jsonRefString, new TypeReference<List<Map<String, String>>>() {
              
               });
               
             //알림 추가 : 참조자
                Map<String, Object> notiMapReferrer = new HashMap<String, Object>();
                notiMapReferrer.put("noti_id", "");
                notiMapReferrer.put("gubun", docno);
                notiMapReferrer.put("ntype", "03");
                notiMapReferrer.put("sender", (String) map.get("writer_id"));
                notiMapReferrer.put("content", "["+(String)map.get("title")+"] 문서에 참조되었습니다.");
                List<String> referrerIds = new ArrayList<String>();
                  
               // 각 요소를 순회하면서 JSON 배열을 출력합니다.
               for (Map<String, String> element : jsonRefArray) { // {},{},{} =>vo
                     System.out.println("==== jsonRefArray에 들어있는 객체 : " + element + " ====");
                  ApprovalVo refVo = new ApprovalVo();
                  refVo.setApprno("");
                  refVo.setDocno(docno);
                  refVo.setWriter_id((String) map.get("writer_id"));
                  refVo.setAtype(element.get("atype"));
                  refVo.setEmp_id(element.get("emp_id"));
                  refVo.setAppr_status("");
                  refVo.setAppr_date("");
//                  refVo.setOrderno();
                  refVo.setSignature("");
                  refVo.setComment("");
                  System.out.println("==== apprVo : " + refVo + " ====");
                  apprVos.add(refVo);
                  //알림 참조자 추가
                  referrerIds.add(element.get("emp_id"));
               }
               notiService.insertNoti(notiMapReferrer, referrerIds);
            
            
            
               String jsonWriterString = (String) map.get("writerVo");   
               System.out.println("===== wirterVo:" + jsonWriterString);
               
               ObjectMapper objectMapper3 = new ObjectMapper();
               ApprovalVo writerVo = objectMapper3.readValue(jsonWriterString, ApprovalVo.class);
               ApprovalVo vo = new ApprovalVo("", 
                     docno, 
                     (String)writerVo.getWriter_id(),
                     (String)writerVo.getAtype(),
                     (String)writerVo.getEmp_id(),
                     "",
                     0,
                     "",
                     "",
                     "");
//                     vo.setApprno("");
//                     vo.setDocno(docno);
//                     vo.setWriter_id((String)writerVo.getWriter_id());
//                     vo.setAtype((String)writerVo.getAtype());
//                     vo.setEmp_id((String)writerVo.getEmp_id());
//                     vo.setAppr_status("");
//                     vo.setAppr_date("");
////                     vo.setOrderno();
//                     vo.setSignature("");
//                     vo.setComment("");
                     System.out.println("==== writerVo : " + vo + " ====");
                     apprVos.add(vo);
//               int n = apprService.insertApproval(approval);
//               System.out.println("몇개나 성공했니?:"+n);

          
          
          //알림 추가 : 상신자
          Map<String, Object> notiMapWriter = new HashMap<String, Object>();
          notiMapWriter.put("noti_id", "");
          notiMapWriter.put("gubun", docno);
          notiMapWriter.put("ntype", "03");
          notiMapWriter.put("sender", (String) map.get("writer_id"));
          notiMapWriter.put("content", "["+(String)map.get("title")+"] 문서가 상신되었습니다.");
          List<String> writerId = new ArrayList<String>();
          writerId.add((String) map.get("writer_id"));
          notiService.insertNoti(notiMapWriter, writerId);
          
          
   	   // 기안서 상신 + 파일 등록 + 결재선 등록   
   	   int n =service.insertDraft(docVo, fileVos, apprVos);
   	   System.out.println("==== 성공한 쿼리문의 갯수 : " + n + "개 ====");
   	   
   	   
      
      
       
//       return ResponseEntity.ok().build();
//       return ResponseEntity.ok("{\"isc\":\"true\"}");
//       if(row == 1) { // 성공
//          return ResponseEntity.ok("{\"isc\":\"true\"}");
//       } else {
//          return ResponseEntity.ok("{\"isc\":\"false\"}");
//       }
       return ResponseEntity.ok(docno);
   }
	
	
	
	
	//임시저장
	@PostMapping(value = "/insertTempDocument.do")
	@ResponseBody
	public ResponseEntity<?> insertTempDocument(@RequestParam Map<String, Object> map) throws Exception {
		log.info("DocumentController insertTempDocument POST /insertTempDocument.do 기안서를 임시저장하는 기능 : {}", map);
		
		// docVo에 값 넣어주기
		DocumentVo docVo = new DocumentVo("",
				(String)map.get("writer_id"), 
				(String)map.get("title"), 
				(String)map.get("content"), 
				"", 
				(String)map.get("urgency"), 
				(String)map.get("tempcode"), 
				(String)map.get("doc_status"));
		System.out.println("==== docVo : " + docVo + " ====");
		
		// insert될 docno 값 생성
		int seq = dao.getNextSequenceValue() + 1;
		String currentYear = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy"));
		String docno = currentYear + String.format("%05d", seq);
		System.out.println("==== docno : " + docno + " ====");
		String tempcode = (String)map.get("tempcode");
		
		int nn = dao.insertDocument(docVo);
		
		
//       return ResponseEntity.ok().build();
//       return ResponseEntity.ok("{\"isc\":\"true\"}");
//       if(row == 1) { // 성공
//          return ResponseEntity.ok("{\"isc\":\"true\"}");
//       } else {
//          return ResponseEntity.ok("{\"isc\":\"false\"}");
//       }
		return ResponseEntity.ok(docno);
	}
	   
	
	
	
	
	   @GetMapping(value = "/draftDetail.do")
	   public String draftDetail(Model model, @RequestParam("docno") String docno) {
	      System.out.println("docno:"+ docno);
	      DocumentVo docVo = service.getDocumentDetail(docno);
	      model.addAttribute("docVo",docVo);
	      System.out.println("docVo:"+docVo);
	      
	      List<EmployeeVo> apprVo = apprService.getApproval(docno);
	      model.addAttribute("apprVo",apprVo);
	      System.out.println("apprVo"+apprVo);
	      
	      List<EmployeeVo> refVo = apprService.getReference(docno);
	      model.addAttribute("refVo", refVo);
	      System.out.println("refVo"+refVo);
	      return "draftDetail";
	   }
	   
	   @GetMapping(value = "/tempDraftDetail.do")
	   public String tempDraftDetail(Model model, @RequestParam("docno") String docno) {
		   System.out.println("docno:"+ docno);
		   DocumentVo docVo = service.getDocumentDetail(docno);
		   model.addAttribute("docVo",docVo);
		   System.out.println("docVo:"+docVo);
		   
		  
		   return "tempDraftDetail";
	   }
	
@PostMapping(value = "/updateApproval.do")
   @ResponseBody
   public ResponseEntity<?> updateApproval(@RequestParam Map<String, Object> map) {
      log.info("DocumentController updateApproval POST /updateApproval.do 결재선 업데이트: {}", map);
      List<EmployeeVo> lists = apprService.getApproval((String)map.get("docno"));
      System.out.println(lists);
      int orderno=0;
      for(int i = 0; i<lists.size(); i++) {
         if(map.get("emp_id").equals(lists.get(i).getApprVo().getEmp_id())) {
            orderno = lists.get(i).getApprVo().getOrderno();
         }
      }
      Map<String, Object> docMap = new HashedMap<String, Object>();
      docMap.put("doc_status", map.get("doc_status"));
      docMap.put("docno", map.get("docno"));
      docMap.put("emp_id", map.get("emp_id"));
      docMap.put("comment", map.get("comment"));
      docMap.put("appr_status", map.get("appr_status"));
      String appr_status = (String) map.get("appr_status");
      String nextId = (String) map.get("nextId");
      String writer_id = (String) map.get("writer_id");
      String title = (String) map.get("title");
      apprService.updateApprStatus(docMap);
      apprService.updateComment(docMap);
      System.out.println("orderno"+orderno);
    //알림 추가 : 상신자
	Map<String, Object> notiMap = new HashMap<String, Object>();
	notiMap.put("noti_id", "");
	notiMap.put("gubun", map.get("docno"));
	notiMap.put("ntype", "03");
	notiMap.put("sender", writer_id);
	List<String> writerId = new ArrayList<String>();
      if(orderno == lists.size() || appr_status.equals("03")) {
         System.out.println("들어옴");
		service.updateDocStatus(docMap);
		writerId.add(writer_id);
		if(appr_status.equals("03") && orderno == lists.size() || appr_status.equals("03") && orderno != lists.size()) {
			notiMap.put("content", "[" + title + "] 문서가 반려(반려사유:"+map.get("comment")+")되었습니다.");
		}else if(!appr_status.equals("03") && orderno == lists.size()){
			notiMap.put("content", "[" + title + "] 문서가 승인되었습니다.");
		}
		notiService.insertNoti(notiMap, writerId);
      }
      if(nextId != null) {
    	  writerId.add(nextId);
    	  notiMap.put("content", "[" + title + "] 문서를 결재할 순서입니다.");
    	  notiService.insertNoti(notiMap, writerId);
      }
      
      SignVo signVo = signService.selectMainSign((String)map.get("emp_id"));
      System.out.println("signVo"+signVo);
      
      System.out.println("nextId"+nextId);
      System.out.println("writer_id"+writer_id);
      return ResponseEntity.ok(signVo);
   }
	
	@PostMapping(value = "/updateContent.do")
	@ResponseBody
	public ResponseEntity<?> updateContent(@RequestParam Map<String, Object> map){
		log.info("DocumentController updateContent POST /updateContent.do : {}", map);
		Map<String, Object> signMap = new HashedMap<String, Object>();
		signMap.put("docno", map.get("docno"));
		signMap.put("content", map.get("content"));
		service.updateContent(signMap);
		return ResponseEntity.ok("{\"isc\":\"true\"}");
	}
}

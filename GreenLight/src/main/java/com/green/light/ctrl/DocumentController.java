package com.green.light.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.light.model.service.IApprovalService;
import com.green.light.model.service.IDocumentService;
import com.green.light.vo.ApprovalVo;
import com.green.light.vo.DocumentVo;
import com.green.light.vo.FileStorageVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DocumentController {
	@Autowired
	private IDocumentService service;
	
	@Autowired
	private IApprovalService apprService;
	
	@PostMapping(value = "/insertDocument.do")
	@ResponseBody
	public ResponseEntity<?> insertDocument(@RequestParam Map<String, Object> map, MultipartFile[] files) throws IOException {
	    log.info("DocumentController insertDocument POST /insertDocument.do : {}, {}", map, files);
	    DocumentVo docVo = new DocumentVo("000000000", (String)map.get("writer_id"), (String)map.get("title"), (String)map.get("content"), "", (String)map.get("urgency"), (String)map.get("tempcode"), "01");

		String jsonString = (String) map.get("apprLine");
		ObjectMapper objectMapper = new ObjectMapper();
		
		List<ApprovalVo> approval = new ArrayList<ApprovalVo>();
		
		try {
			List<Map<String, String>> jsonArray = objectMapper.readValue(jsonString,
					new TypeReference<List<Map<String, String>>>() {
					});
			String docno="202400011";
			
			// 각 요소를 순회하면서 JSON 배열을 출력합니다.
			for (Map<String, String> element : jsonArray) { // {},{},{} =>vo
//	        	System.out.println(element);
				ApprovalVo vo = new ApprovalVo();
				vo.setApprno("");
				vo.setDocno(docno);
				vo.setWriter_id(element.get("writer_id"));
				vo.setAtype(element.get("atype"));
				vo.setEmp_id(element.get("emp_id"));
				vo.setAppr_status("");
				vo.setOrderno(Integer.parseInt((String) element.get("orderno")));
				vo.setAppr_date("");
				vo.setSignature("");
				vo.setComment("");
//				apprService.insertApproval(vo);
				approval.add(vo);
			}
			int n = apprService.insertApproval(approval);
			System.out.println("몇개나 성공했니?:"+n);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
	    
	    
		List<FileStorageVo> listss = new ArrayList<FileStorageVo>();
	       for(int i = 0; i < files.length; i++) {
	          FileStorageVo fileVo = new FileStorageVo();
	          // ref_id
	          fileVo.setRef_id(docVo.getDocno()); 
	          // origin_name
	          fileVo.setOrigin_name(files[i].getOriginalFilename()); 
	          // stored_name
	          fileVo.setStored_name("stored_name 준비중..");
	          // payload
	          byte[] byteArr = files[i].getBytes();
	          fileVo.setPayload(Base64.getEncoder().encodeToString(byteArr));
	          // fsize
	          fileVo.setFsize((int)files[i].getSize());
	          System.out.println(fileVo);
	          listss.add(fileVo);
	       }
	       
	       System.out.println(listss);
	       int n =service.insertDraft(docVo, listss);
	       System.out.println("======================="+n);
	       
	       
//	       return ResponseEntity.ok().build();
//	       return ResponseEntity.ok("{\"isc\":\"true\"}");
//	       if(row == 1) { // 성공
//	          return ResponseEntity.ok("{\"isc\":\"true\"}");
//	       } else {
//	          return ResponseEntity.ok("{\"isc\":\"false\"}");
//	       }
	       return ResponseEntity.ok("{\"isc\":\"true\"}");
	   }
	
	@GetMapping(value = "/draftDetail.do")
	public String draftDetail() {
		return "draftDetail";
	}
}

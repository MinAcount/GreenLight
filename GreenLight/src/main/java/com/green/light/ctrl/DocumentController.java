package com.green.light.ctrl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.service.IDocumentService;
import com.green.light.vo.DocumentVo;
import com.green.light.vo.VacationVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DocumentController {
	@Autowired
	private IDocumentService service;
	
	@PostMapping(value = "/insertDocument.do")
	@ResponseBody
	public ResponseEntity<?> insertDocument(@RequestBody Map<String, Object> map) {
	    log.info("DocumentController insertDocument POST /insertDocument.do : {}", map);
	    DocumentVo docVo = new DocumentVo("00", (String)map.get("writer_id"), (String)map.get("title"), (String)map.get("content"), "", (String)map.get("urgency"), (String)map.get("tempcode"), "01");
	    int row = service.insertDocument(docVo);
	    
//	    return ResponseEntity.ok().build();
//	    return ResponseEntity.ok("{\"isc\":\"true\"}");
	    if(row == 1) { // 성공
	    	return ResponseEntity.ok("{\"isc\":\"true\"}");
	    } else {
	    	return ResponseEntity.ok("{\"isc\":\"false\"}");
	    }
	}
}

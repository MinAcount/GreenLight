package com.green.light.ctrl;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
import com.green.light.model.service.IDepartmentService;
import com.green.light.model.service.IEmployeeService;
import com.green.light.model.service.IFileStorageService;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.FileStorageVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EmpDocumentController {

	@Autowired
	private IEmployeeService empService;

	@Autowired
	private IDepartmentService deptService;

	@Autowired
	private IFileStorageService fileService;

	@GetMapping(value = "/employeeDocument.do")
	public String employeeDocument(Model model) {
		log.info("EmpDocumentController GET employeeDocument.do 직원인사서류관리페이지 접근");
		List<EmployeeVo> empList = empService.getAllEmployee();
		List<DepartmentVo> deptList = deptService.getAllDept();
		model.addAttribute("empList", empList);
		model.addAttribute("deptList", deptList);
		return "employeeDocument";
	}

	@PostMapping("/getOneEmpFile.do")
	@ResponseBody
	public ResponseEntity<?> getOneEmpFile(@RequestBody Map<String, Object> map) {
		log.info("EmpDocumentController POST getOneEmpFile.do 개별 인사서류 조회 {}", map);
		List<FileStorageVo> list = fileService.getOneFile(map);
		return ResponseEntity.ok(list);
	}

	@PostMapping("/empFileDel.do")
	@ResponseBody
	public ResponseEntity<?> empFileDel(@RequestBody Map<String, Object> map) {
		log.info("EmpDocumentController POST empFileDel.do 인사서류 삭제 {}", map);
		int n = fileService.deleteOneFile(map);
		if (n > 0) {
			map.put("start", "03");
			map.put("end", "06");
			List<FileStorageVo> list = fileService.getOneFile(map);
			return ResponseEntity.ok(list);
		} else {
			return ResponseEntity.ok("\"isc\":\"fail\"");
		}
	}

	@PostMapping("/empFileInsert.do")
	@ResponseBody
	public ResponseEntity<?> empFileInsert(@RequestParam MultipartFile payload, @RequestParam Map<String, Object> map) throws IOException {
		log.info("EmployeeController POST empFileInsert.do 직원 서류 추가 : {}/{}", payload, map);
		String ref_id = (String)map.get("ref_id");
		String ftype = (String)map.get("ftype");
		int fsize = Integer.parseInt((String)map.get("fsize"));
		String stored_name = (String)map.get("stored_name");
		String origin_name = (String)map.get("origin_name");
		byte[] byteArr = payload.getBytes();
		String payloadStr = Base64.getEncoder().encodeToString(byteArr);
		FileStorageVo fileVo = new FileStorageVo(ref_id, ftype, origin_name, stored_name, payloadStr, fsize, origin_name, payloadStr, null);
		int n = fileService.insertFile(fileVo);
		Map<String, Object> inputMap = new HashMap<String, Object>();
		if(n>0) {
			inputMap.put("id", ref_id);
			inputMap.put("start", "03");
			inputMap.put("end", "06");
			List<FileStorageVo> list = fileService.getOneFile(inputMap);
			return ResponseEntity.ok(list);
		}else {
			return ResponseEntity.ok("{\"msg\":\"fail\"}");
		}
	}
	
	@GetMapping("/empFileDownload.do")
	public void empFileDownload(String id, String ftype, HttpServletResponse response) throws IOException {
		log.info("EmployeeController GET empFileDownload.do 직원 서류 다운로드 : {}/{}", id, ftype);
		Map<String, Object> map = new HashMap<String, Object>(){{
			put("id",id);
			put("ftype",ftype);
		}};
		FileStorageVo fileVo = fileService.downloadFile(map);
		System.out.println(fileVo);
		String payload = fileVo.getPayload();
		String stored_name = fileVo.getStored_name();
		int fileSize = fileVo.getFsize();
		byte[] fileByte = Base64.getDecoder().decode(payload.getBytes("UTF-8"));
		
		response.setContentType("application/octext-stream");
		response.setContentLength(fileSize);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(stored_name,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
	
	@PostMapping("/getAllEmpFile.do")
	@ResponseBody
	public ResponseEntity<?> getAllEmpFile(@RequestBody Map<String, Object> map) throws Exception{
		log.info("EmpDocumentController POST getAllEmpFile.do 개별 인사서류 조회(화면확인용) {}", map);
		String jsonString = (String)map.get("ids");
		System.out.println(jsonString);
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, List<String>> jsonArray = objectMapper.readValue(jsonString, new TypeReference<Map<String, List<String>>>() {});
        List<String> idList = jsonArray.get("empIdList");
        List<List<FileStorageVo>> list = new ArrayList<List<FileStorageVo>>();
        for(String id : idList) {
        	Map<String, Object> mapId = new HashMap<String, Object>();
        	mapId.put("id", id);
        	mapId.put("start", "03");
        	mapId.put("end", "06");
        	list.add(fileService.getOneFile(mapId));
        }
		return ResponseEntity.ok(list);
	}

}

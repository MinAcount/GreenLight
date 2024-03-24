package com.green.light.ctrl;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.service.IDocumentService;
import com.green.light.vo.DocumentVo;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LibraryController {

	@Autowired
	private IDocumentService service;
	
	
	
	 @GetMapping(value = "/draftList.do")
	 public String draftList(Model model, HttpSession session) {
		 log.info("LibraryController GET draftList.do 기안문서함 이동 후 전체조회");
		 EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
		 String id = loginVo.getId();
		 List<DocumentVo> lists = service.getAllDraft(id);
		 model.addAttribute("lists", lists);
		 System.out.println(lists);
		 return "draftList";
	 }
	 
	 @PostMapping(value = "/allDraftList.do")
	 @ResponseBody
	 public ResponseEntity<?> allDraftList(@RequestBody Map<String, Object> map) {
		 log.info("LibraryController POST allDraftList 기안문서함 전체조회 {}", map);
		 List<DocumentVo> lists = service.getAllDraft(String.valueOf(map.get("id")));
		 return ResponseEntity.ok(lists);
	 }
	 
	 @PostMapping(value = "/draftListByDocStatus.do")
	 @ResponseBody
	 public ResponseEntity<?> draftListByDocStatus(@RequestBody Map<String, Object> map) {
		 log.info("LibraryController POST draftListByDocStatus.do 기안문서함 기안서상태별 전체조회{}",map);
		 List<DocumentVo> lists = service.getAllDraftByDocStatus(map);
		 return ResponseEntity.ok(lists);
	 }	 
	 
	 
	 @GetMapping(value = "/tempDraftList.do")
	 public String tempDraftList(Model model, HttpSession session) {
		 log.info("LibraryController GET tempDraftList.do 임시보관함 전체조회");
		 EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
		 String id = loginVo.getId();
		 List<DocumentVo> lists = service.getAllTempDraft(id);
		 model.addAttribute("lists", lists);
		 System.out.println(lists);
		 return "tempDraftList";
	 }
	 
	 @GetMapping(value = "/approvalList.do")
	 public String approvalList(Model model, HttpSession session) {
		 log.info("LibraryController GET approvalList.do 결재문서함 이동 후 전체조회");
		 EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
		 String id = loginVo.getId();
		 List<DocumentVo> lists = service.getAllApprovalDraft(id);
		 model.addAttribute("lists", lists);
		 System.out.println(lists);
		 return "approvalList";
	 }
	 
	 @PostMapping(value = "/allApprList.do")
	 @ResponseBody
	 public ResponseEntity<?> allApprList(@RequestBody Map<String, Object> map) {
		 log.info("LibraryController POST allApprList.do 결재문서함 전체조회 {}", map);
		 List<DocumentVo> lists = service.getAllApprovalDraft(String.valueOf(map.get("id")));
		 return ResponseEntity.ok(lists);
	 }
	 
	 
	 @PostMapping(value = "/apprListByDocStatus.do")
	 @ResponseBody
	 public ResponseEntity<?> apprListByDocStatus(@RequestBody Map<String, Object> map) {
		 log.info("LibraryController POST apprListByDocStatus.do 결재문서함 기안서상태별 전체조회{}",map);
		 List<DocumentVo> lists = service.getAllApprDraftByDocStatus(map);
		 return ResponseEntity.ok(lists);
	 }	
	 
	 @GetMapping(value = "/referenceList.do")
	 public String referenceList(Model model, HttpSession session) {
		 log.info("LibraryController GET referenceList.do 참조문서함 전체조회");
		 EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
		 String id = loginVo.getId();
		 List<DocumentVo> lists = service.getAllReferenceDraft(id);
		 model.addAttribute("lists", lists);
		 log.info("listsize:{}",lists.size());
		 System.out.println(lists);
		 return "referenceList";
	 }
	 
	 
	 @PostMapping(value = "/allReferenceList.do")
	 @ResponseBody
	 public ResponseEntity<?> allReferenceList(@RequestBody Map<String, Object> map) {
		 log.info("LibraryController POST allReferenceList 참조문서함 전체조회 {}", map);
		 List<DocumentVo> lists = service.getAllReferenceDraft(String.valueOf(map.get("id")));
		 return ResponseEntity.ok(lists);
	 }
	 
	 @PostMapping(value = "/refListByDocStatus.do")
	 @ResponseBody
	 public ResponseEntity<?> refListByDocStatus(@RequestBody Map<String, Object> map) {
		 log.info("LibraryController POST refListByDocStatus.do 참조문서함 기안서상태별 전체조회{}",map);
		 List<DocumentVo> lists = service.getAllRefDraftByDocStatus(map);
		 System.out.println("lists"+lists);
		 return ResponseEntity.ok(lists);
	 }
	 
	 
	 
	 @GetMapping(value = "/test.do")
	 public String test() {
		 return "test";
	 }
}

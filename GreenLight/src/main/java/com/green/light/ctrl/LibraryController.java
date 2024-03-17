package com.green.light.ctrl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.light.model.mapper.IDocumentDao;
import com.green.light.vo.DocumentVo;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LibraryController {

	@Autowired
	private IDocumentDao dao;
	
	
	 @GetMapping(value = "/draftList.do")
	 public String draftList(Model model, HttpSession session) {
		 log.info("LibraryController GET draftList.do 기안보관함 전체조회");
		 EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
		 String id = loginVo.getId();
		 List<DocumentVo> lists = dao.getAllDraft(id);
		 model.addAttribute("lists", lists);
		 System.out.println(lists);
		 return "draftList";
	 }
	 
	 
	 @GetMapping(value = "/tempDraftList.do")
	 public String tempDraftList(Model model, HttpSession session) {
		 log.info("LibraryController GET tempDraftList.do 임시보관함 전체조회");
		 EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
		 String id = loginVo.getId();
		 List<DocumentVo> lists = dao.getAllTempDraft(id);
		 model.addAttribute("lists", lists);
		 System.out.println(lists);
		 return "tempDraftList";
	 }
	 
	 @GetMapping(value = "/approvalList.do")
	 public String approvalList(Model model, HttpSession session) {
		 log.info("LibraryController GET approvalList.do 결재문서함 전체조회");
		 EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
		 String id = loginVo.getId();
		 List<DocumentVo> lists = dao.getAllApprovalDraft(id);
		 model.addAttribute("lists", lists);
		 System.out.println(lists);
		 return "approvalList";
	 }
	 
	 @GetMapping(value = "/referenceList.do")
	 public String referenceList(Model model, HttpSession session) {
		 log.info("LibraryController GET referenceList.do 참조문서함 전체조회");
		 EmployeeVo loginVo = (EmployeeVo)session.getAttribute("loginVo");
		 String id = loginVo.getId();
		 List<DocumentVo> lists = dao.getAllReferenceDraft(id);
		 model.addAttribute("lists", lists);
		 System.out.println(lists);
		 return "referenceList";
	 }
}

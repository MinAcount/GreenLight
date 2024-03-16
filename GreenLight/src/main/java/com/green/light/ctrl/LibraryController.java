package com.green.light.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.light.model.mapper.IDocumentDao;
import com.green.light.vo.DocumentVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LibraryController {

	@Autowired
	private IDocumentDao dao;
	
	
	 @GetMapping(value = "/draftList.do")
	 public String draftList(Model model) {
		 log.info("LibraryController GET draftList.do 기안보관함 전체조회");
		 List<DocumentVo> lists = dao.getAllDraft("2403110902");
		 model.addAttribute("lists", lists);
		 System.out.println(lists);
		 return "draftList";
	 }
	 
	 
	 @GetMapping(value = "/tempDraftList.do")
	 public String tempDraftList(Model model) {
		 log.info("LibraryController GET tempDraftList.do 임시보관함 전체조회");
		 List<DocumentVo> lists = dao.getAllTempDraft("2403110902");
		 model.addAttribute("lists", lists);
		 System.out.println(lists);
		 return "tempDraftList";
	 }
}

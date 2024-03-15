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
		 log.info("LibraryController GET draftList.do draftList로 이동");
		 List<DocumentVo> lists = dao.getAllDraftDocument("2403110902");
		 model.addAttribute("lists", lists);
		 System.out.println(lists);
		 return "draftList";
	 }
}

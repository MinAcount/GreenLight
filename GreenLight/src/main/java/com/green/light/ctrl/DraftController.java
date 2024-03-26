package com.green.light.ctrl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.green.light.model.service.IApprovalService;
import com.green.light.vo.ApprJstreeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DraftController {
	
	@Autowired
	private IApprovalService service;
	
	
	
	@GetMapping(value = "/draftForm.do")
	public String draftForm() {
		log.info("DraftController GET /draftForm.do 기안서 작성 Form");
		
		
		return "draftForm";
	}
	
	
	@GetMapping(value = "/apprJstreeView.do")
    @ResponseBody
    public String apprJstreeView() {
       log.info("DraftController apprJstreeView.do 요청");
       List<ApprJstreeVo> lists = service.getAllApprJstreeView();
       
       Gson gson = new GsonBuilder().create();
       String result = gson.toJson(lists);
       
       return result;
    }
	

	
	
}

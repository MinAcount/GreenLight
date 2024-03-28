package com.green.light.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.green.light.model.service.IApprovalService;
import com.green.light.model.service.IDepartmentService;
import com.green.light.model.service.IEmployeeService;
import com.green.light.vo.ApprJstreeVo;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class DraftController {
	
	
	@Autowired
	private IApprovalService ApprService;
	
	@Autowired
	private IDepartmentService DeptService;
	
	@GetMapping(value = "/draftWriteForm.do")
	public String draftWriteForm() {
		log.info("DraftController GET /draftWriteForm.do 기안서 작성 Form");

    return "draftWriteForm";
	}
  
  @GetMapping(value = "/draftForm.do")
	public String draftForm(HttpSession session, Model model) {
		log.info("DraftController GET /draftForm.do 기안서 작성 Form");
		EmployeeVo empVo = (EmployeeVo)session.getAttribute("loginVo");
		String deptno = empVo.getDeptno();
		DepartmentVo deptVo = DeptService.getOneDept(deptno);
		model.addAttribute("deptVo", deptVo);
    
    return "draftForm";
  }
	
	@GetMapping(value = "/apprJstreeView.do")
    @ResponseBody
    public String apprJstreeView() {
       log.info("DraftController apprJstreeView.do 요청");
       List<ApprJstreeVo> lists = ApprService.getAllApprJstreeView();
       
       Gson gson = new GsonBuilder().create();
       String result = gson.toJson(lists);
       
       return result;
    }
	
	@GetMapping(value = "/selectDeptMgrByDept.do")
	@ResponseBody
	public DepartmentVo selectDeptMgrByDept(@RequestParam String deptno) {
		log.info("DraftController GET selectDeptMgrByDept.do 인사부서장 조회 : {}", deptno);
		DepartmentVo vo = DeptService.selectDeptMgrByDept(deptno);
		System.out.println("-----------------------------------------------------"+vo);
		return vo;
	}
	
	@GetMapping(value = "/selectDrafterDeptMgr.do")
	@ResponseBody
	public DepartmentVo selectDrafterDeptMgr(@RequestParam String id) {
		log.info("DraftController GET selectDrafterDeptMgr.do 기안자 부서장 조회 : {}", id);
		DepartmentVo vo = DeptService.selectDrafterDeptMgr(id);
		System.out.println("-----------------------------------------------------"+vo);
		return vo;
	}

}

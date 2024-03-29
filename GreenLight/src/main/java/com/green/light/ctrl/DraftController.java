package com.green.light.ctrl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.green.light.model.service.IApprovalService;
import com.green.light.model.service.IDepartmentService;
import com.green.light.model.service.IEmployeeService;
import com.green.light.vo.ApprJstreeVo;
import com.green.light.vo.ApprovalVo;
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
	public String draftWriteForm(HttpSession session, Model model) {
		log.info("DraftController GET /draftWriteForm.do 기안서 작성 Form");
		EmployeeVo empVo = (EmployeeVo)session.getAttribute("loginVo");
		String deptno = empVo.getDeptno();
		DepartmentVo deptVo = DeptService.getOneDept(deptno);
		model.addAttribute("deptVo", deptVo);

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
	
	@GetMapping(value = "/autoAppr.do")
	@ResponseBody
	public List<DepartmentVo> autoAppr(@RequestParam String sessionId, @RequestParam String tempcode) {
		log.info("DraftController GET autoAppr.do 자동결재선 조회 : {},{}", sessionId, tempcode);
		List<DepartmentVo> lists = new ArrayList<DepartmentVo>();
		
		if("01".equals(tempcode)) {
			DepartmentVo vo1 = DeptService.selectDrafterDeptMgr(sessionId);
			lists.add(vo1);
			DepartmentVo vo2 = DeptService.selectDeptMgrByDept("09");
			lists.add(vo2);
			System.out.println("-------------------------------------"+lists);
		} else if("02".equals(tempcode)) {
			DepartmentVo vo1 = DeptService.selectDrafterDeptMgr(sessionId);
			lists.add(vo1);
			DepartmentVo vo2 = DeptService.selectDeptMgrByDept("02");
			lists.add(vo2);
			System.out.println("-------------------------------------"+lists);
		} else if("03".equals(tempcode)) {
			DepartmentVo vo1 = DeptService.selectDrafterDeptMgr(sessionId);
			lists.add(vo1);
			DepartmentVo vo2 = DeptService.selectDeptMgrByDept("09");
			lists.add(vo2);
			System.out.println("-------------------------------------"+lists);
		} else {
			System.out.println("안돼용");
		}
		return lists;
	}
	
	@PostMapping(value = "/insertApproval.do")
	@ResponseBody
	public ResponseEntity<?> insertApproval(@RequestBody List<Map<String, Object>> list){
		System.out.println("-----------------------------"+list);
//		List<String> emp_id = list.get(0)
//		System.out.println("-------"+ emp_id);
//		Object orderno = list.get("orderno");
//		String writer_id = (String) map.get("writer_id");
//		String docno = (String) map.get("docno");
//		 if (emp_id instanceof String) {
//		        System.out.println("String임");
//		    } else {
//		        System.out.println("String아님");
//		    }
		return null;
	}
	
	
}

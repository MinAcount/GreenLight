package com.green.light.model.service;

import java.util.List;

import com.green.light.vo.ApprJstreeVo;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.EmployeeVo;

public interface IApprovalService {
	
	public EmployeeVo selectCEO();
	
	// 결재선 설정을 위한 jstree view 조회 
	public List<ApprJstreeVo> getAllApprJstreeView();
}

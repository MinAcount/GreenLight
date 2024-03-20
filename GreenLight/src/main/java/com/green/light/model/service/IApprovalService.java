package com.green.light.model.service;

import com.green.light.vo.EmployeeVo;

public interface IApprovalService {
	public EmployeeVo selectDrafterDeptMgr(String id);
	public EmployeeVo selectDeptMgrByDept(String deptno);
}

package com.green.light.model.mapper;

import com.green.light.vo.EmployeeVo;

public interface IApprovalDao {
	public EmployeeVo selectDrafterDeptMgr(String id);
	public EmployeeVo selectDeptMgrByDept(String deptno);
}

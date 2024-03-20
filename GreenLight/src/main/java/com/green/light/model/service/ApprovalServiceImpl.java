package com.green.light.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.light.model.mapper.IApprovalDao;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ApprovalServiceImpl implements IApprovalService {
	@Autowired
	private IApprovalDao dao;
	
	@Override
	public EmployeeVo selectDrafterDeptMgr(String id) {
		log.info("ApprovalServiceImpl selectDrafterDeptMgr 기안자의 부서장 조회 : {}", id);
		return dao.selectDrafterDeptMgr(id);
	}
	
	@Override
	public EmployeeVo selectDeptMgrByDept(String deptno) {
		log.info("ApprovalServiceImpl selectDeptMgrByDept 부서별 부서장 조회 : {}", deptno);
		return dao.selectDeptMgrByDept(deptno);
	}
}

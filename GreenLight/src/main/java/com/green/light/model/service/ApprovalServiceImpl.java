package com.green.light.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.light.model.mapper.IApprovalDao;
import com.green.light.vo.ApprJstreeVo;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ApprovalServiceImpl implements IApprovalService {
	@Autowired
	private IApprovalDao dao;
	
	@Override
	public EmployeeVo selectDrafterDeptMgr(String id) {
		log.info("ApprovalServiceImpl selectDrafterDeptMgr 자동결재선 기안자의 부서장 조회 : {}", id);
		return dao.selectDrafterDeptMgr(id);
	}
	
	@Override
	public EmployeeVo selectDeptMgrByDept(String deptno) {
		log.info("ApprovalServiceImpl selectDeptMgrByDept 자동결재선 부서별 부서장 조회 : {}", deptno);
		return dao.selectDeptMgrByDept(deptno);
	}
	
	@Override
	public EmployeeVo selectCEO() {
		log.info("ApprovalServiceImpl selectCEO 자동결재선 대표이사 조회");
		return dao.selectCEO();
	}

	@Override
	public List<ApprJstreeVo> getAllApprJstreeView() {
		log.info("ApprovalServiceImpl getAllApprJstreeView 결재선 설정을 위한 jstree view 조회");
		return dao.getAllApprJstreeView();
	}
}

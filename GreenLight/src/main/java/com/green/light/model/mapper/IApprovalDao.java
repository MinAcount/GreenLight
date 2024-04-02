package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import com.green.light.vo.ApprJstreeVo;
import com.green.light.vo.ApprovalVo;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.DocumentVo;
import com.green.light.vo.EmployeeVo;

public interface IApprovalDao {
	
	
	public EmployeeVo selectCEO();
	
	// 결재선 설정을 위한 jstree view 조회 
	public List<ApprJstreeVo> getAllApprJstreeView();
	
	// 결재자 추가
	public int insertApproval(ApprovalVo  apprVo);
	
	// 결재선 조회
	public List<EmployeeVo> getApproval(String docno);
	
	// 참조자 조회
	public List<EmployeeVo> getReference(String docno);
}

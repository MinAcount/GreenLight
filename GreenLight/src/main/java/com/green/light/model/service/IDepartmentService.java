package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import com.green.light.vo.DepartmentVo;
import com.green.light.vo.EmployeeVo;

public interface IDepartmentService {
//	부서 전체 조회	getAllDept
	public List<DepartmentVo> getAllDept();
//	부서 상세 조회	getOneDept
	public DepartmentVo getOneDept(String deptno);
//	본부별 부서 조회	getDeptByHead
	public List<DepartmentVo> getDeptByHead(String headno);
//	부서명 수정	updateDeptName
	public int updateDeptName(Map<String, Object> map);
//	부서 등록	insertDept
	public int insertDept(Map<String, Object> map);
//	부서 삭제	updateDeptDelete
	public int updateDeptDelete(String deptno);
//	부서 완전 삭제	deleteDept
	public int deleteDept(String deptno);
//	부서 복구	restoreDept
	public int restoreDept(String deptno);
//	부서장 등록 및 변경	updateDeptMgr
	public boolean updateDeptMgr(Map<String, Object> map);
	
// 인사부서장 조회
	public DepartmentVo selectDeptMgrByDept(String deptno);
	
// 기안자부서장 조회
	public DepartmentVo selectDrafterDeptMgr(String id);
}

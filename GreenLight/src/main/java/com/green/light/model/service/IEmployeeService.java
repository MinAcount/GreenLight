package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import com.green.light.vo.EmployeeVo;

public interface IEmployeeService {
	
//	로그인 및 로그인횟수 증가 혹은 초기화	getLogin
	public EmployeeVo getLogin(Map<String, Object> Map);
//	비밀번호 찾기	getPassword
	public EmployeeVo getPassword(Map<String, Object> map);
//	비밀번호 변경	updatePassword
	public int updatePassword(Map<String, Object> map);
	
//	직원 전체 조회	getAllEmployee
	public List<EmployeeVo> getAllEmployee();
//	직원 상세 조회	getOneEmployee
	public EmployeeVo getOneEmployee(String id);
//	직원 재직상태별 조회	getAllEmployeeByStatus
	public List<EmployeeVo> getAllEmployeeByStatus(String estatus);
//	직원 검색	getEmployeeBySearch
	public List<EmployeeVo> getEmployeeBySearch(String option);
//	직원 정보 수정	updateEmployee
	public boolean updateEmployee(EmployeeVo vo);
//	직원 퇴사 처리	updateExit
	public boolean updateExit(Map<String, Object> map, String id);
//	퇴사일 수정	updateEmployeeExitDay
	public int updateEmployeeExitDay(Map<String, Object> map);
//	직원 입사 처리	insertEmployee
	public boolean insertEmployee(EmployeeVo vo);
//	부서장 후보 조회	getDeptMgrHubo
	public List<EmployeeVo> getDeptMgrHubo(String deptno);
//	본부장 후보 조회	getHeadMgrHubo
	public List<EmployeeVo> getHeadMgrHubo(String headno);
}

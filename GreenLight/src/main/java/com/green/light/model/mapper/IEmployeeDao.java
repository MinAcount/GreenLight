package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import com.green.light.vo.EmployeeVo;

public interface IEmployeeDao {
	
//	로그인	getLogin
	public EmployeeVo getLogin(Map<String, Object> map);
//	로그인 시도 횟수 증가 및 초기화	updateFail
	public int updateFail(Map<String, Object> map);
//	로그인 시도 횟수 조회  getLoginFail
	public EmployeeVo getLoginFail(String id);
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
//	직원 정보 수정	updateOneEmployee
	public int updateOneEmployee(EmployeeVo vo);
//	직원 퇴사 처리	updateExitEmployee
	public int updateExitEmployee(Map<String, Object> map);
//	퇴사일 수정	updateEmployeeExitDay
	public int updateEmployeeExitDay(Map<String, Object> map);
//	부서 발령신청서에 의한 부서 변경	updateEmployeeDept
	public int updateEmployeeDept(Map<String, Object> map);
//	직원 입사 처리	insertEmployee
	public int insertEmployee(EmployeeVo vo);
//	부서장 후보 조회	getDeptMgrHubo
	public List<EmployeeVo> getDeptMgrHubo(String deptno);
//	본부장 후보 조회	getHeadMgrHubo
	public List<EmployeeVo> getHeadMgrHubo(String headno);
	
	// 결재선 조회
	public List<EmployeeVo> getApproval(String docno);
}

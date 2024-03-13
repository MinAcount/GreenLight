package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import com.green.light.vo.EmployeeVo;

public interface IEmployeeDao {
	
//	로그인	getLogin
	public EmployeeVo getLogin(Map<String, Object> map);
//	로그인 시도 횟수 증가 및 초기화	updateFail
	public int updateFail(Map<String, Object> map);
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
//	직원 정보 수정	updateOneEmployee
	public int updateOneEmployee(EmployeeVo vo);
//	권한 변경	updateEmployeeAuth
	public int updateEmployeeAuth(Map<String, Object> map);
//	직원 퇴사 처리	updateExitEmployee
	public int updateExitEmployee(Map<String, Object> map);
//	퇴사일 수정	updateEmployeeExitDay
	public int updateEmployeeExitDay(Map<String, Object> map);
//	직원 입사 처리	isertEmployee
	public int isertEmployee(EmployeeVo vo);
}

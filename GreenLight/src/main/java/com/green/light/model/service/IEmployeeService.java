package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import com.green.light.vo.EmployeeVo;

public interface IEmployeeService {
	
//	로그인 및 로그인횟수 증가 혹은 초기화	getLogin
	public boolean getLogin(Map<String, Object> Map);
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

}

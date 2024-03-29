package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import com.green.light.vo.EmployeeVo;
import com.green.light.vo.VacationVo;

public interface IVacationService {
	
//	"휴가사용내역월별조회"	selectVacationHistory
	public List<VacationVo> selectVacationHistory(VacationVo vo);
	
//	"직원 전체	휴가 조회"	selectAllEmployeeVacation
	public List<VacationVo> selectAllEmployeeVacation(Map<String, Object> map);
	
//	"월 잔여 	휴가갯수"	selectRemainingLeaveByMonth
	public VacationVo selectRemainingLeaveByMonth(Map<String, Object> map);
	
	
//	휴가사용등록	registerVacation
	public int registerVacation(VacationVo vo);
	
//	연차부여	grantLeave
	public int grantLeave(Map<String, Object> map);
	
//	연차조정	adjustLeave
	public int adjustLeave(Map<String, Object> map);
	
//	연차 조정 + 부여 updateLeave
	public int updateLeave(Map<String, Object> map);

}

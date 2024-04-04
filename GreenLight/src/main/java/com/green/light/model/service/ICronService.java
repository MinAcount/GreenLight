package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import com.green.light.vo.AttendanceVo;
import com.green.light.vo.VacationVo;

public interface ICronService {
	
	public List<VacationVo>  getOverVacation();
	
	public int insertOverVacation(Map<String, Object> map);
	
	public int OverVacationMediate();
	
	public int updateLeaveNewEmployee();
	
	public int updateLeaveEmployee();
	
//	작일 직원휴가상태조회	getEmpVacationStatus
	public List<VacationVo> getEmpVacationStatus();
	
//	작일 출근현황조회	getEmpAttendanceStatus
	public AttendanceVo getEmpAttendanceStatus(String id);
	
//	작일 휴가자 근태등록	insertVacationAttendance
	public int insertVacationAttendance(AttendanceVo vo);
	
//	작일 휴가자 근태수정	updateVacationAttendance
	public int updateVacationAttendance(AttendanceVo vo);
	
//	휴가자 자동 크론설정
	public int setVacationAndAttendance();
	

}

package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import com.green.light.vo.AttendainceVo;

public interface IAttendanceDao {
	
	
//	출근	insertAttendanceRecord()
	public int insertAttendanceRecord(String id);
	
//	퇴근	updateAttendanceOutTime()
	public int updateAttendanceOutTime(String id);
	
//	자동퇴근처리	autoCompleteWorkTime() cron으로 돌릴 예정
	public int autoCompleteWorkTime();
	
//	출퇴근시간 수정	updateAttendanceTime()
	public int updateAttendanceTime(Map<String, Object> map);
	
//	근무상태등록	updateWorkStatus()
	public int updateWorkStatus(AttendainceVo attendainceVo);
	
//	근태연차처리	insertLeaveRecord() 연차 들어갈떄 사용하기
	public int insertLeaveRecord(AttendainceVo attendainceVo);
	
//	전체조회-관리자	getEmployeeAttendance()
	public List<AttendainceVo> getEmployeeAttendance();
	
//	상세조회	getEmployeeDetails()
	public AttendainceVo getEmployeeDetails(AttendainceVo attendainceVo);
	

}
package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.light.model.mapper.IAttendanceDao;
import com.green.light.vo.AttendanceVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AttendanceServiceImpl implements IAttendanceService {

	@Autowired
	private IAttendanceDao dao;

	@Override
	public int insertAttendanceRecord(String id) {
		log.info("AttendanceServiceImpl insertAttendanceRecord 전달받은 id : {}", id);
		return dao.insertAttendanceRecord(id);
	}

	@Override
	public int updateAttendanceOutTime(String id) {
		log.info("AttendanceServiceImpl updateAttendanceOutTime 전달받은 id : {}", id);
		return dao.updateAttendanceOutTime(id);
	}

	@Override
	public int autoCompleteWorkTime() {
		log.info("AttendanceServiceImpl autoCompleteWorkTime");
		return dao.autoCompleteWorkTime();
	}

	@Override
	public int updateAttendanceTime(Map<String, Object> map) {
		log.info("AttendanceServiceImpl updateAttendanceTime 전달받은 값 : {} ", map);
		return dao.updateAttendanceTime(map);
	}

	@Override
	public int updateWorkStatus(AttendanceVo attendainceVo) {
		log.info("AttendanceServiceImpl updateWorkStatus 전달받은 값 : {} ", attendainceVo);
		return dao.updateWorkStatus(attendainceVo);
	}

	@Override
	public int insertLeaveRecord(AttendanceVo attendainceVo) {
		log.info("AttendanceServiceImpl insertLeaveRecord 전달받은 값 : {}", attendainceVo);
		return dao.insertLeaveRecord(attendainceVo);
	}

	@Override
	public List<AttendanceVo> getEmployeeAttendance() {
		log.info("AttendanceServiceImpl getEmployeeAttendance");
		return dao.getEmployeeAttendance();
	}

	@Override
	public AttendanceVo getEmployeeDetails(AttendanceVo attendainceVo) {
		log.info("AttendanceServiceImpl getEmployeeDetails 전달받은 값 : {}", attendainceVo);
		return dao.getEmployeeDetails(attendainceVo);
	}
	
}


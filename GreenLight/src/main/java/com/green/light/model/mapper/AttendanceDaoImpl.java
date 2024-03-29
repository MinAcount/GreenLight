package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.green.light.vo.AttendanceVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AttendanceDaoImpl implements IAttendanceDao {
	
	
	@Autowired
	private SqlSessionTemplate session;
	
	private final String NS = "com.green.light.model.mapper.AttendanceDaoImpl.";

	@Override
	public int insertAttendanceRecord(String id) {
		log.info("AttendanceDaoImpl insertAttendanceRecord 출근등록");
		return session.insert(NS+"insertAttendanceRecord", id);
	}

	@Override
	public int updateAttendanceOutTime(String id) {
		log.info("AttendanceDaoImpl updateAttendanceOutTime 퇴근등록");
		return session.update(NS+"updateAttendanceOutTime", id);
	}

	
	@Override
	public int autoCompleteWorkTime() {
		log.info("AttendanceDaoImpl autoCompleteWorkTime 자동퇴근처리");
		return session.update(NS+"autoCompleteWorkTime");
	}

	@Override
	public int updateAttendanceTime(Map<String, Object> map) {
		log.info("AttendanceDaoImpl updateAttendanceTime 출퇴근시간 수정");
		return session.update(NS+"updateAttendanceTime", map);
	}

	@Override
	public int updateWorkStatus(AttendanceVo attendainceVo) {
		log.info("AttendanceDaoImpl updateWorkStatus 근무상태 등록");
		return session.update(NS+"updateWorkStatus", attendainceVo);
	}

	@Override
	public int insertLeaveRecord(AttendanceVo attendainceVo) {
		log.info("AttendanceDaoImpl insertLeaveRecord 근태연차처리");
		return session.insert(NS+"insertLeaveRecord", attendainceVo);
	}

	@Override
	public List<AttendanceVo> getEmployeeAttendance(String in_date) {
		log.info("AttendanceDaoImpl getEmployeeAttendance 전체조회-관리자");
		return session.selectList(NS+"getEmployeeAttendance",in_date);
	}

	@Override
	public List<AttendanceVo> getEmployeeDetails(AttendanceVo attendainceVo) {
		log.info("AttendanceDaoImpl getEmployeeDetails 근무상태 등록");
		return session.selectList(NS+"getEmployeeDetails",attendainceVo);
	}

	@Override
	public AttendanceVo getAttendance(AttendanceVo attendainceVo) {
		log.info("AttendanceDaoImpl getAttendance 출근시간 및 퇴근시간");
		return session.selectOne(NS+"getAttendance",attendainceVo);
	}
	
	
}

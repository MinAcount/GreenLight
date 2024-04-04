package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.green.light.vo.AttendanceVo;
import com.green.light.vo.VacationVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class CronDaoImpl implements ICronDao{
	
	@Autowired
	private SqlSessionTemplate session;
	
	private final String NS = "com.green.light.model.mapper.CronDaoImpl.";

	
	
	@Override
//	@Scheduled(cron="0/10 * * * * *")//10초에 한번씩
	@Scheduled(cron = "0 0 1 * * *")//오전 1시에 한번
	public int autoCompleteWorkTime() {
		log.info("CronDaoImpl autoCompleteWorkTime 자동퇴근처리 크론");
		return session.update(NS+"autoCompleteWorkTime");
	}
	
	@Override
	public List<VacationVo> getOverVacation() {
		log.info("CronDaoImpl getOverVacation 마이너스연차 발생 직원 조회 크론");
		return session.selectList(NS+"getOverVacation");
	}
	
	@Override
	public int insertOverVacation(Map<String, Object> map) {
		log.info("CronDaoImpl insertOverVacation 연차초과사용분 조정 크론");
		return session.insert(NS+"insertOverVacation", map);
	}
	
	@Override
	public int updateLeaveNewEmployee() {
		log.info("CronDaoImpl updateLeaveNewEmployee 1년 미만 직원 연차 부여 크론");
		return session.update(NS+"updateLeaveNewEmployee");
	}

	@Override
	public int updateLeaveEmployee() {
		log.info("CronDaoImpl updateLeaveEmployee 1년 이상 근속직원 연차부여 크론");
		return session.update(NS+"updateLeaveEmployee");
	}

	@Override
	public List<VacationVo> getEmpVacationStatus() {
		log.info("CronDaoImpl getEmpVacationStatus 작일 직원 휴가 상태 조회");
		return session.selectList(NS+"getEmpVacationStatus");
	}

	@Override
	public AttendanceVo getEmpAttendanceStatus(String id) {
		log.info("CronDaoImpl getEmpAttendanceStatus 작일 직원 휴가 상태 조회");
		return session.selectOne(NS+"getEmpAttendanceStatus", id);
	}

	@Override
	public int insertVacationAttendance(AttendanceVo vo) {
		log.info("CronDaoImpl insertVacationAttendance 휴가직원 근태 자동등록");
		return session.insert(NS+"insertVacationAttendance", vo);
	}

	@Override
	public int updateVacationAttendance(AttendanceVo vo) {
		log.info("CronDaoImpl updateVacationAttendance 휴가직원 근태 자동변경");
		return session.update(NS+"updateVacationAttendance", vo);
	}
	
}

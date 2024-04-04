package com.green.light.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.light.model.mapper.ICronDao;
import com.green.light.vo.AttendanceVo;
import com.green.light.vo.VacationVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CronServiceImpl implements ICronService {
	
	@Autowired
	private ICronDao dao;

	@Override
	public List<VacationVo> getOverVacation() {
		log.info("CronServiceImpl getOverVacation 서비스 크론");
		return dao.getOverVacation();
	}

	@Override
	public int insertOverVacation(Map<String, Object> map) {
		log.info("CronServiceImpl insertOverVacation 서비스 크론");
		return dao.insertOverVacation(map);
	}

	
	@Transactional(readOnly = false)
	@Override
//	@Scheduled(cron="0/10 * * * * *")//10초에 한번씩
	@Scheduled(cron = "0 10 1 * * *")//오전 1시 10분에 설정 
	public int OverVacationMediate() {
		log.info("CronServiceImpl OverVacationMediate 트렌젝션 처리(get/insert)");
		List<VacationVo> vo = dao.getOverVacation();
		Map<String, Object> map = new HashMap<String, Object>();
		int cnt = 0;
		for (int i = 0; i < vo.size(); i++) {
			String id = vo.get(i).getId();
			float remaining_leave = vo.get(i).getRemaining_leave();
			remaining_leave = Math.abs(remaining_leave);
			map.put("id", id);
			map.put("getsu", remaining_leave);
			cnt += dao.insertOverVacation(map);
		}
		System.out.println(cnt);
		return cnt;
	}
	
	
	@Scheduled(cron = "0 20 1 * * *")//오전 1시 20분에 설정 
//	@Scheduled(cron="0/10 * * * * *")//10초에 한번씩
	@Override
	public int updateLeaveNewEmployee() {
		log.info("CronDaoImpl updateLeaveNewEmployee 1년 미만 직원 연차 부여 크론");
		return dao.updateLeaveNewEmployee();
	}
	
	
	@Scheduled(cron = "0 30 1 * * *")//오전 1시 30분에 설정 
//	@Scheduled(cron="0/10 * * * * *")//10초에 한번씩
	@Override
	public int updateLeaveEmployee() {
		log.info("CronDaoImpl updateLeaveEmployee 1년 이상 근속직원 연차부여 크론");
		return dao.updateLeaveEmployee();
	}

	@Override
	public List<VacationVo> getEmpVacationStatus() {
		log.info("CronDaoImpl getEmpVacationStatus 작일 직원휴가상태조회 크론");
		return dao.getEmpVacationStatus();
	}

	@Override
	public AttendanceVo getEmpAttendanceStatus(String id) {
		log.info("CronDaoImpl getEmpAttendanceStatus 작일 출근현황조회 전달받은 id : {} 크론 ",id);
		return dao.getEmpAttendanceStatus(id);
	}

	@Override
	public int insertVacationAttendance(AttendanceVo vo) {
		log.info("CronDaoImpl insertVacationAttendance 작일 휴가자 근태등록 전달받은 값 : {} 크론 ",vo);
		return dao.insertVacationAttendance(vo);
	}

	@Override
	public int updateVacationAttendance(AttendanceVo vo) {
		return dao.updateVacationAttendance(vo);
	}
	
	// 휴가자의 자동근태등록 트렌젝션 처리
	@Transactional(readOnly = false)
	@Override
	public int setVacationAndAttendance() {
		log.info("CronDaoImpl setVacationAndAttendance 휴가자의 자동 근태 등록 트렌젝션 처리 크론");
		
		
		
		return 0;
	}
	
	

}

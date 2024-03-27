package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.light.model.mapper.IScheduleDao;
import com.green.light.vo.ScheduleVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ScheduleServiceImpl implements IScheduleService{

	@Autowired
	private IScheduleDao dao;
	
	@Transactional(readOnly = true)
	@Override
	public List<ScheduleVo> monthSchedule(String userId) {
		log.info("ScheduleServiceImpl monthSchedule 월별 일정 조회");
		return dao.monthSchedule(userId);
	}

	@Override
	public List<ScheduleVo> weekSchedule(String userId) {
		log.info("ScheduleServiceImpl weekSchedule 주별 일정 조회");
		return dao.weekSchedule(userId);
	}

	@Override
	public ScheduleVo daySchedule(String schedule_id) {
		log.info("ScheduleServiceImpl daySchedule 일별 일정 조회");
		return dao.daySchedule(schedule_id);
	}

	@Override
	public int insertSchedule(ScheduleVo vo) {
		log.info("ScheduleServiceImpl insertSchedule 일정 등록");
		return dao.insertSchedule(vo);
	}

	@Override
	public int updateSchedule(ScheduleVo vo) {
		log.info("ScheduleServiceImpl updateSchedule 일정 수정");
		return dao.updateSchedule(vo);
	}

	@Override
	public int deleteSchedule(String schedule_id) {
		log.info("ScheduleServiceImpl deleteSchedule 일정 삭제");
		return dao.deleteSchedule(schedule_id);
	}

}

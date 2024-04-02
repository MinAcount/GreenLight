package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

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

}

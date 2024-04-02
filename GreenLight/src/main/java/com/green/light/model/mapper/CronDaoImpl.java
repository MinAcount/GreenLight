package com.green.light.model.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
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
	
	

}

package com.green.light.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.light.model.mapper.ICronDao;
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

}

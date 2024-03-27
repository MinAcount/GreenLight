package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.ScheduleVo;

@Repository
public class ScheduleDaoImpl implements IScheduleDao{
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private final String NS = "com.green.light.model.mapper.ScheduleDaoImpl.";

	@Override
	public List<ScheduleVo> monthSchedule(String userId) {
		return sqlsession.selectList(NS+"monthSchedule", userId);
	}

	@Override
	public List<ScheduleVo> weekSchedule(String userId) {
		return sqlsession.selectList(NS+"weekSchedule", userId);
	}

	@Override
	public ScheduleVo daySchedule(String schedule_id) {
		return sqlsession.selectOne(NS+"daySchedule", schedule_id);
	}

	@Override
	public int insertSchedule(ScheduleVo vo) {
		return sqlsession.insert(NS+"insertSchedule", vo);
	}

	@Override
	public int updateSchedule(ScheduleVo vo) {
		return sqlsession.update(NS+"updateSchedule", vo);
	}

	@Override
	public int deleteSchedule(String schedule_id) {
		return sqlsession.delete(NS+"deleteSchedule", schedule_id);
	}

}

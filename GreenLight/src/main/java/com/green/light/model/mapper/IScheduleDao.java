package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import com.green.light.vo.ScheduleVo;

public interface IScheduleDao {

	//월별조회
	public List<ScheduleVo> monthSchedule(Map<String, Object> map);
	//주별조회
	public List<ScheduleVo> weekSchedule(String userId);
	//상세조회
	public ScheduleVo daySchedule(String schedule_id);
	//일정등록
	public int insertSchedule(ScheduleVo vo);
	//일정수정
	public int updateSchedule(ScheduleVo vo);
	//일정삭제
	public int deleteSchedule(String schedule_id);
}

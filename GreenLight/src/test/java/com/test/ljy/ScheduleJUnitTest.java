package com.test.ljy;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.google.gson.Gson;
import com.green.light.model.service.IScheduleService;
import com.green.light.vo.EmployeeVo;
import com.green.light.vo.ScheduleVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class ScheduleJUnitTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private IScheduleService service;
	
	@Before
	public void test() {
		assertNotNull(sqlSessionTemplate);
	}
	
	@Test
	public void MonthScheduleTest() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", "2312120601");
		map.put("viewmonth","2024-03");
		List<ScheduleVo> lists = service.monthSchedule(map);
		System.out.println(lists);
		assertNotNull(lists);
	}
	
//	@Test
	public void WeekScheduleTest() {
		String userId = "2312120601";
		List<ScheduleVo> lists = service.weekSchedule(userId);
		System.out.println(lists);
		assertNotNull(lists);
	}
	
//	@Test
	public void dayScheduleTest() {
		String schedule_id = "S240328004";
		ScheduleVo vo = service.daySchedule(schedule_id);
		System.out.println(vo);
		assertNotNull(vo);
	}
	
//	@Test
	public void InsertScheduleTest() throws ParseException {
		ScheduleVo vo = new ScheduleVo();
		vo.setCno("2303100101");
		vo.setCreator("이지원");
		vo.setPhone("010-2108-5900");
		vo.setUsertype("부서일정");
		vo.setCategory("04");
		vo.setTitle("거래처 미팅");
		vo.setMemo("거래처 관련 미팅");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date startDate = dateFormat.parse("2024-05-03 14:00:00");
		vo.setStart_date(startDate);
		Date endDate = dateFormat.parse("2024-05-03 18:00:00");
		vo.setEnd_date(endDate);
		
		vo.setLocation("회의실6");
		vo.setPriority("04");
		vo.setRecur("N");
		vo.setVisibility("Y");
		
		List<EmployeeVo> participantList = new ArrayList<EmployeeVo>();
		participantList.add(new EmployeeVo("2312120601", "임주영"));
		participantList.add(new EmployeeVo("2403110901", "김태민"));
		participantList.add(new EmployeeVo("2402110501", "배강훈"));
		participantList.add(new EmployeeVo("2401110301", "이성민"));
        Gson gson = new Gson();
        String json = gson.toJson(participantList);
        vo.setParticipants(json);
        
		vo.setPermission("R");
		vo.setAlarm("08");
		
		int cnt = service.insertSchedule(vo);
		assertEquals(1, cnt);
	}
	
//	@Test
	public void UpdateScheduleTest() throws ParseException {
		ScheduleVo vo = new ScheduleVo();
		vo.setSchedule_id("S240220004");
		vo.setPhone("010-3213-2213");
		vo.setUsertype("부서일정");
		vo.setCategory("02");
		vo.setTitle("운영팀 워크샵");
		vo.setMemo("겨울 강원도 워크샵");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date startDate = dateFormat.parse("2024-12-12 14:23:00");
		vo.setStart_date(startDate);
		Date endDate = dateFormat.parse("2024-12-15 14:00:00");
		vo.setEnd_date(endDate);
		
		vo.setLocation("강릉");
		vo.setPriority("01");
		vo.setRecur("Y");
		vo.setVisibility("N");
		
		List<EmployeeVo> participantList = new ArrayList<EmployeeVo>();
		participantList.add(new EmployeeVo("2303100101", "이지원"));
		participantList.add(new EmployeeVo("2403110901", "김태민"));
        Gson gson = new Gson();
        String json = gson.toJson(participantList);
        vo.setParticipants(json);
        
		vo.setPermission("R");
		vo.setAlarm("03");
		
		int cnt = service.updateSchedule(vo);
		assertEquals(1, cnt);
	}
	
//	@Test
	public void DeleteScheduleTest() {
		String schedule_id = "S240212001";
		int cnt = service.deleteSchedule(schedule_id);
		assertEquals(1, cnt);
	}
}

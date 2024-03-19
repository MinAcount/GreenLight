package com.test.ljy;

import static org.junit.Assert.*;

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

import com.green.light.model.service.IConferenceService;
import com.green.light.vo.ConferenceVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ConferenceJUnitTest {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private IConferenceService service;
	
	@Before
	public void test() {
		assertNotNull(sqlSessionTemplate);
	}
	
	@Test
	public void AllRoomTest() {
		List<ConferenceVo> lists = service.getAllRoom();
		System.out.println(lists);
		assertNotNull(lists);
	}
	
	@Test
	public void OneRoomTest() {
		String conf_id = "F5_001_501";
		ConferenceVo vo = service.getOenRoom(conf_id);
		System.out.println(vo);
		assertNotNull(vo);		
	}
	
//	@Test
	public void InsertRoomTest() {
		ConferenceVo vo = new ConferenceVo();
		vo.setCname("여분회의실");
		vo.setCapacity(32);
		vo.setHo("424호");
		vo.setRoominfo("여분회의실, 인테리어예정");
		int cnt = service.insertRoom(vo);
		assertNotNull(cnt);
	}
	
//	@Test
	public void UpdateRoomTest() {
		ConferenceVo vo = new ConferenceVo();
		vo.setConf_id("F5_001_501");
		vo.setCname("회의실 Q");
		vo.setCapacity(200);
		vo.setAvailability("N");
		vo.setRoominfo("누수로 사용불가");
		int cnt = service.updateRoom(vo);
		assertNotNull(cnt);
	}
	
}

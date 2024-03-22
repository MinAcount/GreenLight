package com.test.ktm;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.service.IAttendanceService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class AttendanceJUnitTest {
	
	
	@Autowired
	private IAttendanceService service;
	
	@Test
	public void AttTest() {
		
		String id = "2403110901";
//		service.insertAttendanceRecord(id);
		
//		service.updateAttendanceOutTime(id);
		
//		service.autoCompleteWorkTime();
		Date inDate = new Date();
		Date outDate = new Date(System.currentTimeMillis() + 3600 * 1000);
		SimpleDateFormat dat = new SimpleDateFormat();
		System.out.println();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("in_date", inDate);
		map.put("out_date", outDate);
		map.put("id", id);
		map.put("day","");
		service.updateAttendanceTime(map);
		
		
		
	}

}

package com.test.ktm;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.service.IAttendanceService;
import com.green.light.vo.AttendanceVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class AttendanceJUnitTest {
	
	
	@Autowired
	private IAttendanceService service;
	
	@Test
	public void AttTest() throws ParseException {
		
		String id = "2403110901";
//		service.insertAttendanceRecord(id);
		
//		service.updateAttendanceOutTime(id);
		
//		service.autoCompleteWorkTime();
		
        String inDateString = "2024-03-21 09:00";
        String outDateString = "2024-03-21 18:00";
//        String dayString = "2024-03-21";
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm");
        SimpleDateFormat dayFormat = new SimpleDateFormat("YYYY-MM-DD");
		
        Date inDate = dateFormat.parse(inDateString);
        Date outDate = dateFormat.parse(outDateString);
//        Date day = dayFormat.parse(dayString);
        
        
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("in_date", inDate);
//		map.put("out_date", outDate);
//		map.put("day",day);
//		map.put("id", id);
//		service.updateAttendanceTime(map);
		
		
//		AttendanceVo vo = new AttendanceVo();
//		vo.setIn_date(inDate);
//		vo.setAtt_status("지각");
//		vo.setId(id);
//		int updateWorkStatus = service.updateWorkStatus(vo);
//		assertEquals(0, updateWorkStatus);

		AttendanceVo vo = new AttendanceVo();
		vo.setIn_date(inDate);
//		vo.setAtt_status("지각");
		vo.setOut_date(outDate);
		vo.setId(id);
		int updateWorkStatus = service.insertLeaveRecord(vo);
		assertEquals(1, updateWorkStatus);

		
		
		
	}

}

package com.test.ktm;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
		
//		String id = "2403110901";
//		service.insertAttendanceRecord(id);// 출근버튼
		
//		String id = "2403110901";
//		service.updateAttendanceOutTime(id);//퇴근버튼
		
//		service.autoCompleteWorkTime();//퇴근 안찍은 직원 자동퇴근처리
		

//        Map<String, Object> parameterMap = new HashMap<>();
//        parameterMap.put("id", "2403110901");
//        parameterMap.put("in_date", "2024-03-13 10:00");
//        parameterMap.put("out_date", "2024-03-13 19:00");
//        parameterMap.put("day", "2024-03-13");
		
//        int rowsAffected = service.updateAttendanceTime(parameterMap);
//        assertEquals(1,rowsAffected);//출퇴근시간 수정
		
//		AttendanceVo vo = new AttendanceVo();
//		vo.setId("2403110901");
//		vo.setAtt_status("지각");
//		vo.setIn_date("2024-03-13");

//		service.updateWorkStatus(vo);//근무상태등록
		
//		AttendanceVo vo = new AttendanceVo();
//		vo.setId("2403110901");
//		vo.setAtt_status("지각");
//		vo.setIn_date("2024-03-15 09:00");
//		vo.setOut_date("2024-03-15 18:00");
//		service.insertLeaveRecord(vo);//
        
//		AttendanceVo parameterVo = new AttendanceVo();
//		parameterVo.setId("2303100101");
//		parameterVo.setIn_date("2024-03");
//		List<AttendanceVo> resultVo = service.getEmployeeDetails(parameterVo);
//		for (AttendanceVo attendance : resultVo) {
//			    System.out.println("ID: " + attendance.getId() + ", In_date: " + attendance.getIn_date());
//			}
//		assertNotNull(resultVo);
		AttendanceVo parameterVo = new AttendanceVo();
		parameterVo.setId("2303100101");
		parameterVo.setIn_date("2024-03-25");
		AttendanceVo attendanceVo =  service.getAttendance(parameterVo);
		System.out.println(attendanceVo);
		assertNotNull(parameterVo);
		
		
        
	}

}

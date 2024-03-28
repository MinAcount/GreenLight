package com.test.ktm;

import static org.junit.Assert.assertNotNull;

import java.text.ParseException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.green.light.model.service.IAttendanceService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
@WebAppConfiguration
public class AttendanceJUnitTest {
	
	
	@Autowired
	private IAttendanceService service;
	
	@Test
	public void AttTest() throws ParseException {
		
		String id = "2403110901";
		service.insertAttendanceRecord(id);// 출근버튼
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
//		vo.setAtt_status("조퇴");
//		vo.setOut_date("2024-03-26 09:30:41.000");
//		vo.setIn_date("2024-03-26");
//		System.out.println(vo);
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
//		AttendanceVo parameterVo = new AttendanceVo();
//		parameterVo.setId("2303100101");
//		parameterVo.setIn_date("2024-03-25");
//		AttendanceVo attendanceVo =  service.getAttendance(parameterVo);
//		System.out.println(attendanceVo);
//		assertNotNull(parameterVo);
		
		
//		String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//        AttendanceVo AVo = new AttendanceVo();
//        AVo.setId("2303100101");
//        AVo.setIn_date(currentDate.substring(0,10));
//        System.out.println("currentDate : "+currentDate.substring(0,10));
//        
//        AttendanceVo resultAVo = service.getAttendance(AVo);
//        System.out.println("getAttendance 직후 resultAVo :"+resultAVo);
//        resultAVo.setIn_date(currentDate.substring(0,10));
//        System.out.println("resultAVo.getIn_date :"+resultAVo.getIn_date());
//        System.out.println("resultAVo :"+resultAVo);
//        
//        if (resultAVo != null && resultAVo.getIn_date() != null) {
//        	System.out.println("-------------if문 탄다-----");
//            String inTime = resultAVo.getIn_date(); // 출근 시간의 시간 부분을 추출
//            String outTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm")); // 현재 시간을 HH:mm 형식으로 가져옴
//            
//            // 출퇴근 시간 비교하여 상태 설정
//            String status;
//            if (compareTime(inTime, "09:10") > 0 && compareTime(outTime, "17:50") < 0) {
//                status = "지각/조퇴";
//            } else if (compareTime(inTime, "09:10") > 0) {
//                status = "지각";
//            } else if (compareTime(outTime, "17:50") < 0) {
//                status = "조퇴";
//            } else {
//                status = "정상";
//            }
//            resultAVo.setIn_date(inTime);
//            resultAVo.setAtt_status(status);
//            System.out.println("updateWorkStatus resultAVo :"+resultAVo);
//            service.updateWorkStatus(resultAVo);
//            
//        }
//        
//	}
//
//    // 시간 비교 메서드
//    private int compareTime(String time1, String time2) {
//        return time1.compareTo(time2);
    }

}

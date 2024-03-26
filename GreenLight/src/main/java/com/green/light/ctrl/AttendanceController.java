package com.green.light.ctrl;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.green.light.model.service.IAttendanceService;
import com.green.light.vo.AttendanceVo;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AttendanceController {
	
	@Autowired
	private IAttendanceService service;
	
    @GetMapping("/in.do")
	public String in(HttpSession session) {
		log.info("AttendanceController in 출근등록");
		EmployeeVo EVo = (EmployeeVo)session.getAttribute("loginVo");
		System.out.println(EVo.getId());
		service.insertAttendanceRecord(EVo.getId());
		return "redirect:/main.do";
	}
	

//    @GetMapping("/out.do")
//	public String out(HttpSession session) {
//		log.info("AttendanceController out 퇴근등록");
//		EmployeeVo EVo = (EmployeeVo)session.getAttribute("loginVo");
//		String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//		service.updateAttendanceOutTime(EVo.getId());
//		
//		AttendanceVo AVo = new AttendanceVo();
//		AVo.setId(EVo.getId());
//		AVo.setIn_date(currentDate);
//		AttendanceVo resultAVo = service.getAttendance(AVo);
//		
//
//		
//		resultAVo.setAtt_status("");
//		return "redirect:/main.do";
//	}
    
    @GetMapping("/out.do")
    public String out(HttpSession session) {
        log.info("AttendanceController out 퇴근등록");
        EmployeeVo EVo = (EmployeeVo) session.getAttribute("loginVo");
        String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        service.updateAttendanceOutTime(EVo.getId());
        	
        AttendanceVo AVo = new AttendanceVo();
        AVo.setId(EVo.getId());
        AVo.setIn_date(currentDate.substring(0,10));
        
        
        AttendanceVo resultAVo = service.getAttendance(AVo);
        	
        if (resultAVo != null && resultAVo.getIn_date() != null) {
        	System.out.println("-------------if문 탄다-----");
            String inTime = resultAVo.getIn_date().substring(11, 16); // 출근 시간의 시간 부분을 추출
            String outTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm")); // 현재 시간을 HH:mm 형식으로 가져옴
            
            // 출퇴근 시간 비교하여 상태 설정
            String status;
            if (compareTime(inTime, "09:10") > 0 && compareTime(outTime, "17:50") < 0) {
                status = "지각/조퇴";
            } else if (compareTime(inTime, "09:10") > 0) {
                status = "지각";
            } else if (compareTime(outTime, "17:50") < 0) {
                status = "조퇴";
            } else {
                status = "정상";
            }

            resultAVo.setAtt_status(status);
            System.out.println(resultAVo);
            service.updateWorkStatus(resultAVo);
        }

        return "redirect:/main.do";
    }

    // 시간 비교 메서드
    private int compareTime(String time1, String time2) {
        return time1.compareTo(time2);
    }
    
    @GetMapping(value = "/myAttendance.do")
    public String myAttendance() {
    	log.info("AttendanceController myAttendance 나의 근태현황");
    	return "myAttendance";
    }

    
}

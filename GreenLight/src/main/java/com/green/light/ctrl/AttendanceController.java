package com.green.light.ctrl;

import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.light.model.service.IAttendanceService;
import com.green.light.model.service.IDepartmentService;
import com.green.light.model.service.IEmployeeService;
import com.green.light.vo.AttendanceVo;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AttendanceController {
	
	@Autowired
	private IAttendanceService service;
	
	@Autowired
	private IDepartmentService dService;

	@Autowired
	private IEmployeeService eService;
	
	@GetMapping("/in.do")
	public String in(HttpSession session, HttpServletResponse response) {
	    log.info("AttendanceController in 출근등록");
//	    String ip = "14.36.141.71";
//	    String ipAddress = "";
//	    try (Scanner s = new Scanner(new URL("https://api.ipify.org").openStream(), "UTF-8")) {
//	        ipAddress = s.useDelimiter("\\A").next();
//	    } catch (IOException e) {
//	        e.printStackTrace();
//	    }
	    EmployeeVo EVo = (EmployeeVo)session.getAttribute("loginVo");
	    System.out.println("Employee ID: " + EVo.getId());
	    service.insertAttendanceRecord(EVo.getId());
	    return "redirect:/main.do";
	}
	
    
    @GetMapping("/out.do")
    public String out(HttpSession session) {
        log.info("AttendanceController out 퇴근등록");
        EmployeeVo EVo = (EmployeeVo) session.getAttribute("loginVo");
        service.updateAttendanceOutTime(EVo.getId());// 아이디를 받아와서 퇴근시간을 찍어줌
        String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));//현재날짜를 String으로 저장
        	
        AttendanceVo AVo = new AttendanceVo(); //새로운 객체 생성
        AVo.setId(EVo.getId());
		AVo.setIn_date(currentDate/* .substring(0,10) */);
        
        AttendanceVo resultAVo = service.getAttendance(AVo);//id와 날짜가 일치하는 vo를 가져와서 resultAVo에 넣어줌
        System.out.println("getAttendance 직후 resultAVo :"+resultAVo);
        
        if (resultAVo != null && resultAVo.getIn_date() != null) {
        	System.out.println("-------------if문 탄다-----");
            String inTime = resultAVo.getIn_date().substring(11,16); // 출근 시간을 HH:mm 을 넣어야하는데 yyyy-MM-dd형식이라 처
            String outTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm")); // 현재 시간을 HH:mm 형식으로 가져옴
            System.out.println("inTime" + inTime +"outTime"+outTime);
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
            resultAVo.setIn_date(resultAVo.getIn_date().substring(0,10));
            System.out.println("updateWorkStatus resultAVo :"+resultAVo);
            service.updateWorkStatus(resultAVo);
        }

        return "redirect:/main.do";
    }

    // 시간 비교 메서드
    private int compareTime(String time1, String time2) {
        return time1.compareTo(time2);
    }
    
    @GetMapping(value = "/myAttendance.do")
    public String myAttendance(HttpSession session, Model model, String in_date) {
    	log.info("AttendanceController myAttendance 나의 근태현황");
        EmployeeVo EVo = (EmployeeVo) session.getAttribute("loginVo");
        AttendanceVo AVo = new AttendanceVo();
        AVo.setId(EVo.getId());
        
        if(in_date ==null) {
        LocalDate toDay = LocalDate.now();
        String month = toDay.format(DateTimeFormatter.ofPattern("yyyy-MM"));
        AVo.setIn_date(month);
        model.addAttribute("month",month);
        }else if(in_date != null) {
        AVo.setIn_date(in_date);
        model.addAttribute("month",in_date);
        }
        
        List<AttendanceVo> attList = service.getEmployeeDetails(AVo);
		model.addAttribute("attList",attList);
		
    	return "myAttendance";
    }
    
    
    
    
    @GetMapping(value = "/excel.do")
    public String excel(HttpSession session, Model model, HttpServletResponse response, String in_date) throws UnsupportedEncodingException{
    	log.info("AttendanceController excel");
    	
        EmployeeVo EVo = (EmployeeVo) session.getAttribute("loginVo");
        AttendanceVo AVo = new AttendanceVo();
        AVo.setId(EVo.getId());
        if(in_date ==null) {
        LocalDate toDay = LocalDate.now();
        String month = toDay.format(DateTimeFormatter.ofPattern("yyyy-MM"));
        AVo.setIn_date(month);
        }else if(in_date != null) {
        AVo.setIn_date(in_date);
        }
        
    	// 저장되는 파일명
    	String fn = "근무리스트";
    	//한글 깨짐 방지
    	String fileName = new String(fn.getBytes("UTF-8"),"8859_1");
    	List<AttendanceVo> lists = service.getEmployeeDetails(AVo);
    	
    	response.setHeader("Content-Disposition", "attachment; filename="+fileName +".xlsx");
		model.addAttribute("lists",lists);
    	return "excelView";
    }
    
    @GetMapping(value = "/employeeAttendance.do")
    public String employeeAttendance(Model model) {
    	log.info("AttendanceController employeeAttendance 직원관리 근태조회");
    	String in_date = "2024-03";
    	List<AttendanceVo> lists = service.getEmployeeAttendance(in_date);
    	List<DepartmentVo> dlists = dService.getAllDept();
    	List<EmployeeVo> elists = eService.getAllEmployee();
    	model.addAttribute("lists",lists);
    	model.addAttribute("dlists",dlists);
    	model.addAttribute("elists",elists);
    	return "employeeAttendance";
    }
    
    @GetMapping(value = "/employeeAttDetails.do")
    public String employeeAttDetails(String id,Model model, String in_date) {
    	log.info("AttendanceController employeeAttDetails 직원상세");
    	AttendanceVo AVo = new AttendanceVo();
    	AVo.setId(id);
    	
        if(in_date ==null) {
        LocalDate toDay = LocalDate.now();
        String month = toDay.format(DateTimeFormatter.ofPattern("yyyy-MM"));
        AVo.setIn_date(month);
        model.addAttribute("month",month);
        }else if(in_date != null) {
        AVo.setIn_date(in_date);
        model.addAttribute("month",in_date);
        }
        
      	List<AttendanceVo> lists = service.getEmployeeDetails(AVo);
      	EmployeeVo EVo = eService.getOneEmployee(id);
    	model.addAttribute("lists",lists);
    	model.addAttribute("EVo",EVo);
    	return "employeeAttDetails";
    }

    @PostMapping("/attUpdate.do")
    @ResponseBody
    public ResponseEntity<?> attUpdate(@RequestBody Map<String, Object> map) {
        log.info("AttendanceController attUpdate 전달받은 값 : {}", map);
        
        String in_time = (String)map.get("in_time");
        String out_time = (String)map.get("out_time");
        String day = (String)map.get("in_date");
        String in_date = day+" "+in_time;
        String out_date = day+" "+out_time;
        System.out.println(map.get("id"));
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("id", map.get("id"));
        parameterMap.put("in_date", in_date);
        parameterMap.put("out_date", out_date);
        parameterMap.put("day", day);
        System.out.println("메소드 실행전 syso"+parameterMap);
        int n = service.updateAttendanceTime(parameterMap);
        System.out.println(n);
        AttendanceVo updateVo = new AttendanceVo();
        updateVo.setId((String)map.get("id"));
        updateVo.setIn_date(day);
        String status;
        if (compareTime(in_time, "09:10") > 0 && compareTime(out_time, "17:50") < 0) {
            status = "지각/조퇴";
        } else if (compareTime(in_time, "09:10") > 0) {
            status = "지각";
        } else if (compareTime(out_time, "17:50") < 0) {
            status = "조퇴";
        } else {
            status = "정상";
        }
        updateVo.setAtt_status(status);
        service.updateWorkStatus(updateVo);
        if(n>0) {
			return ResponseEntity.ok("{\"msg\":\"SUCCESS\"}");
		}else {
			return ResponseEntity.ok("{\"msg\":\"UPDATEFAIL\"}");
		}
        
		} 
    
    
    
    
    
}

    


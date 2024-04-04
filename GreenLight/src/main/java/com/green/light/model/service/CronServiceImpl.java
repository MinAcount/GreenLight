package com.green.light.model.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.light.model.mapper.ICronDao;
import com.green.light.vo.AttendanceVo;
import com.green.light.vo.VacationVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CronServiceImpl implements ICronService {
	
	@Autowired
	private ICronDao dao;

	@Override
	public List<VacationVo> getOverVacation() {
		log.info("CronServiceImpl getOverVacation 서비스 크론");
		return dao.getOverVacation();
	}

	@Override
	public int insertOverVacation(Map<String, Object> map) {
		log.info("CronServiceImpl insertOverVacation 서비스 크론");
		return dao.insertOverVacation(map);
	}

	
	@Transactional(readOnly = false)
	@Override
//	@Scheduled(cron="0/10 * * * * *")//10초에 한번씩
	@Scheduled(cron = "0 10 1 * * *")//오전 1시 10분에 설정 
	public int OverVacationMediate() {
		log.info("CronServiceImpl OverVacationMediate 트렌젝션 처리(get/insert)");
		List<VacationVo> vo = dao.getOverVacation();
		Map<String, Object> map = new HashMap<String, Object>();
		int cnt = 0;
		for (int i = 0; i < vo.size(); i++) {
			String id = vo.get(i).getId();
			float remaining_leave = vo.get(i).getRemaining_leave();
			remaining_leave = Math.abs(remaining_leave);
			map.put("id", id);
			map.put("getsu", remaining_leave);
			cnt += dao.insertOverVacation(map);
		}
		System.out.println(cnt);
		return cnt;
	}
	
	
	@Scheduled(cron = "0 20 1 * * *")//오전 1시 20분에 설정 
//	@Scheduled(cron="0/10 * * * * *")//10초에 한번씩
	@Override
	public int updateLeaveNewEmployee() {
		log.info("CronDaoImpl updateLeaveNewEmployee 1년 미만 직원 연차 부여 크론");
		return dao.updateLeaveNewEmployee();
	}
	
	
	@Scheduled(cron = "0 30 1 * * *")//오전 1시 30분에 설정 
//	@Scheduled(cron="0/10 * * * * *")//10초에 한번씩
	@Override
	public int updateLeaveEmployee() {
		log.info("CronDaoImpl updateLeaveEmployee 1년 이상 근속직원 연차부여 크론");
		return dao.updateLeaveEmployee();
	}

	@Override
	public List<VacationVo> getEmpVacationStatus() {
		log.info("CronDaoImpl getEmpVacationStatus 작일 직원휴가상태조회 크론");
		return dao.getEmpVacationStatus();
	}

	@Override
	public AttendanceVo getEmpAttendanceStatus(String id) {
		log.info("CronDaoImpl getEmpAttendanceStatus 작일 출근현황조회 전달받은 id : {} 크론 ",id);
		return dao.getEmpAttendanceStatus(id);
	}

	@Override
	public int insertVacationAttendance(AttendanceVo vo) {
		log.info("CronDaoImpl insertVacationAttendance 작일 휴가자 근태등록 전달받은 값 : {} 크론 ",vo);
		return dao.insertVacationAttendance(vo);
	}

	@Override
	public int updateVacationAttendance(AttendanceVo vo) {
		return dao.updateVacationAttendance(vo);
	}
	
	// 휴가자의 자동근태등록 트렌젝션 처리
	@Transactional(readOnly = false)
	@Override
	public int setVacationAndAttendance() {
		log.info("CronDaoImpl setVacationAndAttendance 휴가자의 자동 근태 등록 트렌젝션 처리 크론");
		List<VacationVo> vacationList = dao.getEmpVacationStatus();
		//휴가자 없을경우 출력 및 반환
		if(vacationList == null) { System.out.println("전날 휴가자 없음");
		return 0; 
		}
		// 어제날짜를 String 으로 변환 yyyy-MM-dd 형식으로 되어있어서 db 데이터 타입의 경우 substring 으로 잘라서 사용해야함
		LocalDate yesterDay = LocalDate.now().minusDays(1);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String yesterdayString = yesterDay.format(formatter);
		
		for(VacationVo vacationVo : vacationList) {
		System.out.println("-----"+vacationVo);
		AttendanceVo attendanceVo = dao.getEmpAttendanceStatus(vacationVo.getId()); //전날 출근을 했는지 확인
		System.out.println("+++++"+attendanceVo);
		if(attendanceVo == null) {//전날 근태기록이 없으면 근태 insert 연차인사람
			AttendanceVo parameterAttendanceVo = new AttendanceVo();
			parameterAttendanceVo.setId(vacationVo.getId());
			if(vacationVo.getHalf().equals("N")) { // 반차가 아닌 연차인 직원 
				parameterAttendanceVo.setIn_date(" 09:00");
				parameterAttendanceVo.setOut_date(" 18:00");
				parameterAttendanceVo.setAtt_status("연차");
			}else if(vacationVo.getHalf().equals("A")) {
				if(vacationVo.getEnd_day().substring(0,10).equals(yesterdayString)) {//종료일이 어제날짜와 같으면 실행
					parameterAttendanceVo.setIn_date(" 09:00");
					parameterAttendanceVo.setOut_date(" 13:30");
					parameterAttendanceVo.setAtt_status("조퇴/반차");
				}else if(!vacationVo.getEnd_day().substring(0,10).equals(yesterdayString)){//휴가자체는 오전반차로 해당날에는 연차인경우
					parameterAttendanceVo.setIn_date(" 09:00");
					parameterAttendanceVo.setOut_date(" 18:00");
					parameterAttendanceVo.setAtt_status("연차");
				}
			}else if(vacationVo.getHalf().equals("P")) {
				if(vacationVo.getStart_day().substring(0,10).equals(yesterdayString)) {//시작일이 어제날짜와 같으면 실행
					parameterAttendanceVo.setIn_date(" 13:30");
					parameterAttendanceVo.setOut_date(" 18:00");
					parameterAttendanceVo.setAtt_status("지각/반차");
				}else if(!vacationVo.getEnd_day().substring(0,10).equals(yesterdayString)){//휴가자체는 오전반차로 해당날에는 연차인경우
					parameterAttendanceVo.setIn_date(" 09:00");
					parameterAttendanceVo.setOut_date(" 18:00");
					parameterAttendanceVo.setAtt_status("연차");
				}
			}else if(vacationVo.getHalf().equals("M")) {
				if(vacationVo.getEnd_day().substring(0,10).equals(yesterdayString)) {//종료일이 어제날짜와 같으면 실행
					parameterAttendanceVo.setIn_date(" 09:00");
					parameterAttendanceVo.setOut_date(" 13:30");
					parameterAttendanceVo.setAtt_status("조퇴/반차");
				}else if(vacationVo.getStart_day().substring(0,10).equals(yesterdayString)) {//시작일이 어제날짜와 같으면 실행
					parameterAttendanceVo.setIn_date(" 13:30");
					parameterAttendanceVo.setOut_date(" 18:00");
					parameterAttendanceVo.setAtt_status("지각/반차");
				}else if(!vacationVo.getEnd_day().substring(0,10).equals(yesterdayString)){//휴가자체는 오전반차로 해당날에는 연차인경우
					parameterAttendanceVo.setIn_date(" 09:00");
					parameterAttendanceVo.setOut_date(" 18:00");
					parameterAttendanceVo.setAtt_status("연차");
				}
				
			}
			
			parameterAttendanceVo.setIn_date(" 09:00");
			parameterAttendanceVo.setOut_date(" 18:00");
			parameterAttendanceVo.setAtt_status("연차");
		}else if(attendanceVo != null) {
			
		}
		
		
		
		
		
		
		
		
		
		
		
		}//for 문의 마지막 닫는괄호
		
		
		return 0;
	}
	
	

}

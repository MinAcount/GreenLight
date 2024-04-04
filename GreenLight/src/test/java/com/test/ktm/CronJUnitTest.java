package com.test.ktm;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.green.light.model.service.ICronService;
import com.green.light.vo.AttendanceVo;
import com.green.light.vo.VacationVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
@WebAppConfiguration
public class CronJUnitTest {
	
	@Autowired
	private ICronService cronService;

	@Test
	public void test() {

//		List<VacationVo> vo = cronService.getOverVacation();
		
		
//		System.out.println(vo);
//		Map<String, Object> map = new HashMap<String, Object>();
//		int cnt = 0;
//		for (int i = 0; i < vo.size(); i++) {
//			String id = vo.get(i).getId();
//			float remaining_leave = vo.get(i).getRemaining_leave();
//			remaining_leave = Math.abs(remaining_leave);
//			map.put("id", id);
//			map.put("getsu", remaining_leave);
//			cnt += cronService.insertOverVacation(map);
//		}
//		System.out.println(cnt);
//		assertEquals(2, cnt);
		
//		int n = cronService.updateLeaveNewEmployee();
//		assertEquals(0, n);
		
//		int m = cronService.updateLeaveEmployee();
//		assertEquals(2, m);
		
		// 오늘 휴가인 사람을 불러와
//		List<VacationVo> list = cronService.getEmpVacationStatus();
//		System.out.println(list);
//		for(VacationVo vacationVo : list) {
//			System.out.println("-----"+vacationVo);
//			AttendanceVo aVo = cronService.getEmpAttendanceStatus(vacationVo.getId()); // 
//			System.out.println("-----++++"+aVo);
//		}
		
//		AttendanceVo vo = cronService.getEmpAttendanceStatus(list.get(0).getId());
//		System.out.println(vo);
//		assertEquals(null, vo);
		
//		AttendanceVo vo = new AttendanceVo();
//		vo.setId(list.get(0).getId());
//		vo.setIn_date(" 09:00");
//		vo.setOut_date(" 12:00");
//		vo.setAtt_status("반차");
//		System.out.println(vo);
////		int n = cronService.insertVacationAttendance(vo);
//		int n = cronService.updateVacationAttendance(vo);
//		System.out.println(n);
//		assertEquals(1, n);
		
		LocalDate yesterDay = LocalDate.now().minusDays(1);
		LocalDate Day = LocalDate.now().plusDays(2);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String yesterdayString = Day.format(formatter);
		System.out.println(Day);
		
		List<VacationVo> list = cronService.getEmpVacationStatus();
		System.out.println("list==" +list);
		for(VacationVo vacationVo : list) {
			System.out.println("vacationVo==" +vacationVo);
			System.out.println("vacationVo.getEnd==" +vacationVo.getEnd_day().substring(0,10));
			
			if(vacationVo.getEnd_day().substring(0,10).equals(yesterdayString)) {
				System.out.println("if 문 성공한 쿼리vacationVo.getEnd==" +vacationVo.getEnd_day().substring(0,10));
			}else {
				System.out.println("실패실패");
			}
		}
		
	}

}

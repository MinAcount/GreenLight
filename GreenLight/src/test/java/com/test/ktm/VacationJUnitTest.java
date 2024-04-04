package com.test.ktm;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.green.light.model.service.ICronService;
import com.green.light.model.service.IVacationService;
import com.green.light.vo.VacationVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
@WebAppConfiguration
public class VacationJUnitTest {
	
	
	@Autowired
	private IVacationService service;

	
	@Test
	public void VacationJUnit() {
		
//		VacationVo vo = new VacationVo();
//		vo.setId("2403110901");
//		vo.setStart_day("2024-03");
//		
//		List<VacationVo> resultVo = service.selectVacationHistory(vo);
//		System.out.println(resultVo);
//		assertNotNull(resultVo);
		
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("select_year", "2024");
//		map.put("select_day", "2024-03");
//		List<VacationVo> resultVo = service.selectAllEmployeeVacation(map);
//		System.out.println(resultVo);
//		assertNotEquals(0,resultVo.size());
		
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("select_year", "2024");
//		map.put("select_day", "2024-03");
//		map.put("id", "2403110901");
//		List<VacationVo> resultVo = service.selectRemainingLeaveByMonth(map);
//		System.out.println(resultVo);
//		assertNotEquals(0,resultVo.size());
		
//		VacationVo vo = new VacationVo();
//		vo.setId("2403110901");
//		vo.setStart_day("2024-03-30");
//		vo.setEnd_day("2024-03-31");
//		vo.setHalf("A");
//		vo.setGetsu(1.5);
//		vo.setBigo("오전반차");
//		int n  = service.registerVacation(vo);
//		assertEquals(1, n);
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", "2403110901");
//		map.put("leave", 10);
		
//		int n  = service.grantLeave(map);
//		assertEquals(1, n);

//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", "2403110901");
//		map.put("getsu", 5);
//		int n  = service.adjustLeave(map);
//		assertEquals(1, n);

//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", "2303100101");
//		map.put("leave", 10);
//		map.put("getsu", 5);
//		int n  = service.updateLeave(map);
//		assertEquals(1, n);
		

		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("select_year", "2024");
		map.put("select_day", "2024-03-05");
		map.put("id", "2403110901");
		VacationVo resultVo = service.selectOneLeave(map);
		System.out.println(resultVo);
		assertNotEquals(null,resultVo);
		
		
		
	}

}

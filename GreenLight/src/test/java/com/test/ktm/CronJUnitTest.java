package com.test.ktm;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

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
import com.green.light.vo.VacationVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
@WebAppConfiguration
public class CronJUnitTest {
	
	@Autowired
	private ICronService cronService;

	@Test
	public void test() {

		List<VacationVo> vo = cronService.getOverVacation();
		System.out.println(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		int cnt = 0;
		for (int i = 0; i < vo.size(); i++) {
			String id = vo.get(i).getId();
			float remaining_leave = vo.get(i).getRemaining_leave();
			remaining_leave = Math.abs(remaining_leave);
			map.put("id", id);
			map.put("getsu", remaining_leave);
			cnt += cronService.insertOverVacation(map);
		}
		System.out.println(cnt);
		assertEquals(2, cnt);
		
		
	}

}

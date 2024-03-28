package com.test.ljw;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.green.light.model.service.IEmployeeService;
import com.green.light.vo.EmployeeVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@ WebAppConfiguration
public class EmployeeJUnitTest {
	
	@Autowired
	private IEmployeeService service;

	@Test
	public void EmployeeTest() {
		//로그인
		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", "2303100101");
//		map.put("password", "q1w2e3r4~!");
//		EmployeeVo vo = service.getLogin(map);
//		if(vo == null) {
//			
//		}else {
//			System.out.println("해당 사람의 fail 수"+vo.getFail());
//		}
//		System.out.println("해당 직원의 정보"+vo);
//		assertNotNull(vo);
		
		//비밀번호 찾기
//		map.put("id", "2303100101");
//		map.put("email", "2ji@naver.com");
//		EmployeeVo vo = service.getPassword(map);
//		System.out.println(vo.getPassword());
//		assertNotNull(vo);
		
		//비밀번호 변경
//		map.put("id", "2303100101");
//		map.put("password", "0000");
//		int n = service.updatePassword(map);
//		assertEquals(n, 1);
		
		//전체 직원 조회
//		List<EmployeeVo> list = service.getAllEmployee();
//		System.out.println(list);
//		assertNotEquals(list.size(), 0);
		
		//직원 상세 조회
//		EmployeeVo vo = service.getOneEmployee("2303100101");
//		System.out.println(vo);
//		assertNotNull(vo);
		
		//재직 상태별 직원 전체 조회
//		List<EmployeeVo> list = service.getAllEmployeeByStatus("N");
//		System.out.println(list);
//		assertNotEquals(list.size(), 0);
		
		//직원 검색
//		EmployeeVo vo = new EmployeeVo();
//		vo.setOpt("name");
//		vo.setKeyword("이");
//		List<EmployeeVo> list = service.getEmployeeBySearch(vo);
//		System.out.println(list);
//		assertNotEquals(list.size(), 0);
		
		//직원 정보 수정 및 권한 변경
//		EmployeeVo vo = new EmployeeVo("2303100101", "이지원", "ljw@gmail.com", "01084108423" ,"어디사는지 궁금해하지 마세요", "08", "05", "");
//		boolean isc = service.updateEmployee(vo);
//		assertTrue(isc);
		
		//직원 퇴사
		
		//퇴사일 수정
//		map.put("id", "2403120901");
//		map.put("exit_day", new Date());
//		int n = service.updateEmployeeExitDay(map);
//		assertEquals(1, n);
		
		//입사처리
		EmployeeVo vo = new EmployeeVo("","김은수", "deveasy@naver.com", "01074107410", "1995-10-07", "F", "where", "05", "02", "2004-02-11", "A", "");
		vo.setPassword("1q2w3e4r!!");
		System.out.println(vo);
		boolean isc = service.insertEmployee(vo);
		assertTrue(isc);
		
		//부서장 후보 조회
//		List<EmployeeVo> list = service.getDeptMgrHubo("09");
//		System.out.println(list);
//		assertNotEquals(0, list.size());
		
		//본부장 후보 조회
//		List<EmployeeVo> list = service.getHeadMgrHubo("01");
//		System.out.println(list);
//		assertNotEquals(0, list.size());
		
		//로그인 실패 횟수 조회
//		EmployeeVo vo = service.getLoginFail("2403120901");
//		System.out.println(vo);
//		assertNotNull(vo);
	}
	
	

}

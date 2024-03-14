package com.test.ljw;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.service.IEmployeeService;
import com.green.light.vo.EmployeeVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class EmployeeJUnitTest {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private IEmployeeService service;

	@Before
	public void test() {
		assertNotNull(sqlSessionTemplate);
	}
	
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
		map.put("id", "2303100101");
		map.put("email", "2ji@naver.com");
		EmployeeVo vo = service.getPassword(map);
		System.out.println(vo.getPassword());
		assertNotNull(vo);
		
		//비밀번호 변경
//		map.put("id", "2303100101");
//		map.put("password", "q1w2e3r4~!");
//		int n = service.updatePassword(map);
//		assertEquals(n, 1);
		
	}
	
	

}

package com.test.ljw;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.green.light.model.service.IDepartmentService;
import com.green.light.vo.DepartmentVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class DepartmentJUnitTest {
	
	
	@Autowired
	private IDepartmentService service;

	@Test
	public void DepartmentTest() {
//		//부서 전체 조회
//		List<DepartmentVo> list = service.getAllDept();
//		System.out.println(list);
//		assertNotEquals(0, list.size());
		
		//부서 상세 조회
//		DepartmentVo vo = service.getOneDept("04");
//		System.out.println(vo);
//		assertNotNull(vo);
		
		//부서 상세 정보 조회
//		DepartmentVo vo = service.getOneDept("04");
//		System.out.println(vo);
//		assertNotNull(vo);
		
		//본부별 부서 조회
//		List<DepartmentVo> list = service.getDeptByHead("01");
//		System.out.println(list);
//		assertNotEquals(0, list.size());
		
		//부서명 수정
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("deptno", "10");
//		map.put("dname", "초코우유개발팀");
//		int n = service.updateDeptName(map);
//		assertEquals(1, n);
		
		//부서 생성
//		map.put("headno", "04");
//		map.put("dname", "우유생산팀");
//		int n = service.insertDept(map);
//		assertEquals(1, n);
		
		//부서 삭제
//		int m = service.updateDeptDelete("12");
//		assertEquals(1, m);
		
		//부서 완전 삭제
//		int n = service.deleteDept("12");
//		assertEquals(1, n);
		
		//부서 복구
//		int n = service.restoreDept("12");
//		assertEquals(1, n);
		
		//부서장 등록 및 권한 부여
//		map.put("id", "2312120601");
//		map.put("deptno", "06");
//		boolean isc = service.updateDeptMgr(map);
//		assertTrue(isc);
		
		//직원이름 및 부서로 검색
//		map.put("opt", "name");
//		map.put("keyword", "김");
//		map.put("estatus", "Y");
//		List<DepartmentVo> list = service.getEmployeeBySearch(map);
//		System.out.println(list);
//		assertNotEquals(list.size(), 0);
	}

}

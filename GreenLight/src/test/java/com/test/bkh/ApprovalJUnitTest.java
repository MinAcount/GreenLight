package com.test.bkh;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.service.IApprovalService;
import com.green.light.vo.ApprJstreeVo;
import com.green.light.vo.EmployeeVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ApprovalJUnitTest {
	@Autowired
	private IApprovalService service;

	@Test
	public void test() {
		// 기안자의 부서장 조회 2403110901
		EmployeeVo vo1 = service.selectDrafterDeptMgr("2403110901");
		System.out.println(vo1);
		assertNotNull(vo1);
		
		// 부서별 부서장 조회 02
		EmployeeVo vo2 = service.selectDeptMgrByDept("09");
		System.out.println(vo2);
		assertNotNull(vo2);
	
	// 대표이사 조회
		EmployeeVo vo3 = service.selectCEO();
		System.out.println(vo3);
		assertNotNull(vo3);
		
		// ApprJstreeView 조회
		List<ApprJstreeVo> list = service.getAllApprJstreeView();
		System.out.println("-------------------------------------------------------"+list);
		assertNotEquals(0, list.size());
	}

}

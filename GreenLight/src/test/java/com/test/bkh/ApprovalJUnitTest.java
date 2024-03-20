package com.test.bkh;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.service.IApprovalService;
import com.green.light.vo.EmployeeVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ApprovalJUnitTest {
	@Autowired
	private IApprovalService service;

	@Test
	public void test() {
		String id = "2312120601";
		EmployeeVo employeeVo = service.selectDrafterDeptMgr(id);
		System.out.println(employeeVo);
		assertNotNull(employeeVo);
	}

}

package com.test.ljy;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.service.IReserveService;
import com.green.light.vo.CheckListVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReserveJUnitTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private IReserveService service;
	
	@Before
	public void test() {
		assertNotNull(sqlSessionTemplate);
	}
	
//	@Test
	public void AllReserveTest() {
		List<CheckListVo> lists = service.getAllReserve();
		System.out.println(lists);
		assertNotNull(lists);
	}
}

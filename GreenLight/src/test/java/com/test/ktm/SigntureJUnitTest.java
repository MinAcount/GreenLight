package com.test.ktm;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.service.ISignService;
import com.green.light.vo.SignVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class SigntureJUnitTest {

	
	@Autowired
	private ISignService service;
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Test
	public void SignTest() {


//		List<SignVo>  lists = service.selectAllSign("2403110901");
//		assertNotNull(lists);
		
		SignVo inVo = new SignVo();
		inVo.setId("2303100101");
		inVo.setSave_sign("clob");
		inVo.setMain("Y");
		
		int i = service.insertSign(inVo);
		assertEquals(i, 1);

//		inVo.setSignno("2");
//		
//		int d = service.delSign(inVo);
//		System.out.println(inVo);
//		assertEquals(d, 1);
//		int u = service.changeMainSign("2303100101");
//		assertEquals(u, 1);
		

		
//		SignVo inVo = new SignVo();
//		inVo.setId("2303100101");
//		inVo.setSignno("1");
//		service.updateMainSign(inVo);
//		assertNotNull(sessionTemplate);
		
	}

}

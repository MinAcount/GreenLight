package com.test.bkh;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.service.IJsTreeService;
import com.green.light.vo.JsTreeVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class JsTreeJUnitTest {
	@Autowired
	private IJsTreeService service;

	@Test
	public void test() {
		List<JsTreeVo> lists = service.JTSelectTemplate();
		System.out.println("========================================== "+lists);
		System.out.println("========================================== "+lists.size());
		assertNotEquals(0, lists.size());
	}

}

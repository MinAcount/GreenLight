package com.test.bkh;

import static org.junit.Assert.*;

import java.util.Base64;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.green.light.model.service.ITemplateService;
import com.green.light.vo.TemplateVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class TemplateJUnitTest {
	@Autowired
	private ITemplateService service;

	@Test
	public void test() {
		// selectMainTemplate
		TemplateVo selectedTmeplateVo = service.selectMainTemplate("002");
		System.out.println("========================================= " + selectedTmeplateVo);
//		assertNotNull(selectedTmeplateVo);
		
		// insertTemplate
//		TemplateVo insertTemplateVo = new TemplateVo("admin", "<h1>대출사유서2</h1>", "33", "06");
//		System.out.println("======================================================== " + insertTemplateVo);
//		int insertTemplateRow = service.insertTemplate(insertTemplateVo);
//		assertEquals(insertTemplateRow, 1);
		
		String content = selectedTmeplateVo.getContent();
		byte[] contents = content.getBytes();
		selectedTmeplateVo.setContent(Base64.getEncoder().encodeToString(contents));
		System.out.println("=========================== " + selectedTmeplateVo);
		int insertTemplateRow = service.insertTemplate(selectedTmeplateVo);
		assertEquals(1, insertTemplateRow);
	}

}

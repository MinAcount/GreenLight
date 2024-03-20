package com.test.bkh;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.service.ITemplateService;
import com.green.light.vo.TemplateVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class TemplateJUnitTest {
	@Autowired
	private ITemplateService service;

	@Test
	public void test() {
		// insertTemplate
		TemplateVo insertTemplateVo = new TemplateVo("admin", "<h1>휴가신청서</h1><table><thead><tr><td>제목</td><td>내용</td></tr></thead><tbody><tr><td></td><td></td></tr></tbody></table>", "01");
		int insertTemplateRow = service.insertTemplate(insertTemplateVo);
		assertEquals(insertTemplateRow, 1);
	}

}

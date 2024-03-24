package com.test.lhw;

import static org.junit.Assert.assertNotEquals;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.mapper.IDocumentDao;
import com.green.light.model.service.IDocumentService;
import com.green.light.vo.DocumentVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DocumentJUnitTest {

	
	@Autowired
	private IDocumentService service;
	
	
	@Test
	public void DocumentTest() {
		
//		List<DocumentVo> list = service.getAllDraft("2403110902");
//		System.out.println(list);
//		assertNotEquals(0, list.size());
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("id", "2403110902");
//		map.put("doc_status", "01");
//		List<DocumentVo> list = service.getAllDraftByDocStatus(map);
//		System.out.println("----------------------------"+list);
//		assertNotEquals(0, list.size());
		
		List<DocumentVo> list = service.getAllPendingApprovalDraft("2403110902");
		System.out.println("----------------------------"+list);
		assertNotEquals(0, list.size());
	}
	
	
}

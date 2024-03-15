package com.test.lhw;

import static org.junit.Assert.assertNotEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.mapper.IDocumentDao;
import com.green.light.vo.DocumentVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class DocumentJUnitTest {

	
	@Autowired
	private IDocumentDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Test
	public void DocumentTest() {
		List<DocumentVo> list = dao.getAllDraftDocument("2403110902");
		System.out.println(list);
		assertNotEquals(0, list.size());
	}
	
	
}

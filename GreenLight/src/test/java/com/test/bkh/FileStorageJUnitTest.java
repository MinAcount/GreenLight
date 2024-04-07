package com.test.bkh;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.green.light.model.service.IFileStorageService;
import com.green.light.vo.FileStorageVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class FileStorageJUnitTest {
	@Autowired
	private IFileStorageService service;

	@Test
	public void test() {
//		FileStorageVo fileVo = new FileStorageVo("202400001", "flexWrap_3.html", "flexWrap_344121.html", "payload", 2048);
//		int n = service.insertFile(fileVo);
//		assertEquals(1, n);
		
		FileStorageVo fVo = service.selectTemplateImg("002");
		System.out.println(fVo.getPayload());
		assertNotNull(fVo);
	}

}

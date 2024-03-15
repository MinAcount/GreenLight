package com.test.ljw;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.service.IHeadquartersService;
import com.green.light.vo.HeadquartersVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class HeadquartersJUnitTest {
	
	@Autowired
	private IHeadquartersService service;

	@Test
	public void HeadquartersTest() {
//		본부 전체 조회
//		List<HeadquartersVo> list = service.getAllHead();
//		System.out.println(list);
//		assertNotEquals(0, list.size());
//		본부 상세 조회
		HeadquartersVo vo = service.getOneHead("01");
		System.out.println(vo);
		assertNotNull(vo);
//		본부명 수정
//		본부 등록
//		본부장 등록 및 변경
//		본부 삭제
//		본부 완전 삭제
//		본부 복구
	}

}

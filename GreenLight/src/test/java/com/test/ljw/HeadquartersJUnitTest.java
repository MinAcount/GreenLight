package com.test.ljw;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class HeadquartersJUnitTest {
	
//	@Autowired
//	private IHeadquartersService service;

//	@Test
	public void HeadquartersTest() {
//		본부 전체 조회
//		List<HeadquartersVo> list = service.getAllHead();
//		System.out.println(list);
//		assertNotEquals(0, list.size());
		
//		본부 상세 조회
//		HeadquartersVo vo = service.getOneHead("01");
//		System.out.println(vo);
//		assertNotNull(vo);
		
//		본부명 수정
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("hname", "new본부");
//		map.put("headno", "06");
//		int n = service.updateHeadName(map);
//		assertEquals(1, n);
		
//		본부 등록
//		int n = service.insertHead("새본부");
//		assertEquals(1, n);
		
//		본부장 등록 및 변경
//		map.put("head_mgr", "2303100101");
//		map.put("headno", "04");
//		boolean isc = service.updateHeadMgr(map);
//		assertTrue(isc);
		
//		본부 삭제
//		int n = service.updateHeadDelete("07");
//		assertEquals(1, n);
		
//		본부 완전 삭제
//		int n = service.deleteHead("07");
//		assertEquals(1, n);
		
//		본부 복구
//		int n = service.restoreHead("07");
//		assertEquals(1, n);
	}

}

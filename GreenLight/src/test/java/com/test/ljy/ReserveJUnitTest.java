package com.test.ljy;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Types;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.light.model.service.IReserveService;
import com.green.light.vo.CheckListVo;
import com.green.light.vo.ReservationVo;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class ReserveJUnitTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private IReserveService service;
	
	@Before
	public void test() {
		assertNotNull(sqlSessionTemplate);
	}
	
	@Test
	public void AllReserveTest() {
	    List<CheckListVo> lists = service.getAllReserve();
	    System.out.println(lists);
	    assertNotNull(lists);
	}
	
//	@Test
	public void ConfReserveTeset() {
		String conf_id = "F2_005_202";
	    List<CheckListVo> lists = service.confListReserve(conf_id);
	    System.out.println(lists);
	    assertNotNull(lists);
	}
	
//	@Test
	public void DateReserveTeset() {
		String reserve_day = "2024-03-21";
	    List<CheckListVo> lists = service.dateListReserve(reserve_day);
	    System.out.println(lists);
	    assertNotNull(lists);
	}
	
//	@Test
	public void TimeReserveTest() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reserve_day", "2024-03-21");
		map.put("timeslot", "12");
		map.put("floor", "2");
		map.put("capacity", 10);
		
	    List<CheckListVo> lists = service.timeListReserve(map);
	    System.out.println(lists);
	    assertNotNull(lists);
	}
	
//	@Test
	public void MyReserveTest() {
		String applicant = "2312120601";
	    List<CheckListVo> lists = service.getMyReserve(applicant);
	    System.out.println(lists);
	    assertNotNull(lists);
	}
	
//	@Test
	public void OneReserveTest() {
		String reserveno = "240301R005";
	    CheckListVo vo = service.getOneReserve(reserveno);
	    System.out.println(vo);
	    assertNotNull(vo);
	}
	
//	@Test
	public void InsertReserveTest() throws ParseException {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date reserveDate = dateFormat.parse("2025-12-26 11:00");
		
	    ReservationVo reservationVo = new ReservationVo();
	    reservationVo.setApplicant("2312120601");
	    reservationVo.setPhone("010-1234-5678");
	    reservationVo.setReserve_date(reserveDate);
	    reservationVo.setMeetingtitle("프로젝트 회의");
	    
	    CheckListVo checkListVo = new CheckListVo();
	    checkListVo.setConf_id("F3_004_310");
	   
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("applicant", reservationVo.getApplicant());
	    map.put("phone", reservationVo.getPhone());
	    map.put("reserve_date", reservationVo.getReserve_date());
	    map.put("meetingtitle", reservationVo.getMeetingtitle());
	    map.put("conf_id", checkListVo.getConf_id());

	    System.out.println(map);
	    
	    int cnt = service.insertReserve(map);
	    System.out.println(cnt);
	    assertEquals(-1, cnt);
	}
	
//	@Test
    public void ProInsertTest() {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("applicant", "2312120601");
		parameters.put("phone", "010-1234-5678");
		parameters.put("reserve_date", java.sql.Timestamp.valueOf("2025-02-23 16:00:00"));
		parameters.put("meetingtitle", "프로젝트 회의");
		parameters.put("conf_id", "F3_004_310");

        
        int returnStatus = service.insertReserve(parameters);
        returnStatus = (int) parameters.get("v_count");

        if (returnStatus == 1) {
            System.out.println("INSERT가 성공적으로 이루어졌습니다.");
        } else if (returnStatus == -1) {
            System.out.println("중복된 예약이 있어 INSERT를 수행할 수 없습니다.");
        } else if (returnStatus == 0) {
            System.out.println("주어진 회의실 정보가 없습니다.");
        }
        else {
            System.out.println("문제가 발생했습니다.");
        }

        assertEquals(1, returnStatus);
    }
    
//  @Test
    public void UpdateReserveTest() {
    	ReservationVo vo = new ReservationVo();
    	vo.setReserveno("240301R001");
    	vo.setPhone("010-0320-0320");
    	vo.setMeetingtitle("상반기 프로젝트 회의(3월)");
    	int cnt = service.updateReserve(vo);
    	assertEquals(1, cnt);
    }
    
//	@Test
	public void DeleteReserveTest() {
	    String reserveno = "240301R004";
	    int cnt = service.deleteReserve(reserveno);
	    assertEquals(1, cnt);
	    
	    // 프로시저 실행에 사용할 매개변수 설정
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("v_reserveno", reserveno);
	    paramMap.put("v_success", null); // OUT 매개변수는 초기화하지 않습니다.

	    // 프로시저 실행
	    sqlSessionTemplate.selectOne("PRO_DELETE", paramMap);

	    // 성공 상태 확인
	    Integer success = (Integer) paramMap.get("v_success");
	    assertEquals(1, success.intValue()); // 성공 값이 1이어야 함
	}


}

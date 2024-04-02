package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.EmployeeVo;
import com.green.light.vo.VacationVo;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class VacationDaoImpl implements IVacationDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private final String NS = "com.green.light.model.mapper.VacationDaoImpl.";

	@Override
	public List<VacationVo> selectVacationHistory(VacationVo vo) {
		log.info("VacationDaoImpl selectVacationHistory 전달받은 값 {}",vo);
		return session.selectList(NS+"selectVacationHistory" , vo);
	}

	@Override
	public List<VacationVo> selectAllEmployeeVacation(Map<String, Object> map) {
		log.info("VacationDaoImpl selectAllEmployeeVacation 전달받은 값 {}",map);
		return session.selectList(NS+"selectAllEmployeeVacation" , map);
	}

	@Override
	public VacationVo selectRemainingLeaveByMonth(Map<String, Object> map) {
		log.info("VacationDaoImpl selectRemainingLeaveByMonth 전달받은 값 {}",map);
		return session.selectOne(NS+"selectRemainingLeaveByMonth" , map);
	}
	
	@Override
	public VacationVo selectRemainingLeaveByDay(Map<String, Object> map) {
		log.info("VacationDaoImpl selectRemainingLeaveByDay 전달받은 값 {}",map);
		return session.selectOne(NS+"selectRemainingLeaveByDay", map);
	}

	@Override
	public int registerVacation(VacationVo vo) {
		log.info("VacationDaoImpl registerVacation 전달받은 값 {}",vo);
		return session.insert(NS+"registerVacation" , vo);
	}

	@Override
	public int grantLeave(Map<String, Object> map) {
		log.info("VacationDaoImpl grantLeave 전달받은 값 {}",map);
		return session.update(NS+"grantLeave" , map);
	}

	@Override
	public int adjustLeave(Map<String, Object> map) {
		log.info("VacationDaoImpl adjustLeave 전달받은 값 {}",map);
		return session.update(NS+"adjustLeave" , map);
	}
	
	
	
	
}

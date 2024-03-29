package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.light.model.mapper.IVacationDao;
import com.green.light.vo.VacationVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class VacationServiceImpl implements IVacationService {

	@Autowired
	private IVacationDao dao;

	@Override
	public List<VacationVo> selectVacationHistory(VacationVo vo) {
		log.info("VacationServiceImpl selectVacationHistory 전달받은 값 : {}",vo);
		return dao.selectVacationHistory(vo);
	}

	@Override
	public List<VacationVo> selectAllEmployeeVacation(Map<String, Object> map) {
		log.info("VacationServiceImpl selectAllEmployeeVacation 전달받은 값 : {}",map);
		return dao.selectAllEmployeeVacation(map);
	}

	@Override
	public VacationVo selectRemainingLeaveByMonth(Map<String, Object> map) {
		log.info("VacationServiceImpl selectRemainingLeaveByMonth 전달받은 값 : {}",map);
		return dao.selectRemainingLeaveByMonth(map);
	}

	@Override
	public int registerVacation(VacationVo vo) {
		log.info("VacationServiceImpl registerVacation 전달받은 값 : {}",vo);
		return dao.registerVacation(vo);
	}

	@Override
	public int grantLeave(Map<String, Object> map) {
		log.info("VacationServiceImpl grantLeave 전달받은 값 : {}",map);
		return dao.grantLeave(map);
	}

	@Override
	public int adjustLeave(Map<String, Object> map) {
		log.info("VacationServiceImpl adjustLeave 전달받은 값 : {}",map);
		return dao.adjustLeave(map);
	}

	@Transactional(readOnly = true)
	@Override
	public int updateLeave(Map<String, Object> map) {
		log.info("VacationServiceImpl updateLeave 전달받은 값 : {}",map);
		int n = dao.grantLeave(map);
		int m = dao.adjustLeave(map);
		return (n+m)>0 ? 1 : 0;
	}
	
	
	
}

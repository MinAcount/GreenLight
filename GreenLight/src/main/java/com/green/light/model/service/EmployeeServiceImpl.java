package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.light.model.mapper.IEmployeeDao;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmployeeServiceImpl implements IEmployeeService {
	
	@Autowired
	private IEmployeeDao dao;

	@Transactional(readOnly = true)
	@Override
	public EmployeeVo getLogin(Map<String, Object> Map) {
		log.info("EmployeeServiceImpl getLogin 로그인 및 로그인 시도횟수 update");
		EmployeeVo vo = dao.getLogin(Map);
		int n = dao.updateFail(Map);
		return n>0 ? vo : null;
	}

	@Override
	public EmployeeVo getPassword(Map<String, Object> map) {
		log.info("EmployeeServiceImpl getPassword 비밀번호 찾기");
		EmployeeVo vo = dao.getPassword(map);
		return vo;
	}

	@Override
	public int updatePassword(Map<String, Object> map) {
		log.info("EmployeeServiceImpl updatePassword 비밀번호 변경");
		int n = dao.updatePassword(map);
		return n;
	}

	@Override
	public List<EmployeeVo> getAllEmployee() {
		log.info("EmployeeServiceImpl getAllEmployee 인사팀 전용 전체 직원 조회");
		List<EmployeeVo> list = dao.getAllEmployee();
		return list;
	}

	@Override
	public EmployeeVo getOneEmployee(String id) {
		log.info("EmployeeServiceImpl getOneEmployee 인사팀 전용 상세 조회");
		EmployeeVo vo = dao.getOneEmployee(id);
		return vo;
	}

	@Override
	public List<EmployeeVo> getAllEmployeeByStatus(String estatus) {
		log.info("EmployeeServiceImpl getAllEmployeeByStatus 인사팀 전용 전체 직원 재직상태별 조회");
		List<EmployeeVo> list = dao.getAllEmployeeByStatus(estatus);
		return list;
	}

	@Override
	public List<EmployeeVo> getEmployeeBySearch(EmployeeVo vo) {
		log.info("EmployeeServiceImpl getEmployeeBySearch 인사팀 전용 전체 직원 검색하여 조회");
		List<EmployeeVo> list = dao.getEmployeeBySearch(vo);
		return list;
	}
	
	@Transactional(readOnly = true)
	@Override
	public boolean updateEmployee(EmployeeVo vo) {
		log.info("EmployeeServiceImpl updateEmployee 인사팀 전용 직원 정보 수정 및 권한 변경");
		int n = dao.updateOneEmployee(vo);
		int m = dao.updateEmployeeAuth(vo.getId());
		return (n+m)>0 ? true : false;
	}

	@Transactional(readOnly = true)
	@Override
	public boolean updateExit(Map<String, Object> map, String id) {
		log.info("EmployeeServiceImpl updateExit 인사팀 전용 직원 퇴사 처리 및 부서장 공석 만들기");
		int m = dao.updateExitEmployee(map);
		EmployeeVo vo = dao.getOneEmployee(id);
		int n = 0;
		if(vo.getPosition() == "01") {
			n = dao.deleteDeptMgr(id);
		}else if(vo.getPosition() == "02") {
			n = dao.deleteHeadMgr(id);
		}else {
			
		}
		return (n+m)>0 ? true : false;
	}

	@Override
	public int updateEmployeeExitDay(Map<String, Object> map) {
		log.info("EmployeeServiceImpl updateEmployeeExitDay 인사팀 전용 직원 퇴사자 퇴사일 변경");
		int n = dao.updateEmployeeExitDay(map);
		return n;
	}

	@Transactional(readOnly = true)
	@Override
	public boolean insertEmployee(EmployeeVo vo) {
		log.info("EmployeeServiceImpl insertEmployee 인사팀 전용 직원 입사 처리 및 권한 부여");
		int n = dao.insertEmployee(vo);
		int m = dao.updateEmployeeAuth(vo.getId());
		return (n+m)>0 ? true : false;
	}

	@Override
	public List<EmployeeVo> getDeptMgrHubo(String deptno) {
		log.info("EmployeeServiceImpl getDeptMgrHubo 부서장 후보 조회");
		List<EmployeeVo> vo = dao.getDeptMgrHubo(deptno);
		return vo;
	}

	@Override
	public List<EmployeeVo> getHeadMgrHubo(String headno) {
		log.info("EmployeeServiceImpl getHeadMgrHubo 본부장 후보 조회");
		List<EmployeeVo> vo = dao.getHeadMgrHubo(headno);
		return vo;
	}

	@Override
	public EmployeeVo getLoginFail(String id) {
		log.info("EmployeeServiceImpl getLoginFail 로그인 실패 횟수 조회");
		EmployeeVo vo = dao.getLoginFail(id);
		return vo;
	}

}

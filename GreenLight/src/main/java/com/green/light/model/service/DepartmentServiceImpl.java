package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.light.model.mapper.IDepartmentDao;
import com.green.light.vo.DepartmentVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DepartmentServiceImpl implements IDepartmentService {
	
	@Autowired
	private IDepartmentDao dao;

	@Override
	public List<DepartmentVo> getAllDept() {
		log.info("DepartmentServiceImpl getAllDept 부서 전체 조회");
		List<DepartmentVo> list = dao.getAllDept();
		return list;
	}

	@Override
	public DepartmentVo getOneDept(String deptno) {
		log.info("DepartmentServiceImpl getOneDept 부서 상세 조회");
		DepartmentVo vo = dao.getOneDept(deptno);
		return vo;
	}

	@Override
	public List<DepartmentVo> getDeptByHead(String headno) {
		log.info("DepartmentServiceImpl getDeptByHead 본부별 부서 조회");
		List<DepartmentVo> list = dao.getDeptByHead(headno);
		return list;
	}

	@Override
	public int updateDeptName(Map<String, Object> map) {
		log.info("DepartmentServiceImpl updateDeptName 부서명 수정");
		int n = dao.updateDeptName(map);
		return n;
	}

	@Override
	public int insertDept(Map<String, Object> map) {
		log.info("DepartmentServiceImpl insertDept 부서 추가");
		int n = dao.insertDept(map);
		return n;
	}

	@Override
	public int updateDeptDelete(String deptno) {
		log.info("DepartmentServiceImpl updateDeptDelete 부서 삭제");
		int n = dao.updateDeptDelete(deptno);
		return n;
	}

	@Override
	public int deleteDept(String deptno) {
		log.info("DepartmentServiceImpl deleteDept 부서 완전 삭제");
		int n = dao.deleteDept(deptno);
		return n;
	}

	@Override
	public int restoreDept(String deptno) {
		log.info("DepartmentServiceImpl restoreDept 부서 복구");
		int n = dao.restoreDept(deptno);
		return n;
	}

	@Override
	public boolean updateDeptMgr(Map<String, Object> map) {
		log.info("DepartmentServiceImpl updateDeptMgr 부서장 등록 및 직책 변경");
		int n = dao.updateDeptPosition(map);
		int m = dao.updateDeptMgr(map);
		return (n+m)>0 ? true :false;
	}

}

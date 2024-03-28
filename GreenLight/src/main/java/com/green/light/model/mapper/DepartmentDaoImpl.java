package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.DepartmentVo;
import com.green.light.vo.EmployeeVo;

@Repository
public class DepartmentDaoImpl implements IDepartmentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NS = "com.green.light.model.mapper.DepartmentDaoImpl.";

	@Override
	public List<DepartmentVo> getAllDept() {
		return sqlSession.selectList(NS+"getAllDept");
	}

	@Override
	public DepartmentVo getOneDept(String deptno) {
		return sqlSession.selectOne(NS+"getOneDept", deptno);
	}

	@Override
	public List<DepartmentVo> getDeptByHead(String headno) {
		return sqlSession.selectList(NS+"getDeptByHead",headno);
	}

	@Override
	public int updateDeptName(Map<String, Object> map) {
		return sqlSession.update(NS+"updateDeptName", map);
	}

	@Override
	public int insertDept(Map<String, Object> map) {
		return sqlSession.insert(NS+"insertDept", map);
	}

	@Override
	public int updateDeptDelete(String deptno) {
		return sqlSession.update(NS+"updateDeptDelete",deptno);
	}

	@Override
	public int deleteDept(String deptno) {
		return sqlSession.delete(NS+"deleteDept", deptno);
	}

	@Override
	public int restoreDept(String deptno) {
		return sqlSession.update(NS+"restoreDept", deptno);
	}

	@Override
	public int updateDeptPosition(Map<String, Object> map) {
		return sqlSession.update(NS+"updateDeptPosition", map);
	}

	@Override
	public int updateDeptMgr(Map<String, Object> map) {
		return sqlSession.update(NS+"updateDeptMgr", map);
	}

	@Override
	public DepartmentVo selectDeptMgrByDept(String deptno) {
		return sqlSession.selectOne(NS+"selectDeptMgrByDept",deptno);
	}

	@Override
	public DepartmentVo selectDrafterDeptMgr(String id) {
		return sqlSession.selectOne(NS+"selectDrafterDeptMgr", id);

  public DepartmentVo getOneDeptInfo(String deptno) {
		return sqlSession.selectOne(NS+"getOneDeptInfo", deptno);
	}

}

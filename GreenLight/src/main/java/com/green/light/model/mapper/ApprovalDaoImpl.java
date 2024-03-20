package com.green.light.model.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.EmployeeVo;

@Repository
public class ApprovalDaoImpl implements IApprovalDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "com.green.light.model.mapper.ApprovalDaoImpl.";
	@Override
	public EmployeeVo selectDrafterDeptMgr(String id) {
		return sqlSession.selectOne(NS+"selectDrafterDeptMgr",id);
	}
	
	@Override
	public EmployeeVo selectDeptMgrByDept(String deptno) {
		return sqlSession.selectOne(NS+"selectDeptMgrByDept", deptno);
	}
}

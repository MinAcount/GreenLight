package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.ApprJstreeVo;
import com.green.light.vo.ApprovalVo;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.DocumentVo;
import com.green.light.vo.EmployeeVo;

@Repository
public class ApprovalDaoImpl implements IApprovalDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "com.green.light.model.mapper.ApprovalDaoImpl.";
	
	
	
	
	
	@Override
	public EmployeeVo selectCEO() {
		return sqlSession.selectOne(NS+"selectCEO");
	}

	@Override
	public List<ApprJstreeVo> getAllApprJstreeView() {
		return sqlSession.selectList(NS+"getAllApprJstreeView");
	}

	@Override
	public int insertApproval(ApprovalVo  apprVo) {
		return sqlSession.insert(NS+"insertApproval", apprVo);
	}

	@Override
	public int insertReference(List<ApprovalVo> ReferenceVos) {
		return sqlSession.insert(NS+"insertReference", ReferenceVos);
	}

	
}

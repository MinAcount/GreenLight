package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.green.light.vo.EmployeeVo;


@Repository
public class EmployeeDaoImpl implements IEmployeeDao {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private final String NS = "com.green.light.model.mapper.EmployeeDaoImpl";

	@Override
	public EmployeeVo getLogin(Map<String, Object> map) {
		return sqlsession.selectOne(NS+"getLogin", map);
	}

	@Override
	public int updateFail(Map<String, Object> map) {
		return sqlsession.update(NS+"updateFail",map);
	}

	@Override
	public EmployeeVo getPassword(Map<String, Object> map) {
		return sqlsession.selectOne(NS+"getPassword",map);
	}

	@Override
	public int updatePassword(Map<String, Object> map) {
		return sqlsession.update(NS+"updatePassword", map);
	}

	@Override
	public List<EmployeeVo> getAllEmployee() {
		return sqlsession.selectList(NS+"getAllEmployee");
	}

	@Override
	public EmployeeVo getOneEmployee(String id) {
		return sqlsession.selectOne(NS+"getOneEmployee", id);
	}

	@Override
	public List<EmployeeVo> getAllEmployeeByStatus(String estatus) {
		return sqlsession.selectList(NS+"getAllEmployeeByStatus",estatus);
	}

	@Override
	public List<EmployeeVo> getEmployeeBySearch(String option) {
		return sqlsession.selectList(NS+"getEmployeeBySearch",option);
	}

	@Override
	public int updateOneEmployee(EmployeeVo vo) {
		return sqlsession.update(NS+"updateOneEmployee", vo);
	}

	@Override
	public int updateEmployeeAuth(Map<String, Object> map) {
		return sqlsession.update(NS+"updateEmployeeAuth", map);
	}

	@Override
	public int updateExitEmployee(Map<String, Object> map) {
		return sqlsession.update(NS+"updateExitEmployee", map);
	}

	@Override
	public int updateEmployeeExitDay(Map<String, Object> map) {
		return sqlsession.update(NS+"updateEmployeeExitDay", map);
	}

	@Override
	public int isertEmployee(EmployeeVo vo) {
		return sqlsession.insert(NS+"isertEmployee", vo);
	}

}

package com.green.light.model.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.CheckListVo;
import com.green.light.vo.ReservationVo;

@Repository
public class ReserveDaoImpl implements IReserveDao{
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private final String NS = "com.green.light.model.mapper.ReserveDaoImpl.";

	@Override
	public List<CheckListVo> getAllReserve() {
		return sqlsession.selectList(NS+"getAllReserve");
	}

	@Override
	public List<CheckListVo> confListReserve(String conf_id) {
		return sqlsession.selectList(NS+"confListReserve", conf_id);
	}

	@Override
	public List<CheckListVo> dateListReserve(String reserve_day) {
		return sqlsession.selectList(NS+"dateListReserve", reserve_day);
	}

	@Override
	public List<CheckListVo> timeListReserve(Map<String, Object> map) {
		return sqlsession.selectList(NS+"timeListReserve", map);
	}

	@Override
	public List<CheckListVo> getMyReserve(String applicant) {
		return sqlsession.selectList(NS+"getMyReserve", applicant);
	}

	@Override
	public List<CheckListVo> getOneReserve(String reserveno) {
		return sqlsession.selectList(NS+"getOneReserve", reserveno);
	}

	@Override
	public int insertReserve(Map<String, Object> map) {
		return sqlsession.insert(NS+"insertReserve", map);
	}

	@Override
	public int updateReserve(ReservationVo vo) {
		return sqlsession.update(NS+"updateReserve", vo);
	}

	@Override
	public int deleteReserve(String reserveno) {
		return sqlsession.insert(NS+"deleteReserve", reserveno);
	}

	
}

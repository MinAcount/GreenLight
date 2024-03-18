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
		return sqlsession.selectList(NS+"getAllReserve", reserve_day);
	}

	@Override
	public List<CheckListVo> timeListReserve(Map<String, Object> map) {
		return sqlsession.selectList(NS+"getAllReserve", map);
	}

	@Override
	public List<CheckListVo> getMyReserve(String applicant) {
		return sqlsession.selectList(NS+"getAllReserve", applicant);
	}

	@Override
	public List<CheckListVo> getOneReserve(String reserveno) {
		return sqlsession.selectList(NS+"getAllReserve");
	}

	@Override
	public int insertReserve(ReservationVo rVo, CheckListVo cVo) {
		 Map<String, Object> paramMap = new HashMap<String, Object>();
		 paramMap.put("rVo", rVo);
		 paramMap.put("cVo", cVo);
		 return sqlsession.insert(NS + "insertReserve", paramMap);
	}

	@Override
	public int updateReserve(ReservationVo vo) {
		return sqlsession.update(NS+"updateReserve", vo);
	}

	@Override
	public int deleteReserve(ReservationVo rVo, CheckListVo cVo) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rVo", rVo);
		paramMap.put("cVo", cVo);
		return sqlsession.delete(NS+"deleteReserve", paramMap);
	}

	
}

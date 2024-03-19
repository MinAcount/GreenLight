package com.green.light.model.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.ConferenceVo;

@Repository
public class ConferenceDaoImpl implements IConferenceDao{
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private final String NS = "com.green.light.model.mapper.ConferenceDaoImpl.";


	@Override
	public List<ConferenceVo> getAllRoom() {
		return sqlsession.selectList(NS+"getAllRoom");
	}

	@Override
	public ConferenceVo getOenRoom(String conf_id) {
		return sqlsession.selectOne(NS+"getOenRoom", conf_id);
	}

	@Override
	public int insertRoom(ConferenceVo vo) {
		return sqlsession.insert(NS+"insertRoom", vo);
	}

	@Override
	public int updateRoom(ConferenceVo vo) {
		return sqlsession.update(NS+"updateRoom", vo);
	}

}

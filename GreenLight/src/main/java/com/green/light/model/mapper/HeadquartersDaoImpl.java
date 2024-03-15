package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.HeadquartersVo;

@Repository
public class HeadquartersDaoImpl implements IHeadquartersDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NS = "com.green.light.model.mapper.HeadquartersDaoImpl.";
	
	@Override
	public List<HeadquartersVo> getAllHead() {
		return sqlSession.selectList(NS+"getAllHead");
	}

	@Override
	public HeadquartersVo getOneHead(String headno) {
		return sqlSession.selectOne(NS+"getOneHead",headno);
	}

	@Override
	public int updateHeadName(Map<String, Object> map) {
		return sqlSession.update(NS+"updateHeadName", map);
	}

	@Override
	public int insertHead(String hname) {
		return sqlSession.insert(NS+"insertHead", hname);
	}

	@Override
	public int updateHeadPosition(Map<String, Object> map) {
		return sqlSession.update(NS+"updateHeadPosition", map);
	}

	@Override
	public int updateHeadMgr(Map<String, Object> map) {
		return sqlSession.update(NS+"updateHeadMgr", map);
	}

	@Override
	public int updateHeadDelete(String headno) {
		return sqlSession.update(NS+"updateHeadDelete", headno);
	}

	@Override
	public int deleteHead(String headno) {
		return sqlSession.delete(NS+"deleteHead", headno);
	}

	@Override
	public int restoreHead(String headno) {
		return sqlSession.update(NS+"restoreHead",headno);
	}

}

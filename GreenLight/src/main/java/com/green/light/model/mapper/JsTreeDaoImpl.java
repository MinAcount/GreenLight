package com.green.light.model.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.JsTreeVo;

@Repository
public class JsTreeDaoImpl implements IJsTreeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "com.green.light.model.mapper.JsTreeDaoImpl.";

	@Override
	public List<JsTreeVo> JTSelectTemplate() {
		return sqlSession.selectList(NS+"JTSelectTemplate");
	}

}

package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.NotificationVo;

@Repository
public class NotificationDaoImpl implements INotificationDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String NS = "com.green.light.model.mapper.NotificationDaoImpl.";
	
	@Override
	public List<NotificationVo> getAllNoti(String id) {
		return sqlSession.selectList(NS+"getAllNoti",id);
	}

	@Override
	public List<NotificationVo> getCurrNoti(String id) {
		return sqlSession.selectList(NS+"getCurrNoti",id);
	}

	@Override
	public List<NotificationVo> getGroupNoti(String id) {
		return sqlSession.selectList(NS+"getGroupNoti",id);
	}

	@Override
	public int insertNoti(Map<String, Object> map) {
		return sqlSession.insert(NS+"insertNoti", map);
	}

	@Override
	public int insertReceiver(String id) {
		return sqlSession.insert(NS+"insertReceiver", id);
	}

	@Override
	public int updateRead(Map<String, Object> map) {
		return sqlSession.update(NS+"updateRead",map);
	}

	@Override
	public int updateAllRead(String id) {
		return sqlSession.update(NS+"updateAllRead",id);
	}

}

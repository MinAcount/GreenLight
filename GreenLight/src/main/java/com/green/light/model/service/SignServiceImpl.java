package com.green.light.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.light.model.mapper.ISignDao;
import com.green.light.vo.SignVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SignServiceImpl implements ISignService {

	@Autowired
	private ISignDao dao;

	@Override
	public List<SignVo> selectAllSign(String id) {
		log.info("SignServiceImpl selectAllSign 전달받은 id : {}",id);
		return dao.selectAllSign(id);
	}

	@Override
	public int insertSign(SignVo signVo) {
		log.info("SignServiceImpl insertSign 전달받은 값 : {}",signVo);
		return dao.insertSign(signVo);
	}

	@Override
	public int delSign(SignVo signVo) {
		log.info("SignServiceImpl delSign 전달받은 값 : {}",signVo);
		return dao.delSign(signVo);
	}

	@Override
	public int changeMainSign(String id) {
		log.info("SignServiceImpl changeMainSign 전달받은 id : {}",id);
		return dao.changeMainSign(id);
	}

	@Override
	public int setMainSign(Map<String, Object> map) {
		log.info("SignServiceImpl setMainSign 전달받은 값 : {}",map);
		return dao.setMainSign(map);
	}
	
	@Transactional(readOnly = true)
	@Override
	public int updateMainSign(String id) {
		log.info("SignServiceImpl updateMainSign 전달받은 값 : {}",id);
		int n = dao.changeMainSign(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		int m = dao.setMainSign(map);
		return (n+m)>0 ? 1 : 0;
	}
}
 
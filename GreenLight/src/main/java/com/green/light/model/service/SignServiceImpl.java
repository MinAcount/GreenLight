package com.green.light.model.service;

import java.util.List;

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
	public int setMainSign(SignVo signVo) {
		log.info("SignServiceImpl setMainSign 전달받은 값 : {}",signVo);
		return dao.setMainSign(signVo);
	}
	
	@Transactional(readOnly = false)
	@Override
	public int updateMainSign(SignVo signVo) {
		log.info("SignServiceImpl updateMainSign 전달받은 값 : {}",signVo);
		int n = dao.changeMainSign(signVo.getId());
		int m = dao.setMainSign(signVo);
		return (n+m)>0 ? 1 : 0;
	}

	@Override
	public SignVo selectMainSign(String id) {
		log.info("SignServiceImpl SignServiceImpl 전달받은 값 : {}", id);
		return dao.selectMainSign(id);
	}
}
 
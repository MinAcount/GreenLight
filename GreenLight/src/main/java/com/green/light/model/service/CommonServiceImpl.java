package com.green.light.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.light.model.mapper.ICommonDao;
import com.green.light.vo.CommonVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CommonServiceImpl implements ICommonService{

	@Autowired
	private ICommonDao dao;
	
	@Override
	public List<CommonVo> getCommonList() {
		log.info("CommonServiceImpl getCommonList 공통테이블 전체조회");
		return dao.getCommonList();
	}

}

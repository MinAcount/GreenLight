package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.light.model.mapper.IHeadquartersDao;
import com.green.light.vo.HeadquartersVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class HeadquartersServiceImpl implements IHeadquartersService {

	@Autowired
	private IHeadquartersDao dao;
	
	@Override
	public List<HeadquartersVo> getAllHead() {
		log.info("HeadquartersServiceImpl getAllHead 본부 전체 조회");
		List<HeadquartersVo> list = dao.getAllHead();
		return list;
	}

	@Override
	public HeadquartersVo getOneHead(String headno) {
		log.info("HeadquartersServiceImpl getOneHead 본부 상세 조회");
		HeadquartersVo vo = dao.getOneHead(headno);
		return vo;
	}

	@Override
	public int updateHeadName(Map<String, Object> map) {
		log.info("HeadquartersServiceImpl updateHeadName 본부명 수정");
		int n = dao.updateHeadName(map);
		return n;
	}

	@Override
	public int insertHead(String hname) {
		log.info("HeadquartersServiceImpl insertHead 본부 추가");
		int n = dao.insertHead(hname);
		return n;
	}

	@Override
	public boolean updateHeadMgr(Map<String, Object> map) {
		log.info("HeadquartersServiceImpl updateHeadMgr 본부장 등록 및 권한 부여");
		int n = dao.updateHeadPosition(map);
		int m = dao.updateHeadMgr(map);
		return (n+m)>0 ? true : false;
	}

	@Override
	public int updateHeadDelete(String headno) {
		log.info("HeadquartersServiceImpl updateHeadDelete 본부 삭제");
		int n = dao.updateHeadDelete(headno);
		return n;
	}

	@Override
	public int deleteHead(String headno) {
		log.info("HeadquartersServiceImpl deleteHead 본부 완전 삭제");
		int n = dao.deleteHead(headno);
		return n;
	}

	@Override
	public int restoreHead(String headno) {
		log.info("HeadquartersServiceImpl restoreHead 본부 복구");
		int n = dao.restoreHead(headno);
		return n;
	}

}

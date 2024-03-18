package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.light.model.mapper.IConferenceDao;
import com.green.light.vo.ConferenceVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ConferenceServiceImpl implements IConferenceService{
	
	@Autowired
	private IConferenceDao dao;

	@Transactional(readOnly = true)
	@Override
	public List<ConferenceVo> getAllRoom() {
		log.info("ConferenceServiceImpl getAllRoom 회의실 전체조회");
		return dao.getAllRoom();
	}

	@Override
	public ConferenceVo getOenRoom(String conf_id) {
		log.info("ConferenceServiceImpl getOenRoom 회의실 전체조회");
		return dao.getOenRoom(conf_id);
	}

	@Override
	public int insertRoom(ConferenceVo vo) {
		log.info("ConferenceServiceImpl insertRoom 회의실 전체조회");
		return dao.insertRoom(vo);
	}

	@Override
	public int updateRoom(ConferenceVo vo) {
		log.info("ConferenceServiceImpl updateRoom 회의실 전체조회");
		return dao.updateRoom(vo);
	}
	
	

}

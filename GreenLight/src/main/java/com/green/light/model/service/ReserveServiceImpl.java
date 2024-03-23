package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.light.model.mapper.IReserveDao;
import com.green.light.vo.CheckListVo;
import com.green.light.vo.ReservationVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReserveServiceImpl implements IReserveService {

	@Autowired
	private IReserveDao dao;

	@Transactional(readOnly = true)
	@Override
	public List<CheckListVo> getAllReserve() {
		log.info("ReserveServiceImpl getAllReserve 예약 전체조회");
		return dao.getAllReserve();
	}

	@Override
	public List<CheckListVo> confListReserve(String conf_id) {
		log.info("ReserveServiceImpl confListReserve 선택 회의실 예약 조회");
		return dao.confListReserve(conf_id);
	}

	@Override
	public List<CheckListVo> dateListReserve(String reserve_day) {
		log.info("ReserveServiceImpl dateListReserve 선택 날짜 예약 조회");
		return dao.dateListReserve(reserve_day);
	}

	@Override
	public List<CheckListVo> timeListReserve(Map<String, Object> map) {
		log.info("ReserveServiceImpl timeListReserve 선택 회의실 및 선택 날짜의 예약 가능 시간 조회");
		return dao.timeListReserve(map);
	}

	@Override
	public List<CheckListVo> getMyReserve(String applicant) {
		log.info("ReserveServiceImpl getMyReserve 나의 예약 조회");
		return dao.getMyReserve(applicant);
	}

	@Override
	public CheckListVo getOneReserve(String reserveno) {
		log.info("ReserveServiceImpl getOneReserve 예약 정보 상세 조회");
		return dao.getOneReserve(reserveno);
	}

	@Override
	public int insertReserve(Map<String, Object> map) {
		log.info("ReserveServiceImpl insertReserve 예약");
		return dao.insertReserve(map);
	}

	@Override
	public int updateReserve(ReservationVo vo) {
		log.info("ReserveServiceImpl updateReserve 예약 수정");
		return dao.updateReserve(vo);
	}

	@Override
	public int deleteReserve(String reserveno) {
		log.info("ReserveServiceImpl deleteReserve 예약 취소");
		return dao.deleteReserve(reserveno);
	}

}

package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import com.green.light.vo.CheckListVo;
import com.green.light.vo.ReservationVo;

public interface IReserveService {

	//전체 예약 조회
	public List<CheckListVo> getAllReserve();
	//선택 회의실 예약 조회
	public List<CheckListVo> confListReserve(String conf_id);
	//선택 날짜 예약 조회
	public List<CheckListVo> dateListReserve(String reserve_day);
	//선택 회의실 및 선택 날짜의 예약 가능 시간 조회
	public List<CheckListVo> timeListReserve(Map<String, Object> map);
	//나의 예약 조회
	public List<CheckListVo> getMyReserve(String applicant);
	//예약 정보 상세 조회
	public List<CheckListVo> getOneReserve(String reserveno);
	//예약
	public int insertReserve(ReservationVo rVo, CheckListVo cVo);
	//예약 수정
	public int updateReserve(ReservationVo vo);
	//예약 취소
	public int deleteReserve(ReservationVo rVo, CheckListVo cVo);
}

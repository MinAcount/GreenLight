package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import com.green.light.vo.ConferenceVo;

public interface IConferenceDao {
	// 회의실 전체조회
	public List<ConferenceVo> getAllRoom();
	// 회의실 상세조회
	public ConferenceVo getOenRoom(String conf_id);
	// 회의실 입력
	public int insertRoom(ConferenceVo vo);
	// 회의실 변경 및 삭제
	public int updateRoom(ConferenceVo vo);
}

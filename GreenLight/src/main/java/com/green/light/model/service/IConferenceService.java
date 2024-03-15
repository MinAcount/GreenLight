package com.green.light.model.service;

import java.util.Map;

import com.green.light.vo.ConferenceVo;

public interface IConferenceService {
	public ConferenceVo getAllRoom(Map<String, Object> map);
	public ConferenceVo getOenRoom(Map<String, Object> map);
	public boolean insertRoom(ConferenceVo vo);
	public int updateRoom(String conf_id);
}

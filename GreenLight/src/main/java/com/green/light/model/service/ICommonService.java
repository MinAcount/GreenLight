package com.green.light.model.service;

import java.util.List;

import com.green.light.vo.CommonVo;

public interface ICommonService {

	//공통테이블 리스트 조회
	public List<CommonVo> getCommonList();
}

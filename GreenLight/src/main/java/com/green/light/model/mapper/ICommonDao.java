package com.green.light.model.mapper;

import java.util.List;

import com.green.light.vo.CommonVo;

public interface ICommonDao {

	//공통테이블 리스트 조회
	public List<CommonVo> getCommonList();
}

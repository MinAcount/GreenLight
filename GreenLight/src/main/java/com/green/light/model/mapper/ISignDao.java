package com.green.light.model.mapper;


import java.util.List;
import java.util.Map;

import com.green.light.vo.SignVo;


public interface ISignDao {
	

//	서명조회	selectAllSign
	public List<SignVo> selectAllSign(String id);
	
//	서명등록	insertSign
	public int insertSign(SignVo signVo);

//	서명삭제	delSign
	public int delSign(SignVo signVo);

//	대표서명 변경	changeMainSign
	public int changeMainSign(String id);

//	대표서명 지정	setMainSign
	public int setMainSign(SignVo signVo);
	
// 대표 서명 조회 selectMainSign
	public SignVo selectMainSign(String id);
}

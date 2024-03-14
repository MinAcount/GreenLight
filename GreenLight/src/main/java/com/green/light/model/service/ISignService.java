package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import com.green.light.vo.EmployeeVo;
import com.green.light.vo.SignVo;

public interface ISignService {

	
//	서명조회	selectAllSign
	public List<SignVo> selectAllSign(String id);
	
//	서명등록	insertSign
	public int insertSign(SignVo signVo);

//	서명삭제	delSign
	public int delSign(SignVo signVo);

//	대표서명 변경	changeMainSign
	public int changeMainSign(String id);

//	대표서명 지정	setMainSign
	public int setMainSign(Map<String, Object> map);
	
//  대표서명 변경 및 지정 updateMainSign
	public int updateMainSign(String id);
	
}

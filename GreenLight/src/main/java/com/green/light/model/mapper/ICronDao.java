package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import com.green.light.vo.VacationVo;

public interface ICronDao {
	
	
	public int autoCompleteWorkTime();
	
	public List<VacationVo>  getOverVacation();
	
	public int insertOverVacation(Map<String, Object> map);
	
	
	

}

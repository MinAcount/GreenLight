package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import com.green.light.vo.VacationVo;

public interface ICronService {
	
	public List<VacationVo>  getOverVacation();
	
	public int insertOverVacation(Map<String, Object> map);
	
	public int OverVacationMediate();

}

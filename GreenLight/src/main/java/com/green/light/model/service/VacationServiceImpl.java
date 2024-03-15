package com.green.light.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.green.light.model.mapper.IVacationDao;

public class VacationServiceImpl implements IVacationServiceImpl {

	@Autowired
	private IVacationDao dao;
	
	
	
}

package com.green.light.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.green.light.model.mapper.IAttendainceDao;

public class AttendainceServiceImpl implements IAttendainceService {

	@Autowired
	private IAttendainceDao dao;
	
}

package com.green.light.model.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class VacationDaoImpl implements IVacationDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private final String NS = "com.green.light.model.mapper.VacationDaoImpl.";

}

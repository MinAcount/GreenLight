package com.green.light.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.light.model.mapper.ITemplateDao;
import com.green.light.vo.TemplateVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class TemplateServiceImpl implements ITemplateService {
	@Autowired
	private ITemplateDao dao;
	
	@Override
	public TemplateVo selectMainTemplate(String tempcode) {
		log.info("TemplateServiceImpl selectMainTemplate 대표 문서양식 조회 : {}, tempcode");
		return dao.selectMainTemplate(tempcode);
	}
	
	@Override
	public int insertTemplate(TemplateVo vo) {
		log.info("TemplateServiceImpl insertTemplate 문서양식 등록 : {}", vo);
		return dao.insertTemplate(vo);
	}
}

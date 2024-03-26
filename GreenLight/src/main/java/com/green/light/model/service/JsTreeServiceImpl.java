package com.green.light.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.light.model.mapper.IJsTreeDao;
import com.green.light.vo.JsTreeVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class JsTreeServiceImpl implements IJsTreeService {
	@Autowired
	private IJsTreeDao dao;

	@Override
	public List<JsTreeVo> JTSelectTemplate() {
		log.info("JsTreeServiceImpl JTSelectTemplate JsTree용 문서양식 조회");
		return dao.JTSelectTemplate();
	}

}

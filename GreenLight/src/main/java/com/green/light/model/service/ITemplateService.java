package com.green.light.model.service;

import java.util.Map;

import com.green.light.vo.TemplateVo;

public interface ITemplateService {
	public TemplateVo selectMainTemplate(String tempcode);
	public int insertTemplate(TemplateVo vo);
}

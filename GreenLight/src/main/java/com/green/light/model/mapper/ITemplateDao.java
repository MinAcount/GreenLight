package com.green.light.model.mapper;

import java.util.Map;

import com.green.light.vo.TemplateVo;

public interface ITemplateDao {
	public TemplateVo selectMainTemplate(String tempno);
	public int insertTemplate(TemplateVo vo);
}

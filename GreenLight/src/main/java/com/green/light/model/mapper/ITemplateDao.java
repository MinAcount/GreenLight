package com.green.light.model.mapper;

import com.green.light.vo.TemplateVo;

public interface ITemplateDao {
	public TemplateVo selectMainTemplate(String tempcode);
	public int insertTemplate(TemplateVo vo);
}

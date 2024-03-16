package com.green.light.model.mapper;

import java.util.List;

import com.green.light.vo.DocumentVo;

public interface IDocumentDao {

	// 기안문서 전체조회 getAllDraft
	public List<DocumentVo> getAllDraft(String id);
	
	// 임시저장함 전체조회 getAllTempDraft
	public List<DocumentVo> getAllTempDraft(String id);
}

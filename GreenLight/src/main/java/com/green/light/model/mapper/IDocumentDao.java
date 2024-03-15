package com.green.light.model.mapper;

import java.util.List;

import com.green.light.vo.DocumentVo;

public interface IDocumentDao {

	// 기안문서 전체조회 getAllDraftDocument
	public List<DocumentVo> getAllDraftDocument(String id);
}

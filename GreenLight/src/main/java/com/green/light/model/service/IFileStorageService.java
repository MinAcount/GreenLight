package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import com.green.light.vo.FileStorageVo;

public interface IFileStorageService {
	public FileStorageVo selectTemplateImg(String tempno);
	public int insertFile(FileStorageVo fileVo);
//	파일 상세 조회 getOneFile
	public List<FileStorageVo> getOneFile(Map<String, Object> map);
//	파일 다운로드 downloadFile
	public FileStorageVo downloadFile(Map<String, Object> map);
//	파일 삭제 deleteOneFile
	public int deleteOneFile(Map<String, Object> map);
}

package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import com.green.light.vo.FileStorageVo;

public interface IFileStorageDao {
//	템플릿 미리보기 이미지 조회 selectTemplateImg
	public FileStorageVo selectTemplateImg(String tempno);
	public int insertFile(FileStorageVo fileVo);
//	파일 상세 조회 getOneFile
	public List<FileStorageVo> getOneFile(Map<String, Object> map);
//	파일 다운로드 downloadFile
	public FileStorageVo downloadFile(Map<String, Object> map);
//	파일 삭제 deleteOneFile
	public int deleteOneFile(Map<String, Object> map);
}

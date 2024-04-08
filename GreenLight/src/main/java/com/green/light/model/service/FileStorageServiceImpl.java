package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.light.model.mapper.IFileStorageDao;
import com.green.light.vo.FileStorageVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FileStorageServiceImpl implements IFileStorageService {
	@Autowired
	private IFileStorageDao dao;
	
	@Override
	public FileStorageVo getFiles(Map<String, Object> map) {
		log.info("FileStorageServiceImpl getFiles 특정문서에 저장되어있는 파일 조회 : {}", map);
		return dao.getFiles(map);
	}
	
	@Override
	public FileStorageVo selectTemplateImg(String tempno) {
		log.info("FileStorageServiceImpl selectTemplateImg 문서양식 미리보기 이미지 조회 : {}", tempno);
		return dao.selectTemplateImg(tempno);
	}
	
	@Override
	public int insertFile(FileStorageVo fileVo) {
		log.info("FileStorageServiceImpl insertFile 파일 업로드 : {}", fileVo);
		return dao.insertFile(fileVo);
	}


	@Override
	public List<FileStorageVo> getOneFile(Map<String, Object> map) {
		log.info("FileStorageServiceImpl getOneFile 파일 상세 조회");
		return dao.getOneFile(map);
	}


	@Override
	public int deleteOneFile(Map<String, Object> map) {
		log.info("FileStorageServiceImpl deleteOneFile 파일 삭제");
		return dao.deleteOneFile(map);
	}


	@Override
	public FileStorageVo downloadFile(Map<String, Object> map) {
		log.info("FileStorageServiceImpl downloadFile 파일 다운로드");
		return dao.downloadFile(map);
	}
}

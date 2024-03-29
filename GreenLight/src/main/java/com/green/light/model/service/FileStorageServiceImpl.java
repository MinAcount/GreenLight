package com.green.light.model.service;

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
	public int insertFile(FileStorageVo fileVo) {
		log.info("FileStorageServiceImplv insertFile 파일 업로드 : {}", fileVo);
		return dao.insertFile(fileVo);
	}
}

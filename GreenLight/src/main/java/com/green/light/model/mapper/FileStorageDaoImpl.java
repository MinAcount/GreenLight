package com.green.light.model.mapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.light.vo.FileStorageVo;

@Repository
public class FileStorageDaoImpl implements IFileStorageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS = "com.green.light.model.mapper.FileStorageDaoImpl.";
	
	@Override
	public int insertFile(FileStorageVo fileVo) {
		return sqlSession.insert(NS+"insertFile", fileVo);
	}
}

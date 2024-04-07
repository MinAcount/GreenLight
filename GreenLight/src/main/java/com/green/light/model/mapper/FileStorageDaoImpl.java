package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

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
	public FileStorageVo selectTemplateImg(String tempno) {
		return sqlSession.selectOne(NS+"selectTemplateImg", tempno);
	}
	
	@Override
	public int insertFile(FileStorageVo fileVo) {
		return sqlSession.insert(NS+"insertFile", fileVo);
	}

	@Override
	public List<FileStorageVo> getOneFile(Map<String, Object> map) {
		return sqlSession.selectList(NS+"getOneFile",map);
	}

	@Override
	public int deleteOneFile(Map<String, Object> map) {
		return sqlSession.delete(NS+"deleteOneFile",map);
	}

	@Override
	public FileStorageVo downloadFile(Map<String, Object> map) {
		return sqlSession.selectOne(NS+"downloadFile",map);
	}
}

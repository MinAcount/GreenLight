package com.green.light.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.light.model.mapper.IApprovalDao;
import com.green.light.model.mapper.IDepartmentDao;
import com.green.light.model.mapper.IDocumentDao;
import com.green.light.vo.ApprJstreeVo;
import com.green.light.vo.ApprovalVo;
import com.green.light.vo.DepartmentVo;
import com.green.light.vo.EmployeeVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ApprovalServiceImpl implements IApprovalService {
	@Autowired
	private IApprovalDao dao;
	
	
	
	
	
	@Override
	public EmployeeVo selectCEO() {
		log.info("ApprovalServiceImpl selectCEO 자동결재선 대표이사 조회");
		return dao.selectCEO();
	}

	@Override
	public List<ApprJstreeVo> getAllApprJstreeView() {
		log.info("ApprovalServiceImpl getAllApprJstreeView 결재선 설정을 위한 jstree view 조회");
		return dao.getAllApprJstreeView();
	}

	@Override
	public int insertApproval(ApprovalVo vo) {
		log.info("ApprovalServiceImpl insertApproval 결재선 추가");
		return dao.insertApproval(vo);
	}
}

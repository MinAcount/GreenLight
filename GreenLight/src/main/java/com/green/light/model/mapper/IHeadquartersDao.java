package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import com.green.light.vo.HeadquartersVo;

public interface IHeadquartersDao {
//	본부 전체 조회	getAllHead
	public List<HeadquartersVo> getAllHead();
//	본부 상세 조회	getOneHead
	public HeadquartersVo getOneHead(String headno);
//	본부명 수정	updateHeadName
	public int updateHeadName(Map<String, Object> map);
//	본부 등록	insertHead
	public int insertHead(String hname);
//	퇴사한 직원의 직책 지우기 deleteHeadMgr
	public int deleteHeadMgr(String id);
//	직원 직책 수거 및 부여	updateHeadPosition
	public int updateHeadPosition(Map<String, Object> map);
//	본부장 등록 및 변경	updateHeadMgr
	public int updateHeadMgr(Map<String, Object> map);
//	본부 삭제	updateHeadDelete
	public int updateHeadDelete(String headno);
//	본부 완전 삭제	deleteHead
	public int deleteHead(String headno);
//	본부 복구	restoreHead
	public int restoreHead(String headno);
}

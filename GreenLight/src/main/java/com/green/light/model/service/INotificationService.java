package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import com.green.light.vo.NotificationVo;

public interface INotificationService {
//	개인 알림 전체 조회 getAllNoti
	public List<NotificationVo> getAllNoti(String id);
//	메인 화면 최신 알림 조회 getCurrNoti
	public List<NotificationVo> getCurrNoti(String id);
//	알림 추가 (알림테이블,수신자테이블) insertNoti
	public boolean insertNoti(Map<String, Object> map, List<String> ids);
//	읽음 여부 변경 updateRead
	public int updateRead(Map<String, Object> map);
//	전체 읽음 updateAllRead
	public int updateAllRead(String id);
}

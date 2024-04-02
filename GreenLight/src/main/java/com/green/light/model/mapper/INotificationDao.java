package com.green.light.model.mapper;

import java.util.List;
import java.util.Map;

import com.green.light.vo.NotificationVo;

public interface INotificationDao {
//	개인 알림 전체 조회 getAllNoti
	public List<NotificationVo> getAllNoti(String id);
//	메인 화면 최신 알림 조회 getCurrNoti
	public List<NotificationVo> getCurrNoti(String id);
//	마이페이지 그룹별 알림 조회 getGroupNoti
	public List<NotificationVo> getGroupNoti(String id);
//	알림 추가 (알림테이블) insertNoti
	public int insertNoti(Map<String, Object> map);
//	알림 추가 (수신자테이블) insertReceiver
	public int insertReceiver(String id);
//	읽음 여부 변경 updateRead
	public int updateRead(Map<String, Object> map);
}

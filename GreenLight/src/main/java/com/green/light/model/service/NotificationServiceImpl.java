package com.green.light.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.light.model.mapper.INotificationDao;
import com.green.light.vo.NotificationVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class NotificationServiceImpl implements INotificationService{

	@Autowired
	private INotificationDao dao;
	
	@Override
	public List<NotificationVo> getAllNoti(String id) {
		log.info("NotificationServiceImpl getAllNoti 개인 알림 전체 조회");
		List<NotificationVo> list = dao.getAllNoti(id);
		return list;
	}

	@Override
	public List<NotificationVo> getCurrNoti(String id) {
		log.info("NotificationServiceImpl getCurrNoti 메인 화면 최신 알림 조회");
		List<NotificationVo> list = dao.getCurrNoti(id);
		return list;
	}

	@Override
	public List<NotificationVo> getGroupNoti(String id) {
		log.info("NotificationServiceImpl getGroupNoti 마이페이지 그룹별 알림 조회");
		List<NotificationVo> list = dao.getGroupNoti(id);
		return list;
	}

	@Override
	public boolean insertNoti(Map<String, Object> map, String id) {
		log.info("NotificationServiceImpl insertNoti 알림 추가(알림테이블, 수신자테이블)");
		int n = dao.insertNoti(map);
		int m = dao.insertReceiver(id);
		return (n+m)>0 ? true : false;
	}

	@Override
	public int updateRead(Map<String, Object> map) {
		log.info("NotificationServiceImpl updateRead 읽음 여부 변경");
		int n = dao.updateRead(map);
		return n;
	}

}

package com.green.light.socket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.security.web.access.intercept.DefaultFilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.green.light.vo.EmployeeVo;
import com.green.light.vo.MessageVo;

import lombok.extern.slf4j.Slf4j;

@Component(value = "chat.do")
@Slf4j
public class WebSocketHandler extends TextWebSocketHandler{
	
	private ArrayList<WebSocketSession> list;
	
	public WebSocketHandler() {
		list = new ArrayList<WebSocketSession>();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("afterConnectionEstablished 실행 {}", session);
		super.afterConnectionEstablished(session);
		
		list.add(session);
		Map<String, Object> sessionMap = session.getAttributes();
		System.out.println("sessionMap : " + sessionMap);
		
		
		
		System.out.println("웹소켓 세션 갯수 : " + list.size());
		System.out.println(sessionMap.get("loginVo"));
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("handleTextMessage 실행 : {}", session.getAttributes());
		log.info("handleTextMessage 실행 : {}", message);
		
		String payload = message.getPayload();
		
		String txt = "";
		System.out.println("Message received from " + session.getId() + ": " + payload);
		System.out.println(payload);
		
		Map<String, Object> mySession = session.getAttributes();
		
		EmployeeVo loginVo = (EmployeeVo)mySession.get("loginVo");
		String myIdSession = loginVo.getId();
		
		MessageVo mesgVo = new MessageVo();
		mesgVo.setWritter(loginVo.getId());
		mesgVo.setChat_id("1");
		session.getAttributes().put("messageVo", mesgVo);
		MessageVo messageVo = (MessageVo)mySession.get("messageVo");
		String myChatIdSession = messageVo.getChat_id();
		
		System.out.println(mySession);
		System.out.println(myChatIdSession);
		System.out.println(myIdSession);
		
		String msg[] = payload.split(":");
		System.out.println("msg : " + msg[1]);
		if(list.size() == 0) {
			System.out.println("ddddddddddddddddddd");
		}
		for(WebSocketSession s : list) {
			
			Map<String, Object> sessionMap = s.getAttributes();
			String otherChatIdSession = messageVo.getChat_id();
			String otherIdSession = loginVo.getId();
			System.out.println("otherChatIdSession : " + otherChatIdSession);
			System.out.println("otherIdSession : " + otherIdSession);
			if(myChatIdSession.equals(otherChatIdSession)) {
				System.out.println("if1 : ");
				if(msg[1].equals(otherIdSession)) {
					System.out.println("if2 : ");
					String newMsg = loginVo.getName() + payload.replace(payload.substring(0, payload.trim().indexOf(":") + 1), "");
					txt = newMsg;
				} else {
					System.out.println("if3 : ");
					String newMsgPart1 = payload.substring(0, payload.trim().indexOf(":"));
					String newMsgPart2 = newMsgPart1 + payload.substring(payload.trim().indexOf(":") + 1);
					txt = newMsgPart2;
				}
//				s.sendMessage(new TextMessage(txt));
			}
		}
//		session.sendMessage(message);
		super.handleTextMessage(session, message);
	}
}
	








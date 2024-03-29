package com.green.light.socket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

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
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.info("handleTextMessage 실행 : {}", session.getAttributes());
		log.info("handleTextMessage 실행 : {}", message);
		super.handleTextMessage(session, message);
		String payload = message.getPayload();
		String txt = "";
		System.out.println("Message received from " + session.getId() + ": " + payload);
		System.out.println(payload);
		
		Map<String, Object> mySession = session.getAttributes();
		String myChatIdSession = (String)mySession.get("chat_id");
		String myIdSession = (String)mySession.get("id");
		System.out.println(myChatIdSession);
		System.out.println(myIdSession);

//		String payload2 = payload.substring(0, payload.indexOf(":")).trim();
			for(WebSocketSession s : list) {
				Map<String, Object> sessionMap = s.getAttributes();
				String otherChatIdSession = (String)sessionMap.get("chat_id");
				String otherIdSession = (String)sessionMap.get("id");
				if(myChatIdSession.equals(otherChatIdSession)) {
					if(payload.equals(otherIdSession)) {
	//					String newMsg = "[나]" + payload.replace(payload.substring(0, payload.trim().indexOf(":") + 1), "");
						String newMsg = "[나]" + payload;
						txt = newMsg;
						System.out.println(txt);
					} else {
						String newMsgPart1 = "[다른 사람]" + payload;
	//					String newMsgPart1 = payload.substring(0, payload.trim().indexOf(";"));
	//					String newMsgPart2 = "[" + newMsgPart1 + "]" + payload.substring(payload.trim().indexOf(":") + 1);
	//					txt = newMsgPart2;
						txt = newMsgPart1;
					}
					s.sendMessage(new TextMessage(txt));
				}
			}
			super.handleTextMessage(session, message);
		}
}
	








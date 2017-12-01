package com.spring.madi;

import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

//서버단의 SocketHandler 정의
//Websocket에서 서버단의 프로세스를 정의할 수 있다
public class SocketHandler extends TextWebSocketHandler {
	
	private final Logger logger= LogManager.getLogger(getClass());
	
	//접속하는 사용자에 대한 세션을 보관하기 위해 정의
	private Set<WebSocketSession> sessionSet= new HashSet<WebSocketSession>();
	
	public SocketHandler () {
		super();
		this.logger.info("create SocketHandler instance!");
	}
	
	//클라이언트에서 연결을 종료할 경우 발생하는 이벤트
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		
		sessionSet.remove(session);
		this.logger.info("remove session!");
	}
	
	//클라이언트에서 접속해서 성공할 경우 발생하는 이벤트
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		
		sessionSet.add(session);
		this.logger.info("add session!");
	}
	
	//클라이언트에서 서버로 연결돼서 send를 이용해서 메시지 발송을 한 경우 발생하는 이벤트 핸들링
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);
	//이걸로 다중채팅이나 일대일채팅도 구현가능	
		for (WebSocketSession client_session: this.sessionSet) {
			if (client_session.isOpen()) {
				try {
					//해당 세션 객체로 메시지를 보냄
					client_session.sendMessage(message);
				} catch (Exception ignored) {
					this.logger.error("fail to send message!", ignored);
				}
			}
		}
	}
	
	//전송 중 에러 발생시에 호출
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		this.logger.error("web socket error!", exception);
	}
	
	//메시지가 긴 경우 분할해서 보낼 수 있는지 여부를 결정하는 메소드
	@Override
	public boolean supportsPartialMessages() {
		this.logger.info("call method!");
		
		return false;
	}
	
}

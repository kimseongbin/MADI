package com.spring.madi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler{
	
	// 방법 1 : 1:1 채팅
	private Map<String, WebSocketSession> sessinMap = new HashMap<String, WebSocketSession>();
	// 방법 2 : 전체 채팅
	private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	
	// 클라이언트로부터 연결 시 이 메서드가 실행된다
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 맵을 쓸때 방법
		// session.getId()부분에 HttpSession으로부터 받은 user_id를 넣으면 참 좋을텐데
		// session.put(session.getId(), session)
		
		// 리스트를 쓸때 방법
		sessionList.add(session);
		
		log(session.getId() + "가 연결됨");
		
		//System.out.println("채팅방 입장자 : " + session.getPrincipal().getName());
	}
	// 클라이언트가 웹 소켓 서버로 데이터를 전송했을 경우 받는 session은 
	// 전송을 보낸 클라이언트이다
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log(session.getId() + "로 부터 "+message.getPayload());
		
		//연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
		//getPrincipal()를 이용해서 세션에 몰려있는 유저의 정보를 불러온다. 세선의 정브는 User를 이용한 것과 동일하다.
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getId() + " | " +message.getPayload()));
		}
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		// 페이지 이동하거나, 새로고침하면 이녀석이 실행되네??
		log(status.getReason());
		
		sessionList.remove(session);
		
		//Map 삭제
		//sessions.remove(session.getId());
		
		log(session.getId() + "의 연결 종료");
		
		//System.out.println("채팅방 퇴장자 : " + session.getPrincipal().getName());
		
	}
	
	
	private void log(String log) {
		System.out.println(log);
	}
}

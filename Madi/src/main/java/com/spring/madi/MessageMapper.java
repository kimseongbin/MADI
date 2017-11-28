package com.spring.madi;

import java.util.ArrayList;

public interface MessageMapper {
	
	// 성빈 : 내게 온 메시지를 조회하는 메소드
	ArrayList<MessageVO> getMyMessageById(String user_id);
	// 성빈 : 읽은 메시지 제거 (업데이트) 하는 메소드
	// check_msg의 값을 0 (안읽음) 에서  1 (읽음)으로 변경
	// 전달 파라메터가 messageVO인 경우
//	void removeMessageByMessageId(MessageVO messageVO);
	// 성빈 : 읽은 메시지 제거 (업데이트) 하는 메소드
	// check_msg의 값을 0 (안읽음) 에서  1 (읽음)으로 변경
	// 전달 파라메터가 String인 경우
	void removeMessageByMessageId(String message_id);
	// 성빈 : 읽은 메시지 제거 (업데이트) 하는 메소드
	// check_msg의 값을 0 (안읽음) 에서  1 (읽음)으로 변경
	// 전달 파라메터가 int인 경우
//	void removeMessageByMessageId(int message_id);
	// 성빈 : 메시지를 보내는 메소드
	void sendMessageToId(MessageVO messageVO);
}

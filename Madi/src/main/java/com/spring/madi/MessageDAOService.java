package com.spring.madi;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageDAOService implements MessageDAO{

	@Autowired
	private SqlSession sqlSession;
	
	// 성빈 : 내게 온 메시지를 조회하는 메소드
	@Override
	public ArrayList<MessageVO> getMyMessageById(String user_id) {
		
		MessageMapper messageMapper = sqlSession.getMapper(MessageMapper.class);
		ArrayList<MessageVO> messageList = messageMapper.getMyMessageById(user_id);
		if(messageList.size()==0) {
			System.out.println("내개 온 메시지가 없습니다.");
		}
		return messageList;
	}
	// 성빈 : 특정인에게 메시지를 보내는 메소드
	// user_id에 보내려 하는 사람의 아이디가 담겨야 하고
	// sender_id에 보내는 내 아이디가 있어야 합니다.
	@Override
	public void sendMessageToId(MessageVO messageVO) {
		
		MessageMapper messageMapper = sqlSession.getMapper(MessageMapper.class);
		try {
			messageMapper.sendMessageToId(messageVO);
		} catch (Exception e) {
			System.out.println("메시지 전송에 실패했습니다.");
			e.printStackTrace();
		}
	}
	// 성빈 : 읽은 메시지 제거 (업데이트) 하는 메소드
	// check_msg의 값을 0 (안읽음) 에서  1 (읽음)으로 변경
	// 전달 파라메터가 messageVO인 경우
	/*@Override
	public void removeMessageByMessageId(MessageVO messageVO) {
		MessageMapper messageMapper = sqlSession.getMapper(MessageMapper.class);
		try {
			messageMapper.removeMessageByMessageId(messageVO);
		} catch (Exception e) {
			System.out.println("메시지 삭제에 실패했습니다.");
			e.printStackTrace();
		}
		
	}*/
	// 성빈 : 읽은 메시지 제거 (업데이트) 하는 메소드
	// check_msg의 값을 0 (안읽음) 에서  1 (읽음)으로 변경
	// 전달 파라메터가 String인 경우
	@Override
	public void removeMessageByMessageId(String message_id) {
		MessageMapper messageMapper = sqlSession.getMapper(MessageMapper.class);
		try {
			messageMapper.removeMessageByMessageId(message_id);
		} catch (Exception e) {
			System.out.println("메시지 삭제에 실패했습니다.");
			e.printStackTrace();
		}
		
	}
	// 성빈 : 읽은 메시지 제거 (업데이트) 하는 메소드
	// check_msg의 값을 0 (안읽음) 에서  1 (읽음)으로 변경
	// 전달 파라메터가 int인 경우
	/*@Override
	public void removeMessageByMessageId(int message_id) {
		MessageMapper messageMapper = sqlSession.getMapper(MessageMapper.class);
		try {
			messageMapper.removeMessageByMessageId(message_id);
		} catch (Exception e) {
			System.out.println("메시지 삭제에 실패했습니다");
			e.printStackTrace();
		}
		
	}*/
	
	

}

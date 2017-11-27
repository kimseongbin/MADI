package com.spring.madi;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NotificationDAOService implements NotificationDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override // 성빈 : 내게 온 알림 메시지를 조회하는 메소드
	public ArrayList<NotificationVO> getMyNoticeById(String user_id) {
		
		NotificationMapper notificationMapper = sqlSession.getMapper(NotificationMapper.class);
		ArrayList<NotificationVO> notificationList = notificationMapper.getMyNoticeById(user_id);
		if(notificationList.size()==0) {
			System.out.println("내게 온 알림이 없습니다.");
		}
		return notificationList;
	}

	/*@Override // 성빈 : 알림 메시지 확인 후 제거하는 메소드 (다음 번 조회 때 읽어오지 못하도록)
	public void removeNoticeByNoticeId(NotificationVO notificationVO) {
		NotificationMapper notificationMapper = sqlSession.getMapper(NotificationMapper.class);
		try {
			notificationMapper.removeNoticeByNoticeId(notificationVO);
		} catch (Exception e) {
			System.out.println("알림 메시지 삭제에 실패했습니다");
			e.printStackTrace();
		}
		
	}*/

	@Override // 성빈 : 알림 메시지 확인 후 제거하는 메소드 (다음 번 조회 때 읽어오지 못하도록)
	public void removeNoticeByNoticeId(String notice_id) {
		NotificationMapper notificationMapper = sqlSession.getMapper(NotificationMapper.class);
		try {
			notificationMapper.removeNoticeByNoticeId(notice_id);
		} catch (Exception e) {
			System.out.println("알림 메시지 삭제에 실패했습니다");
			e.printStackTrace();
		}
	}

	/*@Override // 성빈 : 알림 메시지 확인 후 제거하는 메소드 (다음 번 조회 때 읽어오지 못하도록)
	public void removeNoticeByNoticeId(int notice_id) {
		NotificationMapper notificationMapper = sqlSession.getMapper(NotificationMapper.class);
		try {
			notificationMapper.removeNoticeByNoticeId(notice_id);
		} catch (Exception e) {
			System.out.println("알림 메시지 삭제에 실패했습니다");
			e.printStackTrace();
		}
	}*/
	
	// (각 페이지에서 공유, 좋아요, 댓글 버튼에 notificationVO객체로 값을 받을 수 있는 hidden 타입의 input 태그를 배치해놔야 함)
	// ex>> input type="hidden" name="notice_to" value="[팔로우 할 사람 아이디]"
	// ex>> input type="hidden" name="notice_from" value="[내 아이디]"
	// ex>> input type="hidden" name="notice_content" value="000이 좋아요를 눌렀습니다" (좋아요 버튼인 경우)
	// ex>> input type="hidden" name="notice_tpye" value="팔로우" (팔로우 버튼인 경우)
	@Override // 성빈 : 알림 메시지를 발생시키는 메소드
	public void sendNoticeById(NotificationVO notificaitonVO) {
		NotificationMapper notificationMapper = sqlSession.getMapper(NotificationMapper.class);
		try {
			notificationMapper.sendNoticeById(notificaitonVO);
		} catch (Exception e) {
			System.out.println("알림 메시지 전송에 실패했습니다");
			e.printStackTrace();
		}
	}
	
	
}

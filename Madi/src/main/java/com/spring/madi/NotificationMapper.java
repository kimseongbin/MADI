package com.spring.madi;

import java.util.ArrayList;

public interface NotificationMapper {

	// 성빈 : 내게 온 알림 메시지 조회 메소드
	// 전달 값은 String user_id (Session에서 읽어 온 아이디를 넘겨주면 됨)
	ArrayList<NotificationVO> getMyNoticeById(String user_id);
	//  성빈 : 읽어 온 메시지를 확인한 후 사용자가 알림 내용을 삭제한 경우 CHECK 값을 1로 만들 때 사용하는 UPDATE 쿼리 -->
	// 전달 파라미터 NotificationVO notificationVO 인 경우-->
	//void removeNoticeByNoticeId(NotificationVO notificationVO);
	// 성빈 : 읽어 온 메시지를 확인한 후 사용자가 알림 내용을 삭제한 경우 CHECK 값을 1로 만들 때 사용하는 UPDATE 쿼리 -->
	// 전달 파라미터 String notice_id 인 경우-->
	void removeNoticeByNoticeId(String notice_id);
	// 성빈 : 읽어 온 메시지를 확인한 후 사용자가 알림 내용을 삭제한 경우 CHECK 값을 1로 만들 때 사용하는 UPDATE 쿼리 -->
	// 전달 파라미터 int notice_id 인 경우-->
	//void removeNoticeByNoticeId(int notice_id);
	// 성빈 : 알림 메시지 보내기 -->
	// 팔로우, 좋아요, 댓글 남길 경우 NOTIFICATION에 이 INSERT 쿼리가 실행되어야 함 -->
	/*(각 페이지에서 공유, 좋아요, 댓글 버튼에 notificationVO객체로 값을 받을 수 있는 hidden 타입의 input 태그를 배치해놔야 함)
	ex>> input type="hidden" name="notice_to" value="[팔로우 할 사람 아이디]"
	ex>> input type="hidden" name="notice_from" value="[내 아이디]"
	ex>> input type="hidden" name="notice_content" value="000이 좋아요를 눌렀습니다" (좋아요 버튼인 경우)
	ex>> input type="hidden" name="notice_tpye" value="팔로우" (팔로우 버튼인 경우)*/	
	void sendNoticeById(NotificationVO notificaitonVO);
	// (성빈) : 알림 아디로 단일 알림 데이터 읽어오기
	NotificationVO getMyNoticeByNoticeId(String notice_id);
	
	int checkFollowRequest(MemberFollowVO memberFollowVO);
	
	ArrayList<NotificationVO> getFollowRequest(String user_id);
}

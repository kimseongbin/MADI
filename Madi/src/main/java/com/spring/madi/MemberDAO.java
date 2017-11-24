package com.spring.madi;

import java.util.ArrayList;

public interface MemberDAO {
	//(진산) 로그인한 아이디 자신에 대한 member정보
	MemberVO getMember(String user_id);
	//(진산)팔로워 수 카운트
	ArrayList<MemberFollowVO> getFollower(String user_id);	
	//(진산)팔로잉 수 카운트
	ArrayList<MemberFollowVO> getFollowing(String user_id);
	//(진산)팔로워 추천 리스트
	ArrayList<MemberFollowVO> getRecommendFollower();
	//(진산)팔로잉 한 명 삭제
	void deleteFollowing(String following_user_id, String user_id);
	//(진산)팔로워 한 명 삭제
	void deleteFollower(String user_id, String following_user_id);
	//(진산)팔로잉 한 명 추가
	void insertFollowing(MemberFollowVO memberFollow);
	//성빈 : 로그인 체크를 위한 password 조회 메소드
	public MemberVO getPasswordByUserId(MemberVO memberVO);
	// 성빈 : 회원가입 메소드 (입력된 회원정보를 member 테이블에 insert한다)
	public void setMember(MemberVO memberVO);
	// 성빈 : Member_Box 테이블에서 내 재료 목록을 불러오기 위한 조회 메소드
	public ArrayList<MemberBoxVO> getMyIrdntByUserId(String user_id);
	// 성빈 : 회원  기본 정보 조회 쿼리 (사용안한 메소드, 필요할까봐)
	public MemberVO getUserInfoById(String user_id);
}

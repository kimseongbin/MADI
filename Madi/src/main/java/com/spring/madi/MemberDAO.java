package com.spring.madi;

import java.util.ArrayList;

import com.spring.madi.MemberFollowVO;
import com.spring.madi.MemberVO;

public interface MemberDAO {
	//(진산) 로그인한 아이디 자신에 대한 member정보
	MemberVO getMember(String user_id);
	//(진산) 임시--MemberFollow에서 팔로잉한 사람 불러오기
	//MemberFollowVO getFollowing_user_id(String user_id);
	//(진산)팔로워 수 카운트
	ArrayList<MemberFollowVO> getFollower(String user_id);	
	//(진산)팔로잉 수 카운트
	ArrayList<MemberFollowVO> getFollowing(String user_id);
	//(진산)팔로워 추천 리스트
	ArrayList<MemberFollowVO> getRecommendFollower(String user_id);
	//(진산)팔로잉 한 명 삭제
	void deleteFollowing(String following_user_id, String user_id);
	//(진산)팔로워 한 명 삭제
	void deleteFollower(String user_id, String following_user_id);
	//(진산)팔로잉 한 명 추가
	void insertFollowing(String user_id, String following_user_id, String user_img, String following_user_img);
}

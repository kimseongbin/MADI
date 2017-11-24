package com.spring.madi;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper {
	//(진산) 로그인한 아이디 자신에 대한 member정보
	MemberVO getMember(String user_id);
	//(진산) 임시 MemberFollow에서 following_user_id 불러오기
	//MemberFollowVO getFollowing_user_id(String user_id);
	//(진산) 팔로워 수 구하기
	ArrayList<MemberFollowVO> getFollower(String user_id);
	//(진산) 팔로잉 수 구하기
	ArrayList<MemberFollowVO> getFollowing(String user_id);
	//(진산) 팔로워 추천 리스트
	ArrayList<MemberFollowVO> getRecommendFollower(String user_id);
	//(진산) 팔로잉 한 명 삭제
	void deleteFollowing(@Param("user_id") String user_id, @Param("following_user_id") String following_user_id);
	//(진산) 팔로워 한 명 삭제
	void deleteFollower(@Param("user_id") String user_id, @Param("following_user_id") String following_user_id);
	//(진산) 팔로잉 한 명 추가
	void insertFollowing(@Param("user_id") String user_id, @Param("following_user_id") String following_user_id,
			@Param("user_img") String user_img, @Param("following_user_img") String following_user_img);
	

}

package com.spring.madi;

import org.springframework.stereotype.Component;

@Component
public class MemberFollowVO {
	
	private String user_id;
	private String following_user_id;
	//(진산)팔로워, 팔로잉 받기위해 임시로 생성
	private String user_img;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getFollowing_user_id() {
		return following_user_id;
	}
	public void setFollwing_user_id(String following_user_id) {
		this.following_user_id = following_user_id;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	
	
}

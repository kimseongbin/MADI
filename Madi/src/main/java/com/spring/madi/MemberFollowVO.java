package com.spring.madi;

import org.springframework.stereotype.Component;

@Component
public class MemberFollowVO {
	
	private String user_id;
	private String follwing_user_id;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getFollwing_user_id() {
		return follwing_user_id;
	}
	public void setFollwing_user_id(String follwing_user_id) {
		this.follwing_user_id = follwing_user_id;
	}
	
	
}

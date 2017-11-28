package com.spring.madi;

import org.springframework.stereotype.Component;
@Component
public class MemberBoxVO {
	
	private String user_id;
	private String my_irdnt;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMy_irdnt() {
		return my_irdnt;
	}
	public void setMy_irdnt(String my_irdnt) {
		this.my_irdnt = my_irdnt;
	}

}

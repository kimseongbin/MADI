package com.spring.madi;

import org.springframework.stereotype.Component;

/*차단 목록*/
@Component
public class BlockMemberVO {
	
	private String user_id;
	private String block_user_id;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBlock_user_id() {
		return block_user_id;
	}
	public void setBlock_user_id(String block_user_id) {
		this.block_user_id = block_user_id;
	}
}

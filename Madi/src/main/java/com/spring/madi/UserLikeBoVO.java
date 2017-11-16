package com.spring.madi;

import org.springframework.stereotype.Component;

@Component
public class UserLikeBoVO {
	
	private String user_id;
	private int board_num;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
	
	

}

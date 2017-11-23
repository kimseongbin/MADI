package com.spring.madi;

import org.springframework.stereotype.Component;

@Component
public class BoardReplyVO {
	
	private int board_num;
	private String user_id;
	private String rep_content;
	//(진산) 본문 댓글의 프로필 이미지를 위해 넣음
	private String user_img;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRep_content() {
		return rep_content;
	}
	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	
	

}

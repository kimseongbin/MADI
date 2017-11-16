package com.spring.madi;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;
@Component
public class BoardVO {
	
	private int board_num;
	private String user_id;
	private String board_title;
	private String board_summry;
	private String board_img;
	private int board_recipe_id;
	private int board_like;
	private Timestamp board_time;
	
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
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_summry() {
		return board_summry;
	}
	public void setBoard_summry(String board_summry) {
		this.board_summry = board_summry;
	}
	public String getBoard_img() {
		return board_img;
	}
	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}
	public int getBoard_recipe_id() {
		return board_recipe_id;
	}
	public void setBoard_recipe_id(int board_recipe_id) {
		this.board_recipe_id = board_recipe_id;
	}
	public int getBoard_like() {
		return board_like;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}
	public Timestamp getBoard_time() {
		return board_time;
	}
	public void setBoard_time(Timestamp board_time) {
		this.board_time = board_time;
	}
	
	
	

}
